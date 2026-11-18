# APEX Blog automation

Run commands from the repository root. `make help` lists application development,
validation, release, and deployment commands. Automation setup and diagnostics
are documented here for maintainers.

## Setup and diagnostics

These commands maintain or diagnose development tooling. They remain callable
Make targets but are intentionally omitted from `make help`.

- `make setup` — Install local CI tools and the Git hook. Use
  `make setup RESET=YES` to reinstall from scratch.
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
- [Docker/MCP automation](docs/MCP_AUTOMATION.md) — maintainer setup,
  configuration, service API, diagnostics, and recovery
- [Project README](../README.md) — end-user installation and upgrade
- [Application coding-agent instructions](../AGENTS.md) — source conventions,
  project checks, and authorization

The source repository owns the automation. Downloadable application ZIPs contain
full SQL application exports, not the automation scripts. Legacy Terraform is
maintained separately and is not part of this workflow refactor.
