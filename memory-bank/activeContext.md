# Active Context

## Open BLOG_AI findings (recorded 2026-11-15)

These low-priority findings remain from the November remediation of
`Database/Packages/BLOG_AI.pkb`:

- **B5:** Possible foreign-key race if a comment is deleted before
  `merge_sentiment` persists its result.
- **B6:** `get_param_value` re-raises `no_data_found` for unknown keys.
- **B8:** Information-level logging may expose comment text and response JSON.

Inspect current source and tests before changing these paths. Historical
implementation details are in
[`reference/blog-ai-remediation-2026-11.md`](reference/blog-ai-remediation-2026-11.md).

## Release follow-up

- On 2026-11-15, an **unpromoted** candidate was reported at
  `build/releases/26.1.5.20261107/`. It was generated **before** the completed
  seven-message cleanup, so it does not represent the current Git source. The
  directory currently exists on this machine and remains Git-ignored.
- Before any new promotion, establish which candidate represents **current**
  Git source. If no suitably verified post-cleanup candidate exists, build and
  run the required TEST acceptance for a new candidate through the authorized
  workflow. Never treat the historical TEST result as validation of newer
  source changes.

The completed merge, cleanup, and agent-reported TEST rerun are recorded in
[`progress.md`](progress.md).
