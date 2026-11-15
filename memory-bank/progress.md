# Progress

Snapshot: **2026-11-15**. Validate present status against Git, `VERSION.txt`, build artifacts
and environment state.

## Established functionality

- Both APEXLang applications target APEX 26.1; DEV application IDs were 402 (Admin) and 401
  (Public) at the snapshot. See `projectbrief.md` for product capabilities.
- Release automation supports immutable, checksummed candidates, offline preflight,
  disposable-TEST upgrade/install/deinstall acceptance, and authorized QA/PROD promotion. The
  emergency QA/UAT → PROD hotfix path is separate and gate-exempt by design.
- Offline safety tests cover schema manifests, source metadata/parity, candidate locks and
  rollback, environment boundaries and CI contracts. These tests use mock SQLcl and do **not**
  prove a real Oracle deployment.

## Recent completed work

- **2026-11-15 (agent-reported):** A `test-release` job through **APEX Blog Automation**
  reportedly re-ran upgrade (from GitHub's latest published release), fresh install and
  deinstall acceptance for the still-unpromoted candidate `26.1.5.20261107`. The report states
  TEST ended empty, with **zero user objects**. No MCP job logs accompanied the reported change;
  verify the result when needed. This rerun does **not** make the pre-message-cleanup candidate
  representative of the final current source.
- **2026-11-15:** merged `blog-ai-remediation` into `APEX_26.1` and removed seven unused text
  messages. Authorized DEV synchronization followed by source re-export showed no diff. See
  [`reference/text-message-audit-2026-11.md`](reference/text-message-audit-2026-11.md).
- **2026-11-14–15:** BLOG_AI remediation B1–B4 (dead code/settings snapshot and JSON validation)
  was implemented in the package body, with Supporting Objects regenerated from Git. Real TEST
  upgrade and fresh install compiled the new body. See
  [`reference/blog-ai-remediation-2026-11.md`](reference/blog-ai-remediation-2026-11.md).
- Earlier milestones included migration to APEX 26.1/APEXLang, source consistency checks, CI and
  candidate integrity hardening, and the emergency hotfix route. Inspect commit history for
  task-specific implementation details.

## Remaining concerns

- Low-priority BLOG_AI findings **B5, B6 and B8** remain open; see `activeContext.md`.
- `Stack/` Terraform and the stack ZIP are legacy, outside the core automation workflow.
- LESS-to-CSS synchronization and the Admin deinstall script still require explicit source
  maintenance.
- The versioned candidate reported in November 2026 was generated **before** the completed
  message cleanup. Its presence and validity are unverified in a new checkout.

## Next release work

- Confirm current version and Git state, prepare a candidate representing **current** source,
  and run the required authorized TEST acceptance before any QA or PROD promotion. Do not assume
  an ignored candidate directory exists or that a historical TEST pass validates newer changes.
