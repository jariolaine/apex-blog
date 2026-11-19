# Progress

## Completed application changes

These milestones record source changes from the November 2026 project notes.
They do not describe the state of an installed application.

- **2026-11-14–15:** Completed `BLOG_AI` findings B1–B4: removed unused
  package-body paths and the cached compartment setting, made initialization
  use static parameters, and added null/missing-field handling for comment-AI
  responses. Current call paths and behavior are in the
  [BLOG_AI context](reference/blog-ai-remediation-2026-11.md).
- **2026-11-15:** Removed seven unused application text-message definitions.
  The [cleanup record](reference/text-message-audit-2026-11.md) identifies
  them and explains why Public's `BLOG_MSG_NO_DATA_FOUND` was retained.
- **2026-11-16:** Added comment-existence and concurrency guards around
  `BLOG_AI.merge_sentiment` (B5). Changed input-payload logging in the three
  response routines (B8); the logging calls needed the next day's correction.
- **2026-11-17:** Corrected those input-payload calls to `apex_debug.trace`.
  The Admin Google-authentication build option's source status also became
  `include`; its export default remains `exclude`, as recorded in
  [build options](../applications/blog-admin/shared-components/build-options.apx).

## Remaining application question

The `BLOG_AI.get_param_value` contract (B6) remains unresolved. Its current
behavior and the pending decision are recorded in
[Active Context](activeContext.md#unresolved-blog_ai-parameter-lookup-contract-b6).
