# Local Docker MCP automation (optional)

This optional MCP endpoint runs the existing `Makefile` and `automation/`
commands. It does **not** implement a second deployment path. The full
preflight inside `import_apps_to_dev.sh` and the DEV/TEST schema/workspace
verification in the Bash scripts remain mandatory.

The service returns a job ID instead of waiting for long-running SQLcl and
offline tests. Its **single worker** serializes all jobs submitted through this
MCP service, retains stdout/stderr and SQLcl diagnostics in a Docker volume,
and lets an agent poll job state. A disconnected MCP client does not cancel a
job; restarting the container interrupts running jobs. Interrupted DB jobs
must be inspected before a new request; they are never automatically retried.

## Image and setup

The optional overlay uses `automation/docker/Dockerfile.automation`:

- Python 3.12, Oracle JDK **25**, SQLcl (currently downloaded using Oracle's
  `sqlcl-latest.zip`), Node 24, Make, ShellCheck, Terraform, Git, rsync and
  the official Python MCP SDK.
- Java 25 is explicitly supported by SQLcl 26.2. The Dockerfile currently uses
  Oracle's `latest` download URLs for JDK and SQLcl; pin versions and verify
  download checksums when reproducible builds are required.
- The image runs as non-root `agent` with configurable UID/GID. Repo content
  is **bind-mounted**, not copied into the image. The optional `.dockerignore`
  excludes local credentials and generated files from the build context.
- A dedicated, read-only SQLcl profile is **copied into the container's private
  writable home** at startup; this prevents SQLcl from changing the host profile.

Start from the repository root. Create a SQLcl profile directory containing
**DEV and disposable TEST connections only**, configured for the correct
network hosts and schemas. No QA/PROD credentials should be accessible in
this service. In the existing DB/ORDS Compose network the database hostname is
`blog-tst-db`, **not** `localhost`. An external database needs an accessible
hostname and network access from the container.

```sh
export SQLCL_PROFILE_DIR=/absolute/path/to/dev-test-dbtools
export HOST_UID="$(id -u)"
export HOST_GID="$(id -g)"

# The base Compose file defines `automation`; the overlay adds a one-shot
# volume initializer. Do not use --no-deps: it must run before the worker.
docker compose -f automation/docker/docker-compose.yml \
  -f automation/docker/docker-compose.mcp.yml \
  up -d --build automation
```

**First startup is automatic.** `automation-mcp-volume-init` runs once as
root in a one-shot BusyBox container that mounts **only the three named Docker
volumes** (`.venv`, `node_modules` and job state), not the host checkout. It
sets their ownership to `${HOST_UID}:${HOST_GID}`; Compose waits for it to
finish successfully before starting `automation`. The long-running MCP
service still runs as non-root `agent`, with all Linux capabilities dropped.
The service's `automation/mcp/start.sh` installs pre-commit, actionlint and npm
dependencies inside those volumes on first boot and when its dependency inputs
change, always using `--no-hooks` to avoid modifying host Git hooks. Normal
restarts reuse the already-installed tools. Network access to package
registries is needed for the first bootstrap.

To inspect progress or troubleshoot initialization:

```sh
docker compose -f automation/docker/docker-compose.yml \
  -f automation/docker/docker-compose.mcp.yml logs automation-mcp-volume-init automation

docker compose -f automation/docker/docker-compose.yml \
  -f automation/docker/docker-compose.mcp.yml exec automation make doctor
```

If you change `HOST_UID`/`HOST_GID` or restore Docker volumes with different
ownership, recreate the services (without `--no-deps`):

```sh
docker compose -f automation/docker/docker-compose.yml \
  -f automation/docker/docker-compose.mcp.yml \
  up -d --build --force-recreate automation
```

**Do not** repair ownership via `/workspace/.venv` or
`/workspace/node_modules` from a capability-restricted container, or run
dependency bootstrap as root. The initializer addresses the volumes directly
and has no access to the host checkout. `docker compose run --no-deps` bypasses
initialization. The base Compose file defines the single `automation` MCP
service alongside optional TEST DB/ORDS services; `up automation` starts only
it and the initializer, not TEST/ORDS. If a container from the old overlay's
`automation-mcp` service is still running, inspect its jobs and stop it before
starting `automation`: both bind host port 8765.

Configure the coding agent to use **Streamable HTTP** at
`http://127.0.0.1:8765/mcp`. It is bound to host localhost only, and has no
remote authentication. **Do not publish this port to the LAN or Internet.**
Keep the Docker socket unavailable to the agent/container. Note that a coding
agent with unrestricted *host* shell access may still call `make` directly.
MCP is a convenience for asynchronous execution, not an authorization boundary.

## VS Code and Cline configuration

**Cline in VS Code:** the Cline extension does not currently provide a
repository-local MCP configuration that it automatically discovers. Its MCP
server list is user-scoped. Open **Cline > MCP Servers > Configure > Configure
MCP Servers** and merge the server entry from
[`examples/cline-mcp-settings.json`](../mcp/examples/cline-mcp-settings.json) into
Cline's existing `mcpServers` object (preserve other servers):

```json
{
  "mcpServers": {
    "apex_blog": {
      "type": "streamableHttp",
      "url": "http://127.0.0.1:8765/mcp",
      "disabled": false,
      "autoApprove": []
    }
  }
}
```

The `streamableHttp` transport spelling is **Cline-specific**. Leaving the
`type` out can select legacy SSE instead. Check the Cline MCP panel for a
connected server and exposed tools. Start by calling `automation_list` or
`automation_status` for a known job, not a database-changing target.

Because this Cline registration is global, its tools may remain visible in
other workspaces. The container is still bound to **this** checkout, so a
call from another workspace could change this repository. Disable the entry
when working on unrelated projects, or use separate isolated Cline profiles
where your environment supports them. The workspace rule
[`.clinerules/project-workflow.md`](../../.clinerules/project-workflow.md) guides
Cline in this repository but **is not an access-control boundary**. Keep
`autoApprove` empty, especially for `automation_start` and potentially
sensitive logs.

**VS Code built-in Copilot harness (not Cline):** current VS Code uses
workspace-root `.mcp.json` with a `mcpServers` object and `"type": "http"`.
Copy [`examples/vscode-workspace-mcp.json`](../mcp/examples/vscode-workspace-mcp.json)
into that path if you use its built-in agent:

```sh
cp automation/mcp/examples/vscode-workspace-mcp.json .mcp.json
```

This is **not** the Cline extension's MCP settings. The older
`.vscode/mcp.json` with a `servers` object belongs to VS Code's deprecated
Local harness and should not be used for new Copilot configuration. If you
only use Cline, you do not need a workspace-root `.mcp.json` at all.

### Oracle APEXlang skill (optional, host-side)

Oracle publishes a full APEXlang skill at
<https://github.com/oracle/skills/tree/main/apex/apexlang>. It helps the
**agent** generate and edit correct `.apx` source, while SQLcl in the Docker
image validates and executes the existing automation. The skill is not a
Docker/SQLcl runtime dependency. Cline discovers project skills from
`.cline/skills/` and global skills from `~/.cline/skills/`; install the
Oracle skill on the host where **Cline runs**, not solely in the container.
Oracle also documents `skills sync` within SQLcl as an installation method;
verify its destination actually matches Cline's skill directories. Do not
blindly run it in the container, where files may end up in the container's
private home instead of VS Code's agent environment.

The repository targets **APEX 26.1**. Select Oracle's corresponding
APEXlang reference guidance and treat `AGENTS.md`, `.clinerules/`, and
`automation/` as authoritative for release restrictions. The Oracle skill's
optional direct SQLcl import/connection workflows must not bypass the
existing human-authorization requirements for DEV/TEST changes.

`make doctor` skips the Git-hook installation check inside this container:
bootstrap uses `--no-hooks` to avoid changing the host Git checkout. All tool
and repository checks still run.

The Docker image needs a non-root UID that can write the checkout and Docker
volumes. On Docker Desktop or rootless hosts, adapt the UID/GID settings.
Saved connections are copied from the read-only host mount; configure SQLcl
inside the container using the same `HOME` path and test connectivity only
after human authorization. A successful `make doctor` proves only tool
presence, **not** database connectivity or permission.

## MCP tools

| Tool | Behavior |
| --- | --- |
| `automation_start(target)` | Queue a strictly allowlisted Make target; return job ID immediately |
| `automation_status(job_id)` | State, process ID, timestamps and latest stage |
| `automation_logs(job_id, offset, max_bytes)` | Read log chunks; use the returned `next_offset` |
| `automation_result(job_id)` | Exit code, final log tail and SQLcl diagnostic file names |
| `automation_sqlcl_files(job_id)` | List retained SQLcl diagnostic logs |
| `automation_sqlcl_log(job_id, name, offset, max_bytes)` | Page through a retained SQLcl log |
| `automation_list(limit)` | Recent jobs |
| `automation_cancel(job_id)` | Cooperative cancellation for **offline-only** checks |

Every MCP tool argument has a description in the published `inputSchema`.
Cline shows the permitted targets, job-ID format, log byte offsets, defaults,
and bounds directly in its tool definitions. Update these descriptions when
adding or changing an MCP parameter.

Safe local targets are `doctor`, `lint`, `test-fast`, `test`, `check-schema`,
`check-source`, `validate`, and `check`. `source` is also allowed, but it **reads
DEV and may overwrite local `.apx` changes**. Inspect the working tree and
warn about source replacement before starting it.

Database-changing targets `sync-dev`, `test-release`, `test-install`,
`test-upgrade` and `test-deinstall` also **queue immediately**. Before Cline
calls `automation_start` for one of them, it must obtain the same explicit
human authorization required by `AGENTS.md` for the equivalent Make command.
MCP adds **no second approval queue**, operator terminal step, or approval
state. After the job starts, inspect `automation_status` / `automation_result`.
Underlying Bash scripts still check their saved connections, schemas,
workspaces, and mandatory DEV preflight where applicable.

`build`, `prepare-release`, QA, PROD and hotfix targets are not exposed.
There are no arbitrary shell commands, Make variables, or custom arguments.
`test-release` uses the repository's default upgrade input; use direct,
authorized Make for a custom `PREVIOUS_ZIP`.

**Upgrading from an older MCP image:** Previously stored
`awaiting_approval` jobs are automatically **cancelled**, not executed.
Submit a fresh job through Cline after normal authorization. Old job records
remain available for inspection. This avoids unexpectedly resetting DEV or
TEST after upgrading the MCP service.

## Operations and recovery

- Jobs are serialized within this service by an exclusive worker lock.
  **Direct shell/Make invocations are not serialized by the MCP worker lock.**
  Avoid running them concurrently against DEV, TEST or the same checkout.
- Logs and SQLite state are persisted in the `automation_jobs` volume at
  `/var/lib/apex-blog/jobs`. Each job has private `output.log` and `sqlcl/`
  files. Treat logs as sensitive; they may contain application/database data.
  The MCP API exposes log contents to any local client with access to the port.
- `automation_cancel` can only stop offline checks. It is deliberately disabled
  for `source` and DB operations, which might be partially applied. Stopping
  the container **can** interrupt DB work; the worker marks it `interrupted`
  after restart and will not retry it.
- The runner does not speed up `make source`, mandatory preflight or real DB
  tests. It removes client tool timeouts, provides visibility and preserves
  diagnostics after the scripts delete their temporary directories.
- Use the normal `AGENTS.md`, `automation/docs/ENVIRONMENTS.md` and runbook
  precautions when choosing which job to request; `make` remains the
  authoritative human/CI entry point.

## Local, no-database verification

```sh
python3 -m unittest discover -s automation/tests -p 'test_mcp_jobs.py' -v
# Run inside the MCP container (which has the optional Python MCP SDK):
python3 -m unittest discover -s automation/tests -p 'test_mcp_schema.py' -v
```

The job tests cover immediate queueing, migration of old pending jobs,
cancellation, log paging, interrupted state, and log preservation using a fake
Make program. The schema
tests inspect the actual MCP tools/list result and check parameter descriptions,
defaults, and bounds. Without the optional MCP SDK they skip, so run them
inside the image to verify the client-visible schema. It does
**not** validate a real SQLcl connection, container build, Oracle import or
deployment.
