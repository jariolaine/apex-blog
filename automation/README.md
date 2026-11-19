# APEX Blog automation

This automation was created to fill a tooling gap in developing and releasing
APEX packaged applications for recipients with access only to APEX App Builder.
The deliverable is one or more standard APEX SQL exports containing the
application definitions and Supporting Objects scripts to install or upgrade
the application-owned database schema. Recipients import these files and run
Supporting Objects through App Builder using a web browser, without a SQL*Net
connection, the source checkout, command-line tools, or separately executed
database migration scripts.

This requirement matters for environments such as Oracle Cloud APEX Service,
where [inbound SQL*Net connectivity is unavailable](https://docs.oracle.com/en/cloud/paas/apex/gsadd/restrictions-and-limitations.html).
Making installation and upgrade approachable for beginners and citizen
developers is also a primary goal. APEX Blog delivers two application exports,
installed Admin first, then Public; the end-user README owns that procedure.

Oracle already provides [Supporting Objects packaging](https://docs.oracle.com/en/database/oracle/apex/26.1/htmdb/how-to-create-a-custom-packaged-application.html).
This automation coordinates the additional project work: assembling Git-owned
database sources into those definitions, generating frontend assets, reconciling
APEX source, aligning versions, and checking the resulting release. Its purpose
is to make that workflow reliable and convenient for developers and coding
agents. The current build and acceptance commands use SQLcl against prepared
development environments. The
[packaged-application design and tool review](docs/PACKAGED_APPLICATIONS.md)
distinguishes producer access from recipient requirements, explains the
existing conditional upgrades, and assesses comparable tools and release
practices against the App Builder delivery contract.

This README is the entry point for developer setup and for maintenance of the
automation, MCP service, and coding-agent guidance. Read
[Maintaining automation and agent guidance](docs/MAINTENANCE.md) for the
established roles, constraints, documentation ownership, and interface-design
requirements before changing those components.

The human developer prepares the environment, named database connections, and
automation parameters before application work begins. Application agents use
that prepared configuration. The maintenance guide owns the full policy and its
rationale; the documents below explain the implemented setup and workflows.

Run commands from the repository root. `make help` lists the everyday development,
validation, release, and deployment interface. Setup and diagnostics are
documented here for the developer.

## Setup and diagnostics

These commands maintain or diagnose development tooling. They remain callable
Make targets but are intentionally omitted from `make help`.

- `make setup` — Install local CI tools and the Git hook on a **host**
  workstation. Use `make setup RESET=YES` to reinstall local tools. In an
  image-managed container setup does not install tools or host Git hooks,
  and `RESET=YES` is rejected; rebuild the image when tools need updating.
  A host requires Python with `venv`, Node.js/npm, and SQLcl with supported Java.
- `make doctor` — Read-only checks of local tools and setup; does not check
  database connections. Run it directly during developer setup or diagnostics;
  it is not exposed through MCP.

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
versions are pinned, but transitive npm dependencies are not lockfile-pinned.
After changing the asset map or compiler/minifier versions, regenerate the
assets and review the resulting CSS/JS changes as part of that maintenance work.

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
this README provides the setup and maintenance entry points.

`make help` lists the everyday Make interface. `make test` runs application
tests only; automation-maintainer suites in `automation/tests/` and
`automation/mcp/tests/` are invoked separately, not by Make or MCP.

## Detailed reference

- [Packaged-application design and tool review](docs/PACKAGED_APPLICATIONS.md) —
  delivery goal, native Oracle capabilities, related tools, and release practices
- [Maintenance and agent-guidance design](docs/MAINTENANCE.md) — roles, source and
  environment policy, documentation boundaries, public interfaces, and Memory
  Bank continuity
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
maintained separately.
