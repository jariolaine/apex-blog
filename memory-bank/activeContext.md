# Active Context

Snapshot date: 2026-11-14.

## Memory bank maintenance

- This bank **summarizes and points to** canonical sources. When in doubt or on
  conflict, the canonical file wins: `Makefile` help text (authoritative
  command list), `AGENTS.md` (mandatory agent safety rules and permissions),
  `automation/docs/ARCHITECTURE.md`, `RUNBOOK.md`, and `ENVIRONMENTS.md`.
- Keep summaries short; never duplicate full command lists.
- Never record passwords, wallets, connect strings, or
  `automation/variables.local.sh` values here.

## Current state

- Branch: `APEX_26.1`. Version: `Release 26.1.5.20261107` (`VERSION.txt`).
- No repository commits since the previous snapshot; last commit remains
  `de90ff38` (`.gitignore` reorganization, 2026-11-12). Earlier themes:
  `blog_ai` package fixes (JSON syntax, divide-by-zero, typos), RSS support
  refactor, code-structure readability refactor, docs rename `AGENT.md` →
  `AGENTS.md`.
- Working tree has only the new untracked `memory-bank/` and `.clinerules/`
  (memory-bank rule); whether to commit them is the user's call.
- A local release candidate exists at `build/releases/26.1.5.20261107/`
  (git-ignored artifact). `build/` contents (candidates, hotfix exports,
  deploy logs, `.locks/`, `.backup.*`) are git-ignored; never commit them.

## Standing working conventions

1. Check `git status --short` before editing; work in small reviewable steps;
   preserve unrelated files and existing behavior.
2. Never invent APEXLang syntax, SQLcl flags, paths, or Make targets — verify
   against the actual files. Oracle APEX 26.1 skill/reference is optional but
   available for APEX questions.
3. Local checks first (`make doctor`, `make lint`, `make test`, `make check`);
   if SQLcl is missing, say so instead of guessing.
4. Database commands are never run automatically: DEV/QA/PROD/hotfix and TEST
   resets all need explicit human approval, plus verification of the saved
   SQLcl connection and target schema/workspace first.
5. `make source` (DEV→Git) and `make sync-dev` (Git→DEV) move source in
   opposite directions; never run both blindly, always review diffs.
6. Historical upgrade SQL keeps old version dates — do not "fix" old patch
   versions to match the current one.
7. Do not suppress or weaken tests/checks to make builds pass; report failures.
8. When changing schema objects, keep `Database/`, `automation/schema/*.list`,
   Supporting Objects install/upgrade SQL, and the manually maintained Admin
   deinstall script consistent (specs before bodies; paired `.pks`/`.pkb`).
9. LESS and generated CSS (plus `.min` variants and static-file metadata in
   `shared-components.apx`) must be kept consistent by hand.
10. Report at task end: changed files, tests run + results, database actions
    not run, remaining risks/approvals still needed.

## Open threads / reminders

- No pending tasks recorded yet; update this section as work begins.
- Remember: mock-based tests are never proof of database deployment success.
