# Active Context

Snapshot: **2026-11-15**. This is historical project state, **not** proof of the present branch,
DEV schema, release candidate or deployment status. Verify with Git, `VERSION.txt`, current
automation configuration and job results.

## Recent work

- Work on `blog-ai-remediation` was fast-forward merged into `APEX_26.1` on 2026-11-15; the old
  feature branch was stale at that time. `VERSION.txt` then read `Release 26.1.5.20261107`.
- `Database/Packages/BLOG_AI.pkb` remediation B1–B4 was completed without changing the `.pks`
  public API. Git-owned Supporting Objects SQL was regenerated, and the updated body compiled
  during real disposable-TEST upgrade and fresh-install acceptance. Details:
  [`reference/blog-ai-remediation-2026-11.md`](reference/blog-ai-remediation-2026-11.md).
- Seven orphan APEX text messages were removed from both applications. After an authorized DEV
  sync, the `make source` round trip showed no diff on 2026-11-15. Details and read-only audit
  method: [`reference/text-message-audit-2026-11.md`](reference/text-message-audit-2026-11.md).

## Unresolved BLOG_AI findings (low priority)

- **B5:** possible foreign-key race when a comment is deleted before `merge_sentiment` persists
  its result.
- **B6:** `get_param_value` re-raises `no_data_found` for an unknown key.
- **B8:** information-level logs may include comment text and response JSON.

These findings were intentionally left unchanged in the November 2026 remediation. Inspect
current code and tests before deciding whether to address them.

## Release status at the snapshot

- A candidate was reported under `build/releases/26.1.5.20261107/`. Earlier real TEST upgrade,
  fresh-install and deinstall acceptance reportedly passed (zero user objects after deinstall).
  An agent also recorded a successful MCP `test-release` rerun on **2026-11-15**, with TEST left
  empty; see `progress.md`. The supplied documentation contains no job logs for independent
  confirmation.
- **That candidate predated the orphan-message cleanup** and did not represent the final Git
  source. It was unpromoted, and the owner planned to rebuild when release preparation resumed.
- Generated `build/` artifacts are ignored and may not exist in this checkout. Never promote a
  historical path on the strength of this snapshot; verify an appropriate candidate against
  current Git and complete required acceptance and authorization.

For everyday development rules, consult `AGENTS.md` rather than copying them into this file.
