# APEX Blog automation

Run commands from the repository root. **`make help` is the authoritative command
reference**; this page intentionally lists only the everyday workflows. When a
Make target changes, update its help text and the relevant runbook procedure,
not a separate copy of every command in every document.

## Everyday workflow

```bash
make doctor        # Check local tools (does not test database connections)
make setup         # Install local CI tools and Git hooks (RESET=YES to reinstall)
make check         # Lint, schema/source, Python and APEXLang checks (no DB)
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
- [Project README](../README.md) — end-user installation and upgrade
- [Agent safety rules](../AGENT.md) — instructions for coding agents

The source repository owns the automation. Downloadable application ZIPs contain
full SQL application exports, not the automation scripts. Legacy Terraform is
maintained separately and is not part of this workflow refactor.
