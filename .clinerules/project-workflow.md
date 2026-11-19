# Project workflow

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

## MCP automation

For a documented `make TARGET` operation, prefer
`apex_blog__automation_start(target="TARGET")` when MCP supports that target.
For example, `make check` maps to `apex_blog__automation_start(target="check")`.
Use `apex_blog__automation_capabilities` if support or side effects are unclear;
do not guess valid targets.

MCP accepts only a target and, for `pretest` only, a validated optional
`test` selection (`install`, `upgrade`, `deinstall`; omission runs all). It
cannot accept arbitrary Make variables (such as `RELEASE_DIR=...`).
Previous-release ZIP overrides are also not supported by direct Make. For unsupported targets or options, use an existing
project command only when a suitable execution method is available; otherwise
report the blocker. Do not invent alternative commands, rebuild multi-step
release/deployment workflows by chaining MCP jobs, or configure automation
infrastructure. Follow [`AGENTS.md`](../AGENTS.md) for authorization and safety.

1. Call `apex_blog__automation_start` with the exact `target`. It waits up to
   30 seconds by default (maximum 60) and returns early if the job finishes.
   Save the returned `id` as `job_id`. Set `wait_seconds=0` to submit without
   waiting; submission alone is not success.
2. If `is_terminal=false`, call `apex_blog__automation_result(job_id="...")`.
   It waits up to 120 seconds by default (maximum 300), returning early on
   completion. Repeat while still active, or use `timeout_seconds=0` for an
   immediate check. Do not use terminal `sleep` to wait for jobs. Report
   success only for `state=succeeded` and `exit_code=0`, whether returned
   by start or result.
3. For failures, inspect `log_tail` and use
   `apex_blog__automation_logs(job_id="...")` for more output. To read a SQLcl
   diagnostic, pass `sqlcl_file` with an exact filename from the result's
   `sqlcl_log_files`. Page with `next_offset`; `end_of_log=true` does not mean
   job completion. Keep sensitive log contents private.
4. Use `apex_blog__automation_list` to recover job IDs after reconnect.
   `apex_blog__automation_cancel` works only for offline jobs; confirm its
   effect with `apex_blog__automation_result(job_id="...", timeout_seconds=0)`.
