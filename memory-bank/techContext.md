# Tech Context

Technical reference for APEX Blog coding tasks. Use the repository's tool
configuration files for exact versions and current environment values.

## Source and toolchain

- Target Oracle **APEX 26.1**. Tracked application definitions use APEXLang
  (`.apx`) in `applications/blog/` (Public) and `applications/blog-admin/`
  (Admin), rather than split SQLcl exports.
- `automation/` uses Bash, Python 3.12 helpers and unit tests, and SQLcl for
  APEXLang validation and Oracle operations. Offline workflow tests use mock
  SQLcl. Static checks use ShellCheck, Ruff, and Node tools (ESLint,
  Stylelint, markdownlint and Prettier).
- `less/` contains LESS sources compiled and minified into application static
  assets. GitHub Actions performs validation and offline checks, not database
  deployment. Refer to `package.json`, `.pre-commit-config.yaml`, and
  `.github/workflows/ci.yml` for the exact checks.

## Automation architecture

- `automation/mcp/` exposes allowlisted Make targets through a persistent
  asynchronous job runner, returning job IDs, state, logs, and final results.
  Make and the underlying Bash/Python scripts remain the execution layer.
- The single MCP worker serializes jobs submitted to it; Make commands
  launched independently are outside that queue. Job state and diagnostics
  are retained in Docker volumes.
- Runtime and installation details live in
  [`automation/docs/MCP_AUTOMATION.md`](../automation/docs/MCP_AUTOMATION.md).

## Documentation pointers

Command names, source ownership, versioning, and authorization policy are
defined in `AGENTS.md`, not duplicated here. Operational detail lives in:

- `automation/docs/ARCHITECTURE.md`: release architecture and candidate
  integrity; `RUNBOOK.md`: procedures and recovery; `ENVIRONMENTS.md`:
  environment boundaries.
