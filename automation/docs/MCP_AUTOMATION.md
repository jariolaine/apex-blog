# Docker development and MCP automation — maintainer guide

This guide documents the optional VS Code Dev Container and the Docker MCP
service. Ordinary APEX/PLSQL development follows [`AGENTS.md`](../../AGENTS.md)
and the MCP tools' published descriptions; it does not require this guide.

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

The MCP worker runs Make targets in the **`mcp`** Compose service (project
`blog_automation`); clients connect over `http://127.0.0.1:8765/mcp`. The client
terminal is not automatically inside that container. The separate Ubuntu
26.04 development environment runs as the **`dev`** service (Compose project
`blog`), where developers can execute Make directly. See the
[development container instructions](../README.md#vs-code-development-container-optional).

Direct Make access to the running MCP service is an operator action using
`docker compose exec -T mcp make TARGET` from the repository root with the
Compose configuration below. Do not infer Docker access from an MCP connection
or run concurrent direct Make and MCP operations against the same checkout.

## Images and setup

The MCP service uses `automation/docker/Dockerfile.mcp` (Debian, Python 3.12).
The independent Dev Container uses `automation/docker/Dockerfile.dev`, based
on Microsoft's Ubuntu 26.04 Dev Container image (Python 3.14, `vscode` user).
Both images include Node.js 24, Oracle JDK 25, SQLcl and the pinned LESS/esbuild
installer. They also install all Python/npm lint tools, actionlint and
pre-commit hook environments **during the image build**, under
`/opt/apex-blog/`, outside the `/workspace` bind mount. Tool changes require
image rebuilds; service startup no longer downloads dependencies.

Direct Python tool versions are pinned in `automation/ci/requirements.txt` and
npm uses the committed `package-lock.json`. Some transitive Python/frontend
dependencies and the Oracle SQLcl/JDK `latest` URLs remain unpinned; a lockfile,
versioned downloads and checksums are still needed for bit-for-bit image
reproducibility.

The MCP service runs non-root as `agent`, with a configurable UID/GID. The only
persistent MCP named volume is **`jobs_data`**, holding the SQLite job
store, output, and SQLcl diagnostics. The repository remains bind-mounted and
a dedicated DEV/TEST-only SQLcl profile remains an external read-only mount.
**Do not bake database credentials into Docker images** or place QA/PROD
credentials in the repository. `.dockerignore` does not hide files from a
runtime bind mount.

### Compose files and services

| Compose file | Service | Purpose |
| --- | --- | --- |
| `automation/docker/docker-compose.mcp.yml` | `mcp` | MCP API/worker, host-local port 8765 |
| same file | `setup` (profile `init`) | One-shot job-volume ownership repair |
| `automation/docker/docker-compose.db.yml` | `tst-db`, `tst-ords` | Optional local TEST DB and ORDS |
| `automation/docker/docker-compose.dev.yml` | `dev` | Independent Dev Container, project `blog` |

The `.env.example` file sets `COMPOSE_FILE` to the DB file followed by the MCP
file; both declare the **`blog_automation`** project. Continue using the
same project name for an existing database. Changing it would create separate
project-scoped named volumes; never delete the TEST database data volumes
as part of the MCP tooling migration. The repository-root `docker-compose.yml` is an
empty placeholder; the sample `.env` chooses services. Use absolute host
paths for `APEX_BLOG_DEV_SQLCL_PROFILE_DIR` and
`APEX_BLOG_MCP_SQLCL_PROFILE_DIR` because relative paths depend on Compose's
base file. These MUST be different host directories: MCP must never mount the
developer's broader set of connections. See [SQLcl profile isolation](#sqlcl-profile-isolation).

### First MCP startup

From repository root, after configuring DEV/TEST-only saved SQLcl connections:

```sh
cp .env.example .env
# Edit .env: APEX_BLOG_MCP_SQLCL_PROFILE_DIR must be an absolute host path
# containing DEV/TEST connections only. Optionally configure the separate
# APEX_BLOG_DEV_SQLCL_PROFILE_DIR for the developer's broader profile set.
# Configure ORACLE_PWD only if using the optional local TEST database.
export HOST_UID="$(id -u)" HOST_GID="$(id -g)"

docker compose run --rm setup
docker compose up -d --build mcp
```

The `setup` service repairs **only `jobs_data` ownership**. Run it once
before first start, and again after changing UID/GID or restoring the job volume
from a backup. It runs as root without access to the checkout, profiles,
network or Docker socket. `mcp` itself runs with Linux capabilities dropped.
Do not run `setup` concurrently with active jobs.

Inspect the running service:

```sh
docker compose ps
docker compose logs -f mcp
docker compose exec -T mcp make doctor
```

No `automation_venv` or `automation_node_modules` volume is needed. Stop the
old MCP service before replacing its image, and **keep existing dependency
volumes until** a rebuilt worker passes linting, offline Make checks, tool
discovery, and a persisted-job check across recreation. Once the new image is
verified, those orphaned dependency volumes can be reclaimed separately.
Do not remove `jobs_data`; it contains irreplaceable job records/logs.

If the MCP service's UID/GID changes, run `docker compose run --rm setup` while
the service is stopped and recreate the service. The host-local MCP HTTP
endpoint has no authentication: **do not expose port 8765 to the LAN or
Internet**. Never mount the Docker socket into the worker. MCP access alone
does not imply permission to run Docker commands on a developer's host.

When using optional local TEST DB/ORDS, the database host in the Compose
network is `blog-tst-db`, not `localhost`. External databases require
reachable network addresses and the appropriate schema/workspace setup.

## VS Code development container

This is a **separate** Compose service (`dev`, project `blog`) built from
`automation/docker/Dockerfile.dev`. It uses Microsoft's Ubuntu 26.04 Dev
Container image, the `vscode` user, Oracle JDK 25, SQLcl, Node.js 24,
LESS, esbuild, and the image-installed Python/npm lint tools. Bash completion,
`fzf`, `rg`, `fd`, `bat`, `jq`, Git LFS and ShellCheck are also provided.
The development image additionally installs the MCP SDK and pytest so
maintainers can run the regression suites described in the
[runbook](RUNBOOK.md#automation-maintainer-regression-tests).
The MCP runtime image does not install pytest.

Install Docker Engine/Compose and the VS Code **Dev Containers** extension,
open the repository and choose **Dev Containers: Reopen in Container**. There
is only one `.devcontainer/devcontainer.json` configuration. Its Compose file
supports optional wallet/CA files automatically; no special configuration
picker is needed. A host-side initialization step links the ignored root
`.env` into the Compose directory when that file exists.
Use the integrated terminal to run ordinary commands:

```sh
make assets
make check-assets
make test
make check
```

Only `/home/vscode` persists (named volume `home_data`); a new volume receives
its initial files from the image. The repository is bind-mounted at `/workspace`.
Python/npm linters and pre-commit environments live under `/opt/apex-blog/`
inside the **image**, not in `.venv`, `node_modules`, or any dependency volume.
The optional Git hook is not installed into the host checkout by the image.
Use `make lint` directly. `make setup RESET=YES` is **not** a container repair
procedure; rebuild the image to change installed tools.

### Starting without VS Code

For a terminal on a Linux host, run from the repository root. If a root
`.env` supplies external wallet or CA paths, pass `--env-file .env` to these
commands (otherwise they use the empty placeholders):

```sh
export HOST_UID="$(id -u)" HOST_GID="$(id -g)"
docker compose -f automation/docker/docker-compose.dev.yml up -d --build dev
docker compose -f automation/docker/docker-compose.dev.yml exec -T dev make assets
docker compose -f automation/docker/docker-compose.dev.yml exec -T dev make check-assets
```

The Dockerfile sets the `vscode` UID/GID using `HOST_UID`/`HOST_GID`, so
bind-mounted files can be written as the host developer. Supply these values
before launching VS Code/Compose if the Linux host user isn't UID/GID 1000.
If you change the UID/GID of an existing container, check the persistent home
volume's ownership. The old `dev-volume-init` service no longer exists.

The development service uses Linux host networking for the host VPN and the
existing localhost MCP endpoint. It does **not** mount the Docker socket.
Its optional, read-only SQLcl profile source is **not** the MCP profile.
Cline inside the Dev Container may need its own MCP server registration;
see [VS Code and Cline](#vs-code-and-cline-configuration).
Do not run competing direct Make and MCP jobs that change the same checkout.

### SQLcl profile isolation

Use **two different directories on the host**, each holding the *contents* of
an SQLcl `.dbtools` directory (not the parent directory). Neither directory
belongs in the Git checkout or a Docker image:

```dotenv
# Optional: developer's SQLcl saved connections, including QA/PROD if needed.
APEX_BLOG_DEV_SQLCL_PROFILE_DIR=/home/your-user/.config/apex-blog/sqlcl-dev

# Required: SEPARATE minimal SQLcl profile with ONLY DEV and TEST connections.
APEX_BLOG_MCP_SQLCL_PROFILE_DIR=/home/your-user/.config/apex-blog/sqlcl-mcp
```

The **Dev Container** bind-mounts its profile source read-only at
`/run/sqlcl-profile`. On startup, if that source contains files, it replaces
`/home/vscode/.dbtools` in the persistent developer home with a private
writable copy. The developer's host directory is the source of truth: changes
saved inside the container do **not** synchronize back and will be replaced
on the next start. Export/reconcile wanted connection changes to the host
source before restarting. If the Dev variable is unset, an empty tracked
placeholder is mounted and the existing persistent `.dbtools` is left alone.
The Dev image never mounts the MCP profile source.

The **MCP worker** requires `APEX_BLOG_MCP_SQLCL_PROFILE_DIR`, mounts it
read-only at the same internal path, and copies it to its separate, private
`/home/agent/.dbtools` before the worker starts. It does not see the Dev home
or the Dev SQLcl profile source. MCP jobs still use the existing `blog_dev`
and `blog_tst` saved connection names; keep only the corresponding DEV/TEST
connections in this directory. Review the directory's contents before using
it; the mount itself cannot classify saved profiles or stop a deliberately
misconfigured operator from pointing at the developer's full directory.

**Wallet isolation matters too:** `APEX_BLOG_EXTERNAL_DIR` is currently
shared by both Compose configurations. If the MCP worker uses this external
mount, its `wallet/` folder must contain **only DEV/TEST credentials**.
Do not place QA/PROD wallets there, even if QA/PROD SQLcl profiles are isolated.
Neither `setup` nor the Docker image build receives SQLcl profiles or wallets.

### Persistent home migration

The `blog` project uses the `home_data` named volume, mounted at
`/home/vscode` rather than `/home/agent`. A previously used Compose project
name may have created a *different* volume; check before migrating. **Back up the volume
before migrating** and inspect any personal shell, Git and Java/SQLcl settings
that contain absolute `/home/agent` paths. Existing home files are not
intentionally deleted or overwritten by the change. Check the volume:

```sh
docker volume inspect blog_home_data
docker run --rm -v blog_home_data:/existing:ro busybox:1.36.1 ls -la /existing
```

Do not use `docker compose down -v` during this migration. Previous Python
venv and `node_modules` volumes become unused; retain them until the new
image passes verification. The image's dependency setup does not delete
Git-ignored dependency directories left on the host.

After rebuilding in VS Code, verify:

```sh
id
printf '%s\n' "$HOME"
cat /etc/os-release
python3 --version
lessc --version
esbuild --version
sql -version
make doctor
make assets
make check-assets
make check
```

## Optional ADB-S wallet and private root CA certificates

The standard Dev and MCP Compose files remain usable **without** a wallet
or custom CA. For an Oracle Autonomous Database Serverless (ADB-S) mTLS
connection, or to trust an organization's private/self-signed root CA, set
an **optional read-only external directory**. Wallets and CA files are not
copied into Docker images, the Git checkout, named volumes or MCP job records
by this mount. Separately, configured Dev SQLcl profiles are intentionally
copied into the persistent developer home as described above.

### 1. Prepare the host directory

On your Linux host, outside the repository:

```sh
mkdir -p "$HOME/.config/apex-blog/external/wallet" \
         "$HOME/.config/apex-blog/external/certificates"
chmod 700 "$HOME/.config/apex-blog/external" \
          "$HOME/.config/apex-blog/external/wallet"
# Place your downloaded Wallet_DEV.zip in wallet/ and private root .crt/.pem
# certificates in certificates/ (one PEM-encoded certificate per file).
```

`wallet/` and `certificates/` are **independently optional**; an empty
`certificates/` folder is valid for wallet-only connections. The external
directory must be an **absolute** existing host path. For a DEV/TEST worker,
mount **only DEV/TEST credentials**. Keep QA/PROD wallets and credentials
outside this directory. Do not put wallet ZIP files, private keys or
connection profiles in Git.

Set this in the ignored repository-root `.env`:

```dotenv
APEX_BLOG_EXTERNAL_DIR=/home/your-user/.config/apex-blog/external
```

Use the real absolute path, not `~`. Compose does not create missing host
folders (`create_host_path: false`). The same directory is mounted read-only
at `/run/apex-blog/external` in **either** container.

**Dev Containers and `.env`:** The first Compose file lives under
`automation/docker/`, but the ignored `.env` lives at the repository root.
The single Dev Container's host-side `initializeCommand` creates the
ignored symlink `automation/docker/.env -> ../../.env` when the root `.env`
exists. It never copies credentials or overwrites unrelated files. Without
`.env` it uses empty, tracked wallet/CA and Dev SQLcl directories, plus an
empty build-time CA file under `automation/docker/placeholders/`. These
placeholders contain no credentials. The symlink is local-only and is not
committed.

For direct Compose commands, explicitly load the root file with
`docker compose --env-file .env -f ...`. Compose `env_file:` within a service
would **not** solve this issue because the wallet bind mount is interpolated
before container environment variables are set. No shell export or VS Code
launch from a special terminal is required.

### 2. Enable the optional runtime mount

**Dev Container:** reopen the repository using the single standard
`.devcontainer/devcontainer.json`. Its `docker-compose.dev.yml` automatically
uses `APEX_BLOG_EXTERNAL_DIR` from the root `.env` if configured. No alternate
Dev Container selection or extra Compose override is needed. To start it
manually from the repository root (after setting `.env`):

```sh
docker compose --env-file .env \
  -f automation/docker/docker-compose.dev.yml up -d --build dev
```

**MCP:** its standard `docker-compose.mcp.yml` now uses
`APEX_BLOG_EXTERNAL_DIR` from the same root `.env`, with the empty placeholder
when unset. There is no external Compose override to select. Use the normal
`docker compose up -d --build mcp` startup (and `docker compose run --rm setup`
only if job ownership needs repair). Neither the `setup` service nor the Docker
build receives a wallet mount. No new named volumes, services, Make targets
or MCP tools are introduced. The Oracle wallet path is identical in
both containers:

```text
/run/apex-blog/external/wallet/Wallet_DEV.zip
```

Inside Dev, test a wallet using **SQLcl** (replace the username and service
with your DEV database connection; provide the password at the prompt):

```text
sql /nolog
SQL> set cloudconfig /run/apex-blog/external/wallet/Wallet_DEV.zip
SQL> connect BLOG_DEV@your_database_low
```

The existing MCP automation still uses saved `blog_dev` and `blog_tst`
connection names by default. Create or update the **DEV/TEST-only** saved
SQLcl profiles so their wallet reference uses the container path above.
The MCP worker copies its read-only `APEX_BLOG_MCP_SQLCL_PROFILE_DIR` into its
private runtime home before running jobs. The Dev Container reads the separate
`APEX_BLOG_DEV_SQLCL_PROFILE_DIR` source; neither source is replaced by the
wallet mount. Authorize connection tests and all DEV/TEST writes as usual.

**Certificates:** `.crt` and `.pem` files under `certificates/` must contain
one valid PEM-encoded certificate each. Only install CAs you actually trust;
do not add a self-signed leaf certificate without reviewing that trust choice.
On startup, the containers prepare a private **temporary** trust bundle from
the default OS and JDK roots plus these extra certificates. The standard
Compose files configure `curl`, Git, Node/npm, Python/pip and Java/SQLcl to use
those bundles without disabling TLS verification. No system root is removed.
A malformed certificate stops startup with an error.

Check the prepared trust files inside the container:

```sh
ls -l /tmp/apex-blog-trust/ca-bundle.pem /tmp/apex-blog-trust/cacerts
```

If you update a CA file, **recreate** the relevant service to regenerate its
trust files. Adding a root certificate cannot fix missing VPN routes, DNS or
security-list rules. The Dev Container uses host networking, but the MCP
container has its own Docker networking; verify ADB-S connectivity separately.

### 3. Optional trust during Docker image builds

The runtime mount does **not** help `apt`, `curl`, npm or pip while the image
is being built. Only if a corporate HTTPS proxy requires a private CA during
**Dockerfile RUN** operations, concatenate the approved public PEM root
certificates into a host file and set its absolute path:

```sh
cat /path/to/corporate-root-1.crt /path/to/corporate-root-2.crt \
  > "$HOME/.config/apex-blog/build-roots.pem"
```

```dotenv
APEX_BLOG_BUILD_CA_BUNDLE=/home/your-user/.config/apex-blog/build-roots.pem
```

The **single standard Dev Container** includes an optional BuildKit CA
secret automatically. Set `APEX_BLOG_BUILD_CA_BUNDLE` in the root `.env` and
select **Dev Containers: Rebuild and Reopen in Container**; otherwise the
BuildKit secret uses an empty, tracked placeholder and installs no extra CA.
For MCP, the **standard** `docker-compose.mcp.yml` also includes the
optional BuildKit CA secret, using the empty placeholder when unset. No
extra Compose file is required; rebuild the image after changing the bundle
(a no-cache rebuild is safest because BuildKit secrets are not cache-key
inputs).

The build CA is passed as a **BuildKit secret**; the original secret file is
not stored in an image layer. Its **public CA certificates are intentionally
installed** into the image OS and JDK trust stores so that build downloads
and Java can validate those issuers. **Never pass a wallet, private key or
password file** as `APEX_BLOG_BUILD_CA_BUNDLE`. Docker daemon trust for
pulling base images (`FROM`) must be configured on the host separately; a
Dockerfile secret cannot fix registry TLS errors before the image build starts.
BuildKit-capable Docker Compose is required.

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
database-changing target. The raw MCP tool names are `automation_*`; Cline adds
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

### Oracle APEXlang skill (optional)

Oracle publishes an APEXlang skill at
<https://github.com/oracle/skills/tree/main/apex/apexlang>. This helps the
**coding agent** edit `.apx` source; it is not a Docker/SQLcl runtime
dependency. Cline discovers project skills under `.cline/skills/` and
user-specific skills under `~/.cline/skills/`. Install the skill **where the
Cline extension executes**:

- If Cline runs as a remote VS Code extension in the Dev Container, use
  `/home/vscode/.cline/skills/` (persistent home) or the project skill folder.
- If Cline runs on the host, use its host-side skills directory.

SQLcl's `skills sync` may choose a different destination; confirm the files
are visible to Cline. A skill installed only in the MCP worker is not
necessarily available to the editor's coding agent.

The repository targets **APEX 26.1**. Select Oracle's corresponding
APEXlang reference guidance and treat `AGENTS.md`, `.clinerules/`, and
`automation/` as authoritative for release restrictions. The Oracle skill's
optional direct SQLcl import/connection workflows must not bypass the
authorization requirements for DEV writes (disposable TEST resets are preauthorized).

`make doctor` skips the optional Git-hook installation check inside
image-managed containers. Git hooks are not installed in the host checkout at
image build/startup, but pre-commit hook environments are prewarmed in the image.
All lint tool and repository checks still run.

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
scripts, or their environment checks. The authoritative command sequence is in
[development flow](DEVELOPMENT_FLOW.md). In particular, custom Make variables
such as `OVERWRITE=YES` and `RELEASE_DIR=...` require a
direct Make invocation. Previous-release ZIP overrides are not supported even
through direct Make; GitHub is authoritative. `make build` remains the complete release workflow and
should not be reimplemented as a series of MCP jobs.

For a manually run check, when the Docker Compose service is already running
and the operator has Docker access, execute from the repository root:

```sh
docker compose exec -T mcp make check-release
```

MCP worker locking serializes only MCP jobs; external Make processes are not
covered. Prevent concurrent operations against the same checkout or DEV/TEST.
No additional approval is implemented in the MCP queue. DEV writes and
promotion still require human authorization; resetting the verified disposable
TEST environment is preauthorized. Every Make/Bash environment guard remains
mandatory. `pretest` is an allowlisted MCP target with one validated, optional `test`
selector (`install`, `upgrade`, `deinstall`); omitting it runs all stages.
For example, `apex_blog__automation_start(target="pretest", test="upgrade")`.
Only `pretest` accepts this option; MCP still rejects arbitrary Make variables
and paths. Both MCP and Make use the latest verified GitHub release on `master`
for upgrade tests. See [development flow](DEVELOPMENT_FLOW.md#optional-pretest-from-live-dev)
for stage selection and release-policy differences.

**Upgrading from an older MCP image:** Previously stored
`awaiting_approval` jobs are automatically **cancelled**, not executed.
Submit a fresh MCP job after normal authorization. Old job records
remain available for inspection. This avoids unexpectedly resetting DEV or
TEST after upgrading the MCP service.

## Operations and recovery

- Jobs are serialized within this service by an exclusive worker lock.
  **Direct shell/Make invocations are not serialized by the MCP worker lock.**
  Avoid running them concurrently against DEV, TEST or the same checkout.
- Logs and SQLite state are persisted in the `jobs_data` volume at
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

Run automation-maintainer regression suites from the **Dev Container**,
which has both the MCP SDK and pytest. The commands and their separation
from application checks are in the
[runbook](RUNBOOK.md#automation-maintainer-regression-tests).
These tests use mocks and do not validate SQLcl connectivity, actual Oracle
imports or production deployments. The MCP runtime image does not need
pytest; its job is to serve the six automation tools.
