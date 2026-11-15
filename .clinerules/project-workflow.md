# Cline project workflow

`AGENTS.md` is authoritative for coding rules, permitted actions, database authorization and
release safety. `memory-bank/` provides historical and technical context, not instructions
overriding current code.

## Task context

- Inspect only task-relevant context: `projectbrief.md` for scope, `systemContext.md` for
  architecture, `techContext.md` for technical constraints, and `activeContext.md` /
  `progress.md` when continuing work or checking known issues. Open `memory-bank/reference/`
  only for related investigations.
- Memory-bank snapshots are not proof of current branch, schema, connection, generated artifact
  or release status. Verify these against Git, `VERSION.txt`, automation configuration and
  actual job results.
- Update only relevant memory-bank files for significant changes or when requested. Keep
  secrets, setup instructions and repeated `AGENTS.md` rules out of the memory bank.

## Automation execution

- Prefer the configured **APEX Blog Automation** MCP tools for supported long-running Make
  targets; use Make/scripts as the authoritative implementation, not a second execution
  workflow.
- Start using `automation_start`, poll `automation_status`, and inspect `automation_result` and
  applicable `automation_logs` / retained SQLcl diagnostics before declaring success.
  `automation_list` can recover recent job IDs. Treat logs as potentially sensitive.
- Prefer targeted offline checks (such as `test-fast` or `validate`) during editing; use `check`
  when the full gate is required.
- Before `source`, inspect uncommitted `.apx` changes and the DEV-to-Git direction. Do not chain
  `source` with `sync-dev` blindly. For DEV/TEST changes, follow the existing authorization
  rules in `AGENTS.md`; MCP adds no separate approval step.
- Do not automatically retry interrupted database jobs. MCP serializes its own jobs, not other
  direct Make processes, so avoid concurrent operations on the same checkout or database.
- Assume MCP, Docker, SQLcl saved connections and environment variables are configured by the
  human. If unavailable, report the blocker rather than installing or reconfiguring them unless
  asked.
