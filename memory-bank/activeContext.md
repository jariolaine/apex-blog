# Active Context

## BLOG_AI findings

Status of the low-priority findings from the November 2026 review of
`Database/Packages/BLOG_AI.pkb` (history in
[`reference/blog-ai-remediation-2026-11.md`](reference/blog-ai-remediation-2026-11.md)):

- **B5 — resolved 2026-11-16 (Git source only):** `merge_sentiment` now applies
  each analyze result only while the comment row still exists (the merge source
  is gated by `exists (select 1 from blog_comments …)`), and the residual
  per-row race is caught: `dup_val_on_index` and FK violation (`pragma
  exception_init(…, -2291)`) log a warn-level skip and continue.
- **B8 — resolved 2026-11-16 (Git source only):** the full request/response
  payload dumps in `merge_sentiment`, `get_lang_code`, and `get_translation`
  moved from `apex_debug.info` to `apex_debug.debug`. Static config logging is
  unchanged.
- **B6 — still open:** `get_param_value` re-raises `no_data_found` for unknown
  keys.

Both fixes were regenerated into the Git-owned Supporting Objects install and
upgrade SQL with `make supporting`; the full offline gate (`make check`) passed
and both APEXLang applications validated. **No database received these changes.**
DEV and every deployed environment still run the pre-B5/B8 body until an
explicitly authorized `make sync-dev` or `make build` propagates them.

## LESS sources moved under frontend/

Commit `6dbc5c9d` relocated the LESS sources from top-level `less/` to
`frontend/less/` but left stale path references, which broke 23 offline unit
tests and made release candidate manifest creation/verification raise on the
missing `less/` source directory. Corrected in Git: `SOURCE_DIRS` in
`automation/lib/release_manifest.py`, the fixture folder list in
`automation/tests/workflow_fixture.py`, the stylelint glob in `package.json`,
the `css-less` trigger regex in `.pre-commit-config.yaml`, and the AGENTS.md /
memory-bank descriptions. Because the source-fingerprint digest scheme changed
(it now hashes `frontend/` instead of `less/`), digests recorded in older
candidate manifests are no longer reproducible from current source.

## Release follow-up

- The only local candidate, `build/releases/26.1.5.20261107/`, was generated
  **before** the orphan-message cleanup, the "Called from" comment removal, the
  B5/B8 fixes, and the `frontend/` drift corrections. It does not represent
  current Git source and cannot pass a current source-fingerprint check.
- Before any promotion, build a **new** candidate through the authorized
  `make build` workflow (DEV + TEST authorization required) and run the real
  TEST acceptance against it. Never treat historical TEST results as validation
  of the current source.

