# Tech Context

Technical reference for coding tasks, not a developer-workstation setup guide. Verify changing
tool versions and environment values against the repository.

## Source and toolchain

- Target **Oracle APEX 26.1**. Track application definitions as APEXLang `.apx`, not SQLcl split
  exports. `applications/blog/` is public; `applications/blog-admin/` is administration.
- SQLcl validates APEXLang and performs database operations. Java and SQLcl run in the
  automation container for MCP jobs; `make validate` does **not** connect to a database.
- `automation/` uses Bash (ShellCheck), Python 3.12 helpers/tests (Ruff) and mocked SQLcl for
  offline workflow tests. Source assets use Node-based ESLint, Stylelint, markdownlint and
  Prettier; `less/` must stay consistent with generated CSS and minified files.
- Pre-commit performs static lint. GitHub Actions performs offline checks and APEXLang
  validation, **not** deployment. For exact commands and versions see `Makefile`,
  `package.json`, `.pre-commit-config.yaml`, and `.github/workflows/ci.yml`.

## Running automation through MCP

- `automation/mcp/` wraps an allowlist of existing Make targets with a persistent job runner. It
  queues work, records job IDs and logs, and exposes results to Cline. The scripts, not MCP,
  retain connection/schema checks and mandatory DEV/QA preflight.
- MCP jobs are serialized **with other MCP jobs**, not with Make processes started directly
  elsewhere. Failed or interrupted database jobs require investigation before retry; mock test
  success is not proof of a real database import.
- MCP has **no additional approval workflow**. The existing human-authorization rules in
  `AGENTS.md` apply to database-changing targets regardless of execution interface.
- Docker installation, SQLcl profile setup, volume initialization and Cline registration are
  **human-owned**; see `automation/docs/MCP_AUTOMATION.md` only when setup or troubleshooting is
  the task.

## Source-of-truth references

- `Makefile` / `make help`: commands and prerequisites; `AGENTS.md`: permission boundaries and
  source rules.
- `automation/variables.sh` plus ignored local overrides: effective environment configuration.
  Do not assume that a saved schema or connection name in the memory bank matches the currently
  configured target.
- `automation/schema/install.list` and `upgrade.list`: package/spec/body ordering.
  `applications/*/supporting-objects/` owns install/upgrade data; Admin deinstall SQL is
  maintained manually.
- `automation/docs/ARCHITECTURE.md`: candidate integrity and CI; `automation/docs/RUNBOOK.md`:
  approved database workflows and recovery; `automation/docs/ENVIRONMENTS.md`: environment
  boundaries.
- `VERSION.txt`: current release version. `build/releases/` contains generated, ignored
  artifacts whose presence and validity must be checked, not assumed.

## Validation and acceptance

- `make test-fast`, `make test`, and the Python workflow tests are **offline**. `make check`
  includes the full offline preflight and SQLcl APEXLang validation, but not an Oracle import.
- A real install, upgrade, or deinstall must be verified through explicitly authorized,
  disposable-TEST acceptance. Normal releases promote the same verified immutable candidate to
  QA and PROD.
- The emergency QA/UAT → PROD hotfix intentionally skips normal release gates; see `AGENTS.md`
  and the runbook before changing hotfix automation.
