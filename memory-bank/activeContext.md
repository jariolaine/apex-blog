# Active Context

## PL/SQL package BLOG_AI findings

Status of the low-priority findings from the November 2026 review of
`Database/Packages/BLOG_AI.pkb` (history in
[`reference/blog-ai-remediation-2026-11.md`](reference/blog-ai-remediation-2026-11.md)):

- **B6 — still open:** `get_param_value` re-raises `no_data_found` for unknown
  keys.

## Release follow-up

- Local candidate, `build/releases/26.1.6.20261117/`, was generated. Its
  manifest records base commit `8db0019` with `gitDirtyAtBuild: true`; the
  packaged exports contain the B5/B8 fixes in their final form — commit
  `f33386fe` replaced the non-existent `apex_debug.debug()` calls with
  `apex_debug.trace()` (payload dumps now log only at TRACE), rewrote
  `README.md`, and bumped `VERSION.txt` to `Release 26.1.6.20261117`.
- TEST acceptance results for this candidate were not independently verified
  here, and no QA/PROD promotion is recorded. Do not promote or treat the
  candidate as validated without checking the actual job outputs.
