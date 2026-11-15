# Progress

## What works

- Both APEXLang applications run on APEX 26.1 (public id 401, admin id 402 in
  DEV); full feature set documented in `projectbrief.md` is functional.
- Immutable-candidate release pipeline (`make build` → verified candidate →
  QA → PROD) with offline gate (`make check`), candidate locks/rollback, and
  real TEST-schema upgrade/install/deinstall acceptance (deinstall verified to
  leave zero user objects).
- Offline safety test suite in `automation/tests/` (schema manifests, metadata
  source, preserved static parity, hotfix, CI contract, workflow tests) with
  `mock_sqlcl.py` recorder — offline only, never proof of real deployment.
- Emergency hotfix path (`make hotfix-export` / `make hotfix-production`,
  `OBJECTS=NO` to skip Supporting Objects) is gate-exempt by design.

## Completed milestones (newest first)

- Owner verified the orphan-message changes in DEV, so `blog-ai-remediation` was merged
  back into `APEX_26.1` on 2026-11-15 (fast-forward; the branch was strictly ahead, so
  no conflicts and no merge commit). The old local branch is now stale.
- Removed the 7 orphan text messages found by the audit: public
  `BLOG_ERR_MSG_COMMENT_REQUEST`; admin `BLOG_AI_GENERATE_MESSAGE`,
  `BLOG_AI_GENERATE_PROMPT`, `BLOG_MSG_AI_NO_POST_FOR_CONTEXT`,
  `BLOG_MSG_SELECTED_FILES_DELETED`, `BLOG_TXT_DOWNLOAD`, `BLOG_MSG_NO_DATA_FOUND`.
  Git edits pushed to DEV with `make sync-dev`; the follow-up `make source` round trip
  produced no diff, so DEV matches Git.
- Orphan-message audit of both apps' `messages.apx` completed as read-only
  analysis; per-app resolution model and audit procedure documented in
  `systemContext.md`.
- BLOG_AI remediation B1–B4 implemented in `Database/Packages/BLOG_AI.pkb` (dead
  body-only `get_sentiments`/`gen_ai_chat` and their `param_t` keys removed; stale
  `lang_ai_compartment_ocid` snapshot dropped — which also made init safe; null-payload,
  `has('documents')` and per-entry JSON guards added). Spec unchanged, public API
  identical. Supporting Objects regenerated from Git, DEV synced (strict source
  consistency green), and the candidate passed real TEST upgrade + fresh install +
  deinstall — so the new body compiles on a real database.
- Removed all `CHANGE LOG` comment blocks from every `Database/Packages/*.pks`
  (comment-only deletions); package descriptions/credits/to-do comments kept.
- BLOG_AI package audit completed as read-only analysis; remaining Low findings
  (B5/B6/B8) recorded in `activeContext.md`.
- 26.1.5 line: blog_ai package fixes (JSON syntax, divide-by-zero, typos),
  RSS refactor, readability refactor, `AGENT.md` → `AGENTS.md` rename,
  `.gitignore` reorganization, memory bank + Cline workflow rules,
  "Oracle APEX" reference rename.
- Release-safety hardening: installer/upgrade-test safety, refactored release
  management and source-consistency checks, linting + GitHub Actions CI,
  obsolete tests removed and CI contracts added.
- QA hotfix path introduced; Supporting Objects optional install on hotfix.
- Migrate to APEX 26.1: initial APEXLang export, separated static-file/SQL
  exports removed, admin theme updated, new APEX 26.1 features (e.g. Button
  Action) adopted; automation scripts built (`automation/`).
- Earlier product history: APEX 24.1/24.2 upgrades, AI + OCI object-storage
  features, new reports pages, canonical-link/meta-tag work.

## Known issues / standing constraints

- `stack` ZIP and `Stack/` Terraform are legacy, maintained outside the
  automation workflow.
- Generated artifacts under `build/` are never committed; historical upgrade
  SQL keeps old version dates.
- LESS→CSS (and `.min`) syncing and Admin `deinstall-script.sql` maintenance
  are manual.

## What's next

- Promote the verified candidate `build/releases/26.1.5.20261107/` to QA (`make qa`)
  and then PROD (`make production`) — both need explicit approval.
- Rebuild the release candidate when it is time to release; the current local candidate
  predates the message removal, which the owner accepts while development continues.
