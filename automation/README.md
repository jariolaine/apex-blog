# APEX Blog automation

Run commands from the repository root. `make help` lists application development,
validation, release, and deployment commands. Automation setup and diagnostics
are documented here for maintainers.

## Setup and diagnostics

These commands maintain or diagnose development tooling. They remain callable
Make targets but are intentionally omitted from `make help`.

- `make setup` — Install local CI tools and the Git hook on a **host**
  workstation. Use `make setup RESET=YES` to reinstall local tools. In an
  image-managed container setup does not install tools or host Git hooks,
  and `RESET=YES` is rejected; rebuild the image when tools need updating.
  A host requires Python with `venv`, Node.js/npm, and SQLcl with supported Java.
- `make doctor` — Read-only checks of local tools and setup; does not check
  database connections. Also available through the automation MCP service.

## Optional MCP service

The optional MCP service exposes a controlled subset of Make targets as queued
jobs with retained output and SQLcl diagnostics. It does not replace the existing
Make scripts or their validation and deployment safeguards. Service installation,
configuration, API reference, and troubleshooting are documented in
[`MCP_AUTOMATION.md`](docs/MCP_AUTOMATION.md).

The application coding-agent workflow and authorization policy are in
[`AGENTS.md`](../AGENTS.md).

## Application frontend assets

`make assets` compiles the `frontend/less/` entry points and copies/minifies
`frontend/js/` into APEXLang application static files. `make check-assets` verifies
that the generated CSS/JS is current without modifying the checkout. Both
commands are exposed through the automation MCP job interface. Independent
plugin static files are not part of this pipeline.

The compiler/minifier versions are pinned in
`automation/ci/install_frontend_tools.sh` and installed when the automation
container image is built. CI uses the same installation script. Their direct
versions are pinned, but transitive npm dependencies are not lockfile-pinned. After first
introducing the pipeline, run `make assets` and review the generated CSS/JS
diff before enabling deployment.

## VS Code development container (optional)

The development image uses Microsoft's Ubuntu 26.04 Dev Container base,
`vscode` user, and preinstalled Oracle, Node.js, frontend and lint tools.
It is independent of the Debian-based MCP service. Only the developer home
(`/home/vscode`, Compose volume `home_data`) persists; the repository is
bind-mounted at `/workspace`. Python/npm tools and pre-commit environments
are installed into the image rather than the checkout or dependency volumes.

With Docker and the VS Code **Dev Containers** extension installed, open the
repository and choose **Dev Containers: Reopen in Container**. The single
`.devcontainer/devcontainer.json` automatically supports optional external ADB
wallets and private CA roots via the repository-root `.env`; without them it
uses empty, non-secret placeholders. A separate optional
`APEX_BLOG_DEV_SQLCL_PROFILE_DIR` seeds developer-only saved SQLcl connections;
MCP requires its own `APEX_BLOG_MCP_SQLCL_PROFILE_DIR` containing **only DEV/TEST**
connections. See the [SQLcl profile isolation guide](docs/MCP_AUTOMATION.md#sqlcl-profile-isolation).
In the terminal:

```sh
make assets
make check-assets
make test
make check
```

For Linux host UID/GID mapping, direct Docker Compose use, VPN/MCP networking,
existing-home migration, backups and rebuilding, follow the
[Dev Container setup instructions](docs/MCP_AUTOMATION.md#vs-code-development-container).
**Back up `home_data` before its first migration from `/home/agent` to
`/home/vscode`**; never use `docker compose down -v` during migration.
Container image tools cannot be reset with `make setup RESET=YES`; rebuild the
image instead. The standalone MCP service is configured separately in the
[same maintainer guide](docs/MCP_AUTOMATION.md#first-mcp-startup).

Optional ADB-S wallet mounts and organization root CA certificates for both
containers are documented in the
[Oracle wallet and CA configuration](docs/MCP_AUTOMATION.md#optional-adb-s-wallet-and-private-root-ca-certificates).

## Development and release flow

See [**Development flow**](docs/DEVELOPMENT_FLOW.md) for the Mermaid diagrams,
command selection, optional `make pretest TEST=...`, full `make build`
sequence, and promotion steps. This is the authoritative command-order guide;
this README covers setup, tooling and entry points only.

`make help` lists the everyday Make interface. `make test` runs application
tests only; automation-maintainer suites in `automation/tests/` and
`automation/mcp/tests/` are invoked separately, not by Make or MCP.

## Detailed reference

- [Development flow](docs/DEVELOPMENT_FLOW.md) — when to run each Make command,
  with Mermaid diagrams and the pretest selector
- [Runbook](docs/RUNBOOK.md) — DEV synchronization, preparing releases,
  destructive TEST operations, promotion, hotfix and recovery
- [Architecture](docs/ARCHITECTURE.md) — Git-owned inputs, artifact integrity,
  implementation and CI checks
- [Environments](docs/ENVIRONMENTS.md) — saved connections and environment guards
- [Dev Container and Docker/MCP automation](docs/MCP_AUTOMATION.md) —
  developer-container setup, MCP service, diagnostics, and recovery
- [Project README](../README.md) — end-user installation and upgrade
- [Application coding-agent instructions](../AGENTS.md) — source conventions,
  project checks, and authorization

The source repository owns the automation. Downloadable application ZIPs contain
full SQL application exports, not the automation scripts. Legacy Terraform is
maintained separately and is not part of this workflow refactor.
