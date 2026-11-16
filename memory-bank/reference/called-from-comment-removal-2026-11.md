# Package specification "Called from" comment removal — November 2026

Historical record of a comment-only source cleanup completed on **2026-11-16**.
It is context for earlier decisions, not an instruction to repeat or extend the
removal during unrelated tasks. Current repository source is authoritative.

## What changed

Every `-- Called from:` caller-info comment block was removed from the PL/SQL
package specifications in `Database/Packages/`. Each block consisted of a
`-- Called from:` header line plus its continuation comment lines listing APEX
pages, shortcuts, views, or calling packages (including bare `--` placeholder
lines). Dash separator lines and all declarations were left untouched.

- 81 blocks / 170 comment lines removed across 7 of the 13 specs:
  `BLOG_ADMIN` (24), `BLOG_URL` (17), `BLOG_COMMENT` (12), `BLOG_UTIL` (11),
  `BLOG_HTML` (8), `BLOG_XML` (8), `BLOG_AI` (1).
- No `.pkb` bodies or other `Database/` objects contained such comments.
- Historical patch files (`patch-24-2-20250701-part-*.sql`) were intentionally
  left untouched per the convention of preserving historical upgrade SQL.
- This follows the earlier precedent of removing package specification
  `CHANGE LOG` blocks on 2026-11-14 (see
  [`blog-ai-remediation-2026-11.md`](blog-ai-remediation-2026-11.md)).

## How it was done and regenerated

A one-off Python transform deleted each header line and its continuation
comment lines, stopping exactly at the next dash-separator line (handling both
indented and non-indented block styles). `make supporting` (Git-only assembly,
no database access) then regenerated both derived files, whose diffs matched
the source deletions line for line:

- `applications/blog-admin/supporting-objects/install-scripts/database-objects.sql`
- `applications/blog/supporting-objects/upgrade-scripts/database-objects-upgrade.sql`

## Verification at the time

- `grep -rn "Called from" Database/ applications/` returned zero matches.
- Full offline gate `make check` passed: all pre-commit hooks, 65 unit tests
  OK (2 skipped), `[source-consistency] source checks passed`, both APEXLang
  applications validated, and preflight passed. The deinstall consistency
  check also passed during assembly.

## Database state

No database operations were run for this task. At the time, DEV still held the
older package specs; propagating this change requires an explicitly authorized
`make sync-dev` or `make build`.
