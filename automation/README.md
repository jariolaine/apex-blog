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

## Everyday workflow

```bash
make check         # Lint, schema/source, application tests, APEXLang (no DB)
make build         # Prepare DEV, build and verify SQL, then accept in TEST
```

`make build` is the **only** release-build command. It regenerates Git-owned
Supporting Objects SQL, updates DEV application versions from `VERSION.txt`,
exports and compares both DEV applications to Git, runs the full offline quality
gate, packages/verifies the release, then performs upgrade, fresh-install and
deinstallation acceptance against **disposable TEST**. It modifies DEV versions,
tracked Supporting Objects and TEST. **Check both database connections before
running it.** The GitHub latest published release is the default upgrade input;
`PREVIOUS_ZIP=path` optionally selects a strictly older release ZIP.

If DEV and Git differ, build stops instead of automatically invoking `make source`
(DEV → Git) or `make sync-dev` (Git → DEV). Resolve the difference deliberately,
review the changes and retry. A candidate may already exist if TEST acceptance
fails; it is **not accepted**, and must not be promoted. After fixing the TEST
problem, `make test-release` can retest that existing candidate without
rebuilding.

A candidate is versioned under `build/releases/<version>/` and cannot be silently
replaced. `make build OVERWRITE=YES` is only for an **unpromoted, local**
candidate; never overwrite a tested, approved or publicly released version.
`make verify-release` checks an existing candidate without rebuilding it.

Application tests live in `tests/`; `make test` and `make test-fast` run only
those tests. Infrastructure regression suites in `automation/tests/` and
`automation/mcp/tests/` are maintained and invoked separately, not by Make
commands or the MCP server.

## Release acceptance and deployment

`make build` includes `make test-release`. To repeat acceptance independently,
run `make test-release` (with optional `PREVIOUS_ZIP=path`). An older ZIP must
exist and be strictly older than the candidate; otherwise the upgrade fails
before resetting TEST. If no older public release exists, use
`make test-deinstall` for install/deinstall checks and record that a complete
end-to-end build cannot yet pass the upgrade acceptance step.

Promote the **same tested candidate**, only after environment-specific approval,
using `make qa` and `make production`. The emergency hotfix path is
separate and bypasses the normal release pipeline; see the runbook.

## Detailed reference

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
