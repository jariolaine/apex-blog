# Local Docker MCP automation — maintainer guide (optional)

This document is for developers maintaining, configuring, or troubleshooting
the MCP service. Ordinary APEX and PL/SQL development uses the project
instructions in [`AGENTS.md`](../../AGENTS.md) and the MCP tools' own
published descriptions; it does not require reading this guide.

The optional MCP endpoint runs the existing `Makefile` and `automation/`
commands. It does **not** implement a second deployment path. The full
preflight inside `import_apps_to_dev.sh` and the DEV/TEST schema/workspace
verification in the Bash scripts remain mandatory.

The service runs jobs independently of MCP requests. Starting a job can wait briefly
for a quick result and always returns a job ID for later retrieval.

Its **single worker** serializes all jobs submitted through this
MCP service, retains stdout/stderr and SQLcl diagnostics in a Docker volume,
and lets an agent wait for job results. A disconnected MCP client does not
cancel a job; restarting the container interrupts running jobs. Interrupted DB jobs
must be inspected before a new request; they are never automatically retried.

## Where commands actually execute

The coding agent and its terminal run wherever the client has been configured
(e.g., on the developer's host). **They are not automatically inside Docker.**
The optional `automation` Docker Compose service is started separately by the
operator (see the setup commands below). The MCP client calls
`http://127.0.0.1:8765/mcp` over HTTP; a worker in that running container
executes the allowlisted Make targets against the bind-mounted checkout.

A direct Make fallback is a **different invocation**: if the agent's shell has
access to Docker Compose and the `automation` service is already running,
execute `docker compose ... exec -T automation make TARGET` **from the host
repository root**. The `docker compose` command runs in the caller's shell;
only `make` executes in the container. If the shell has no Docker access or the
service isn't running, this fallback is unavailable. Do not infer container
access from the mere presence of an MCP connection. Do not install tooling or
start/replace services without authorization.

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
Do not mount the host Docker socket into the automation container. Docker
access from a coding agent's *host* shell is separate and potentially privileged:
it must be explicitly configured by the operator, not assumed or acquired as
part of MCP setup. Without that access, the agent cannot invoke Docker Compose
as a fallback; an operator can execute direct Make instead. MCP is a convenience
for asynchronous execution, not an authorization boundary.

## VS Code and Cline configuration

**Cline in VS Code:** the Cline extension does not currently provide a
repository-local MCP configuration that it automatically discovers. Its MCP
server list is user-scoped. Open **Cline > MCP Servers > Configure > Configure
MCP Servers** and merge the following **APEX Blog** entry into Cline's
existing `mcpServers` object (preserve other servers). The canonical entry is
shown below. Keep the repository's
[`example JSON`](../mcp/examples/cline-mcp-settings.json) consistent with it:

```json
{
  "mcpServers": {
    "APEX Blog": {
      "type": "streamableHttp",
      "url": "http://127.0.0.1:8765/mcp",
      "disabled": false,
      "autoApprove": [],
      "timeout": 360
    }
  }
}
```

The `streamableHttp` transport spelling is **Cline-specific**. Leaving the
`type` out can select legacy SSE instead. Check the Cline MCP panel for a
connected server and exposed tools. The configured server name **APEX Blog**
produces the Cline tool prefix `apex_blog__`: for example,
`apex_blog__automation_capabilities` and `apex_blog__automation_start`.
Start with the read-only `apex_blog__automation_capabilities`, not a
DEV/TEST-changing target. The raw MCP tool names are `automation_*`; Cline adds
the server prefix, so use the complete `apex_blog__...` names in agent instructions.

Because this Cline registration is global, its tools may remain visible in
other workspaces. The container is still bound to **this** checkout, so a
call from another workspace could change this repository. Disable the entry
when working on unrelated projects, or use separate isolated Cline profiles
where your environment supports them. The workspace rule
[`.clinerules/project-workflow.md`](../../.clinerules/project-workflow.md) guides
Cline in this repository but **is not an access-control boundary**. Keep
`autoApprove` empty, especially for `apex_blog__automation_start` and
potentially sensitive logs.

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

## Published MCP tool contract

The MCP server implementation defines the supported target registry in
`automation/mcp/jobs.py` (`TARGET_SPECS`). The
`apex_blog__automation_capabilities` response and the enum for
`apex_blog__automation_start.target` derive from that registry. Make targets
outside the registry and arbitrary Make variables cannot be submitted through
this interface; use normal Make commands for those operations.

The configured **APEX Blog** server name produces the `apex_blog__` prefix in
Cline. Other clients may present the raw `automation_*` tool names.

| Tool name as exposed in this configuration | Purpose |
| --- | --- |
| `apex_blog__automation_capabilities` | Return target metadata and side effects without starting work |
| `apex_blog__automation_start` | Queue an allowed target; wait up to 30 seconds by default and return its ID plus progress or final result |
| `apex_blog__automation_result` | Wait for completion or return current progress; on completion, return exit code, output tail and diagnostic filenames |
| `apex_blog__automation_logs` | Read combined output or a retained SQLcl diagnostic by byte offset |
| `apex_blog__automation_list` | List recent jobs and recover job IDs |
| `apex_blog__automation_cancel` | Request cancellation for offline checks only |

The job lifecycle has active states `queued` and `running`, and terminal states
`succeeded`, `failed`, `cancelled`, and `interrupted`. A job only succeeds when
its terminal state is `succeeded` and its exit code is `0`.
`apex_blog__automation_start(target, wait_seconds=30)` submits the job and waits
up to 30 seconds by default (maximum 60), returning early if finished. Set
`wait_seconds=0` to submit without waiting. The response always includes `id`
and `is_terminal`; when terminal it also includes exit code and diagnostics.
Call `automation_result` only when the start response is not terminal.
`apex_blog__automation_result(job_id, timeout_seconds=120)` waits for completion
and returns as soon as it is detected (maximum 300 seconds per request). Set
`timeout_seconds=0` for an immediate status snapshot. If still queued/running at
its deadline, it returns `is_terminal=false` and `wait_timed_out=true`; call it
again for the same ID. Terminal results include `exit_code`, `log_tail`, and
`sqlcl_log_files`; progress-only responses omit these diagnostics. Both start
and result return `id`, which is passed as `job_id` to subsequent
tools. Waiting never cancels the underlying job, even on client disconnect.
The Cline request timeout is set above the maximum 300-second tool wait.
A running offline cancellation is asynchronous. The API
does not enforce human approval: repository authorization rules still apply.

`apex_blog__automation_logs(job_id="...")` reads the job's combined output.
For a retained SQLcl diagnostic, pass `sqlcl_file="exact-filename.log"` using
one of the terminal result's `sqlcl_log_files`; the server rejects unlisted
filenames and paths. The same `offset`/`max_bytes` paging applies to both logs.

Log offsets and `next_offset` count **bytes**, not characters. An
`end_of_log=true` response indicates the current end of a file, not the end of
the job. The default `max_bytes` is 8192 (allowed range 1–16384). Diagnostic
logs may contain credentials or application data; handle them as sensitive.
The server's `inputSchema` provides the parameter types, allowed enum values,
bounds, and descriptions; update `automation/mcp/server.py` and the schema
tests when changing the API.

### Direct Make access for maintainers

The optional MCP interface does not replace `make help`, the existing Make
scripts, or their environment checks. In particular, custom Make variables
such as `PREVIOUS_ZIP=...`, `OVERWRITE=YES`, and `RELEASE_DIR=...` require a
direct Make invocation. `make build` remains the complete release workflow and
should not be reimplemented as a series of MCP jobs.

For a manually run check, when the Docker Compose service is already running
and the operator has Docker access, execute from the repository root:

```sh
docker compose -f automation/docker/docker-compose.yml \
  -f automation/docker/docker-compose.mcp.yml exec -T automation make check-release
```

MCP worker locking serializes only MCP jobs; external Make processes are not
covered. Prevent concurrent operations against the same checkout or DEV/TEST.
No additional approval is implemented in the MCP queue; DEV writes and TEST
resets still require authorization and the Make/Bash preflight checks.

**Upgrading from an older MCP image:** Previously stored
`awaiting_approval` jobs are automatically **cancelled**, not executed.
Submit a fresh MCP job after normal authorization. Old job records
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
- `apex_blog__automation_cancel` can only stop offline checks. It is
  deliberately disabled for `source` and DB operations, which might be
  partially applied. Stopping
  the container **can** interrupt DB work; the worker marks it `interrupted`
  after restart and will not retry it.
- The runner does not speed up `make source`, mandatory preflight or real DB
  tests. It removes client tool timeouts, provides visibility and preserves
  diagnostics after the scripts delete their temporary directories.
- The same environment verification and preflight checks apply to MCP jobs
  and direct Make runs. The service is a client interface, not a second
  deployment or human-authorization implementation.

## Local, no-database verification

```sh
python3 -m unittest discover -s automation/tests -p 'test_mcp_jobs.py' -v
# Run inside the MCP container (which has the optional Python MCP SDK):
python3 -m unittest discover -s automation/tests -p 'test_mcp_schema.py' -v
# Tests introduced with the shared target registry and capabilities tool:
python3 -m pytest -q automation/mcp/tests/
```

The existing job tests cover queueing, migration, cancellation, log paging,
interrupted state and output retention with a fake Make program. The original
schema tests inspect published MCP tool descriptions, parameter defaults and
bounds. The newer `automation/mcp/tests/` tests check the shared allowlist,
capabilities, result-wait semantics and input enum. Run schema tests with the MCP
SDK installed; `pytest` is needed for the new test directory. These checks do
**not** validate an actual SQLcl connection, Oracle import or deployment.
