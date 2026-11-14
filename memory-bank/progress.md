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

## Completed milestones (from git history, newest first)

- Removed all `CHANGE LOG` comment blocks from every `Database/Packages/*.pks`
  (comment-only deletions); package descriptions/credits/to-do comments kept.
- BLOG_AI package audit completed as read-only analysis (findings B1–B8 in
  `activeContext.md`); no code changes implemented yet.
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

- Implement approved BLOG_AI remediation steps (see `activeContext.md`
  "Active work"); verify with `make lint` and `make check-source` only —
  compile/deploy verification happens solely via an approved release flow.
