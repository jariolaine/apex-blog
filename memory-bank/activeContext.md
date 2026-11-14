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
- Last commits: `59bd7c66` (CHANGE LOG comments removed from all 13
  `Database/Packages/*.pks` specs and the regenerated Supporting Objects
  install/upgrade SQL; comment-only, 1020 deletions), `e9fde9fa` (obsolete 23.x
  upgrade patch scripts removed, sequences renumbered). Working tree clean.
- A local release candidate exists at `build/releases/26.1.5.20261107/`
  (git-ignored artifact). `build/` contents (candidates, hotfix exports,
  deploy logs, `.locks/`, `.backup.*`) are git-ignored; never commit them.

## Active work: BLOG_AI audit — findings delivered, fixes NOT yet implemented

Analysis of `Database/Packages/BLOG_AI.pks`/`.pkb` completed (read-only; no
edits made). Findings awaiting user approval to implement:

- **B1 (High):** `get_sentiments` and `gen_ai_chat` exist only in the body,
  absent from the spec → unreachable dead code with zero callers (generative
  AI now uses APEX AI Agents on admin p12; live sentiment flow uses REST
  `single_document` + `get_lang_code`/`get_translation`/`merge_sentiment` on
  public p1001 and admin p62). `get_sentiments` is additionally broken (adds
  a `languageCode` param the `batch_document` operation does not declare;
  hardcodes `p_language => 'en'`). Recommendation: delete both plus the now
  unused `gen_ai_generate_msg`/`gen_ai_generate_prompt_msg` `param_t` keys.
- **B2 (latent):** `param_t('lang_ai_compartment_ocid')` is snapshotted once
  at package initialization; `set_lang_ai` never refreshes it for live
  sessions. Masked today because live flows read the attribute directly via
  `blog_util.get_attribute_value` (`result_cache`, auto-invalidated). Fix:
  drop the snapshot from `param_t`.
- **B3:** package initializer would fail loudly (re-raised `no_data_found`)
  if the settings row were missing; make `init_params` defensive.
- **B4:** `get_lang_code`/`get_translation`/`merge_sentiment` have no
  handling for OCI error payloads (missing/mistyped `documents` key → JSON
  exceptions in the background chain); guard with `has('documents')`,
  `validate_conversion` on `to_number(key)`, sensible defaults.
- **B5 (Low):** `merge_sentiment` FK race if comment deleted before merge.
- **B6 (Low):** `get_param_value` re-raises `no_data_found` for unknown keys.
- ~~**B7 (trivial):** spec changelog dates inconsistent~~ — mooted: all
  `CHANGE LOG` blocks were deleted from every `Database/Packages/*.pks` on
  2026-11-14 (340 comment lines removed; descriptions/credits/to-do kept).
- **B8 (Low):** debug logging of full comment text/response JSON at info level.

Confirmed NOT bugs: `apex_exec.execute_rest_source`/`get_parameter_clob`
usage, `response_body` parameter name, `apex_ai.chat` signature 2 and
lowercase `'user'` role, `apex_credential.set_persistent_credentials`
key/value signature, spec `out` vs body `out nocopy` (legal; same pattern in
`BLOG_OCI_OS`).

Planned remediation steps (pending approval): delete dead code (B1), remove
OCID snapshot (B2), defensive init (B3), harden JSON parsers (B4); B7 is moot
(changelogs removed from all specs). Then `make lint` + `make check-source`.
No database commands run.

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

- BLOG_AI remediation (B1–B4 above) is pending user approval to start
  editing; see "Active work" for the full finding list and planned steps.
- Remember: mock-based tests are never proof of database deployment success.
