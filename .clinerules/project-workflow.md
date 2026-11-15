# Cline project workflow

`AGENTS.md` is authoritative for coding rules, source integrity, and database
operations. Use the memory bank as task-specific reference material, not as
instructions that override the current repository.

## Task context

- Read only relevant files: `memory-bank/projectbrief.md` for product scope,
  `systemContext.md` for architecture, `techContext.md` for technical context,
  and `activeContext.md` or `progress.md` when continuing known work. Open
  `memory-bank/reference/` only for related investigations.
- Treat memory-bank records as historical. Verify branch, version, application
  source, database target, candidate existence, and job results against current
  Git, `VERSION.txt`, automation configuration, and actual outputs.
- Update task-relevant memory-bank files after significant changes or when
  requested. Do not duplicate `AGENTS.md` policies in them.

## Long-running automation

- Prefer the available **APEX Blog Automation** MCP tools for supported
  long-running Make targets. The existing Make scripts remain authoritative.
- Call `automation_start`, poll `automation_status`, and inspect
  `automation_result` and relevant logs before claiming success. A queued job
  ID is not proof that a command succeeded; use `automation_list` to recover a
  recent job ID if needed.
- Never automatically retry an interrupted database operation; first
  investigate the target state. MCP jobs run sequentially within the worker,
  but direct Make commands outside the worker may run concurrently.
