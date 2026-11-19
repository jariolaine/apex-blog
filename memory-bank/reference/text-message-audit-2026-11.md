# Text-message cleanup decision — November 2026

The audit recorded on **2026-11-14** led to removal of seven definitions on
**2026-11-15**.

| Application | Removed definitions |
| --- | --- |
| Public | `BLOG_ERR_MSG_COMMENT_REQUEST` |
| Admin | `BLOG_AI_GENERATE_MESSAGE`, `BLOG_AI_GENERATE_PROMPT`, `BLOG_MSG_AI_NO_POST_FOR_CONTEXT`, `BLOG_MSG_SELECTED_FILES_DELETED`, `BLOG_TXT_DOWNLOAD`, `BLOG_MSG_NO_DATA_FOUND` |

The Public application's `BLOG_MSG_NO_DATA_FOUND` was deliberately retained.
Its pages use it for empty-result messages; removing the unused Admin
definition did not justify removing the Public definition.

The application-specific lookup and runtime-name dependencies are described
once in [System Patterns](../systemPatterns.md#application-text-messages).
