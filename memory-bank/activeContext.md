# Active Context

Snapshot date: 2026-11-15.

## Memory bank maintenance

- This bank **summarizes and points to** canonical sources. When in doubt or on
  conflict, the canonical file wins: `Makefile` help text (authoritative
  command list), `AGENTS.md` (mandatory agent safety rules and permissions),
  `automation/docs/ARCHITECTURE.md`, `RUNBOOK.md`, and `ENVIRONMENTS.md`.
- Keep summaries short; never duplicate full command lists.
- Never record passwords, wallets, connect strings, or
  `automation/variables.local.sh` values here.

## Current state

- Branch: `APEX_26.1`. The feature branch `blog-ai-remediation` was merged back into it
  on 2026-11-15 (fast-forward; it was strictly ahead, so no conflicts and no merge
  commit). All BLOG_AI remediation and orphan-message work now lives on `APEX_26.1`;
  the old local branch is stale — do not add new work to it. Version:
  `Release 26.1.5.20261107` (`VERSION.txt`).
- BLOG_AI remediation is committed on this branch; DEV (saved connection
  `blog_dev`, workspace/schema `BLOG_040000`, apps 402/401) was synced from Git and
  the strict release source-consistency check passed, so DEV matches Git.
- The local candidate `build/releases/26.1.5.20261107/` was rebuilt with
  `OVERWRITE=YES` and **passed real TEST-schema upgrade, fresh-install and deinstall
  acceptance** (deinstall left zero user objects) — the new `BLOG_AI` body compiles.
  It is still **unpromoted**; QA/PROD deployment needs approval. `build/` contents
  (candidates, hotfix exports, deploy logs, `.locks/`, `.backup.*`) are git-ignored;
  never commit them.
- That candidate was packaged **before** the orphan-message removal, so it no longer
  mirrors current Git source. The owner confirmed this is fine: development is still
  ongoing, the candidate only exists to run the disposable TEST database checks, and it
  will be rebuilt when release time comes. Do not treat its contents as current truth.

## Active work: BLOG_AI remediation implemented and TEST-verified

Implemented 2026-11-14 in `Database/Packages/BLOG_AI.pkb` and regenerated into the
Git-owned Supporting Objects install/upgrade SQL. The spec `.pks` is unchanged and the
public API is identical (`get_param_value`, `set_lang_ai`, `set_gen_ai`,
`merge_sentiment`, `get_lang_code`, `get_translation`). Offline checks green:
`make lint`, `make check-source`, `make test` (49 tests), `make check-schema`; the body
then compiled for real during the disposable-TEST upgrade and fresh-install acceptance
runs.

- **B1:** dead body-only `get_sentiments` and `gen_ai_chat` deleted together with the
  `param_t( 'gen_ai_generate_msg' )` / `param_t( 'gen_ai_generate_prompt_msg' )` keys
  and their debug lines. Callers re-verified as zero (generative AI uses APEX AI Agents
  on admin p12; the live sentiment flow is REST `single_document` → `get_lang_code` /
  `get_translation` / `merge_sentiment` on public p1001 and admin p62). `get_sentiments`
  had also been broken (undeclared `languageCode` param, hardcoded `p_language => 'en'`).
- **B2:** the once-snapshotted `param_t( 'lang_ai_compartment_ocid' )` is gone; live
  flows still read the setting directly via `blog_util.get_attribute_value`
  (`result_cache`, auto-invalidated), and admin p20015 keeps the attribute *name*
  through `get_param_value( 'lang_ai_compartment_param_name' )`.
- **B3:** satisfied by B2 — `init_params` now assigns literals only, so package
  instantiation can no longer raise `no_data_found` from a missing settings row.
- **B4:** every live parser returns early on a null payload and checks
  `has( 'documents' )` before `get_array`; `get_lang_code` also checks
  `has( 'languages' )`. Per-entry guards: `merge_sentiment` skips entries whose `key` is
  missing or fails `regexp_like( key, '^[0-9]+$' )` before `to_number`, `get_lang_code`
  skips entries missing `code`/`score`, `get_translation` keeps null without
  `translatedText`. `regexp_like` was chosen over `validate_conversion` for readability;
  skipped-entry positions are logged with `blog_util.int_to_vc2( i )`.
- **Still open (Low, deliberately untouched):** B5 FK race when a comment is deleted
  before the sentiment merge; B6 `get_param_value` re-raising `no_data_found` for unknown
  keys; B8 verbose info-level logging of comment text and response JSON. B7 stays moot
  (all spec `CHANGE LOG` blocks were removed on 2026-11-14).

Confirmed NOT bugs (audit): `apex_exec.execute_rest_source` / `get_parameter_clob`
usage, `response_body` parameter name, `apex_ai.chat` signature and lowercase `'user'`
role, `apex_credential.set_persistent_credentials` key/value signature, spec `out` vs
body `out nocopy` (legal; same pattern in `BLOG_OCI_OS`).

## Completed work: 7 orphan text messages removed (2026-11-15)

Followed the audit in `systemContext.md`. Edited both Git-owned `messages.apx` files,
then pushed to DEV with `make sync-dev`; the follow-up `make source` produced **no
diff**, confirming DEV and Git agree again.

- Public `applications/blog/shared-components/messages.apx`: removed
  `BLOG_ERR_MSG_COMMENT_REQUEST` (21 -> 20 messages).
- Admin `applications/blog-admin/shared-components/messages.apx`: removed
  `BLOG_AI_GENERATE_MESSAGE`, `BLOG_AI_GENERATE_PROMPT` (dead since B1),
  `BLOG_MSG_AI_NO_POST_FOR_CONTEXT`, `BLOG_MSG_SELECTED_FILES_DELETED`,
  `BLOG_TXT_DOWNLOAD` and `BLOG_MSG_NO_DATA_FOUND` (184 -> 178 messages; the public
  app keeps its own live `BLOG_MSG_NO_DATA_FOUND`).
- Re-verified after deletion: zero references to any removed name in either app or in
  `Database/`; the public `BLOG_MSG_NO_DATA_FOUND` is still referenced by public pages.
- Checks run: `make supporting` (no diff), `make lint`, `make check-source`,
  `make validate`, and the full preflight inside `make sync-dev` (49 offline tests OK,
  both apps validated) — all green.

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

- Supporting Objects now carry the fixed body (regenerated with `make supporting`, then
  re-assembled unchanged inside `make build`) — nothing left to regenerate.
- Promoting the verified candidate `26.1.5.20261107` (`make qa`, then
  `make production`) still needs explicit human approval.
- Orphan-message cleanup is **done** (see "Completed work" above); nothing left to
  delete. Re-running the audit procedure in `systemContext.md` should now find zero
  orphans.
- Remember: mock-based tests are never proof of database deployment success — the real
  proof here was the disposable-TEST upgrade/install/deinstall acceptance runs.
