# Progress

Historical milestones recorded through **2026-11-17**.

## Completed work

- **2026-11-17 (Git source only):** Commit `f33386fe` completed B8: the three
  input-document logging calls added on 2026-11-16 used `apex_debug.debug()`,
  which does not exist in the `apex_debug` API (offline gates do not compile
  PL/SQL, so this was not caught until review); they now use
  `apex_debug.trace()`. The same commit rewrote `README.md` (two-application
  architecture overview, expanded prerequisites, numbered import steps,
  Bloggers-group setup and upgrade guidance), set the Google-authentication
  build option status to `include`, dropped APEX-version wording from
  `admin.js` doc comments, bumped `VERSION.txt` to `Release 26.1.6.20261117`
  and regenerated Supporting Objects; the matching local candidate was
  generated (manifest base commit `8db0019`, dirty at build).
- **2026-11-16 (Git source only):** Resolved BLOG_AI findings **B5** and **B8**:
  `merge_sentiment` now gates its merge on the comment still existing and skips
  residual concurrent-change races with warn-level logging; payload dumps in
  `merge_sentiment`/`get_lang_code`/`get_translation` moved from info to debug
  level. Regenerated Supporting Objects; full offline gate passed (65 tests,
  both apps validated). Details in [`activeContext.md`](activeContext.md).
- **2026-11-16:** Corrected stale path references left by the `less/` →
  `frontend/less/` relocation (commit `6dbc5c9d`): release-manifest
  `SOURCE_DIRS`, workflow test fixture, stylelint glob, pre-commit trigger
  regex, and documentation. This had broken 23 offline tests and blocked
  candidate manifest create/verify.
- **2026-11-14–15:** Implemented BLOG_AI remediation **B1–B4** in the package
  body without changing the public specification; regenerated Git-owned
  Supporting Objects. At that time, real disposable-TEST upgrade and fresh
  install compiled the updated body. See
  [`reference/blog-ai-remediation-2026-11.md`](reference/blog-ai-remediation-2026-11.md).
- **2026-11-15:** Fast-forward merged `blog-ai-remediation` into `APEX_26.1` and
  removed seven orphan application text messages. Authorized DEV sync followed
  by `make source` produced no diff **at that time**. See
  [`reference/text-message-audit-2026-11.md`](reference/text-message-audit-2026-11.md).
- **2026-11-15 (agent-reported, not independently verified):** An MCP
  `test-release` rerun reportedly passed upgrade from the latest published
  release, fresh install, and deinstall, leaving TEST with zero user objects.
  This was reported for the still-unpromoted candidate `26.1.5.20261107`;
  no MCP job logs accompanied the report. It does not validate changes made
  after that candidate was generated.
- **Earlier:** Migrated to APEX 26.1/APEXLang and established offline safety
  checks, immutable release candidates, QA/PROD promotion, and a separate
  emergency hotfix workflow. Consult Git history for implementation details.

Outstanding BLOG_AI findings and the release candidate follow-up are in
[`activeContext.md`](activeContext.md).
