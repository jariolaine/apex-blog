# BLOG_AI application context

The November 2026 review concerned
[`BLOG_AI`](../../Database/Packages/BLOG_AI.pkb). Its
[package specification](../../Database/Packages/BLOG_AI.pks) exposes AI
configuration, parameter lookup, language/translation response parsing, and
comment sentiment persistence.

## Application call paths

- [Public comment entry](../../applications/blog/pages/p01001-comment.apx) and
  [Admin comment editing](../../applications/blog-admin/pages/p00062-comment-form.apx)
  use the `BLOG_LANGUAGE_AI` REST source's `single_document` operation and
  call `GET_LANG_CODE`, `GET_TRANSLATION`, and `MERGE_SENTIMENT`.
- [Language-AI configuration](../../applications/blog-admin/pages/p20015-language-ai-configuration.apx)
  and [generative-AI configuration](../../applications/blog-admin/pages/p20016-generative-ai-configuration.apx)
  call `BLOG_AI` to configure the integrations.
- [Post properties](../../applications/blog-admin/pages/p00012-post-properties.apx)
  uses native APEX `showAiAssistant` and `generateTextWithAi` actions.
  `blog.admin.ai.valueToAiInput` and `blog.admin.ai.useResponse` in
  [admin.js](../../frontend/js/admin.js) connect the page items to those actions.

## Implementation decisions

- `init_params` stores static identifiers and setting names. The comment
  pages obtain the compartment value through `BLOG_UTIL.get_attribute_value`
  when needed, avoiding a settings-table read during package initialization.
- `get_lang_code` defaults to `en` and selects the highest-scoring language
  with both `code` and `score` from the first response document.
  `get_translation` defaults to null and reads the first document's
  `translatedText` when present.
- `merge_sentiment` skips missing/non-digit document keys, checks that the
  comment still exists, and handles duplicate-value and missing-parent-key
  errors around the merge. These guards account for a comment being deleted
  while its sentiment response is being processed.
- The three response routines log input JSON with `apex_debug.trace`.
- Null payloads and the specified missing fields have fallback behavior.
  The routines do not provide general exception handling for malformed JSON.

The unresolved parameter-lookup behavior is recorded in
[active context](../activeContext.md).
