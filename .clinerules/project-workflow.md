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

MCP accepts only a target, not Make variables (such as `PREVIOUS_ZIP=...` or
`RELEASE_DIR=...`). For unsupported targets or options, use an existing
project command only when a suitable execution method is available; otherwise
report the blocker. Do not invent alternative commands, rebuild multi-step
release/deployment workflows by chaining MCP jobs, or configure automation
infrastructure. Follow [`AGENTS.md`](../AGENTS.md) for authorization and safety.

1. Call `apex_blog__automation_start` with the exact `target`. Save the returned
   `id` as `job_id`; a queued job is not a successful one.
2. Call `apex_blog__automation_result(job_id="...")`. It waits up to 120 seconds
   by default and returns early when the job finishes. If `is_terminal=false`,
   call it again with the same ID. Use `timeout_seconds=0` for an immediate
   check (maximum 300 seconds). Do not use terminal `sleep` to wait for jobs.
   Report success only for `state=succeeded` and `exit_code=0`.
3. For failures, inspect `log_tail` and use
   `apex_blog__automation_logs(job_id="...")` for more output. To read a SQLcl
   diagnostic, pass `sqlcl_file` with an exact filename from the result's
   `sqlcl_log_files`. Page with `next_offset`; `end_of_log=true` does not mean
   job completion. Keep sensitive log contents private.
4. Use `apex_blog__automation_list` to recover job IDs after reconnect.
   `apex_blog__automation_cancel` works only for offline jobs; confirm its
   effect with `apex_blog__automation_result(job_id="...", timeout_seconds=0)`.
