# BLOG_AI remediation — November 2026

Historical investigation and implementation details for `Database/Packages/BLOG_AI.pkb`. These
findings were recorded on **2026-11-14–15**. Check current source before applying further
changes.

## Completed work (B1–B4)

The public `.pks` API was unchanged (`get_param_value`, `set_lang_ai`, `set_gen_ai`,
`merge_sentiment`, `get_lang_code`, `get_translation`). The Git-owned Supporting Objects
install/upgrade SQL was regenerated from the updated body.

- **B1 — dead paths removed:** Deleted body-only `get_sentiments` and `gen_ai_chat`, their
  `param_t('gen_ai_generate_msg')` / `param_t('gen_ai_generate_prompt_msg')` keys, and related
  debug lines. Callers were rechecked as zero. The active generative-AI flow uses APEX AI Agents
  on Admin p12; active sentiment processing uses REST `single_document` → `get_lang_code` /
  `get_translation` / `merge_sentiment` on Public p1001 and Admin p62. The removed
  `get_sentiments` had an undeclared `languageCode` parameter and hardcoded
  `p_language => 'en'`.
- **B2 — stale configuration snapshot removed:** Deleted cached
  `param_t('lang_ai_compartment_ocid')`. Active flows obtain the setting through
  `blog_util.get_attribute_value` (`result_cache`, automatically invalidated); Admin p20015
  retains the attribute *name* through `get_param_value('lang_ai_compartment_param_name')`.
- **B3 — initialization stabilized:** As a result of B2, `init_params` assigns literals only and
  no longer raises `no_data_found` from an absent settings row at package instantiation.
- **B4 — JSON parsing hardened:** Parsers return early on null input and check for `documents`
  before reading its array; `get_lang_code` also checks `languages`. `merge_sentiment` skips
  entries with absent/non-numeric `key` using `regexp_like(key, '^[0-9]+$')` before `to_number`;
  `get_lang_code` skips entries without `code` or `score`; `get_translation` leaves null when
  `translatedText` is absent. Skipped positions are logged with `blog_util.int_to_vc2(i)`.

The review found **no bug** in the checked `apex_exec.execute_rest_source` /
`get_parameter_clob` usage, `response_body` parameter, `apex_ai.chat` signature and lowercase
`'user'` role, `apex_credential.set_persistent_credentials` key/value signature, or spec `out`
versus body `out nocopy` (legal; also used in `BLOG_OCI_OS`).

## Verification at the time

Offline checks passed (`make lint`, `make check-source`, `make test` — 49 tests, and
`make check-schema`). The new body compiled during
**real disposable-TEST upgrade and fresh-install** acceptance. The deinstall test left zero user
objects. This historical verification does not prove current DEV, TEST or PROD state.

## Intentionally open low-severity findings

Recorded as open at the time of the review:

- **B5:** A possible foreign-key race if a comment is deleted before sentiment merge.
- **B6:** `get_param_value` re-raises `no_data_found` for unknown keys.
- **B8:** Verbose info-level logging of comment text and response JSON.

**Update 2026-11-16:** B5 and B8 were resolved in Git source only (not yet
deployed to any database); see [`../activeContext.md`](../activeContext.md).
B6 remains open.

B7 became moot when package specification `CHANGE LOG` blocks were removed on 2026-11-14.
Continue with current source review and task-specific testing rather than treating this history
as an execution instruction.
