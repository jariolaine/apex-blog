# Technical Context

## Platform constraints

The application's [documented compatibility floor](../README.md#system-requirements)
is Oracle Database 19c and Oracle APEX 26.1. Development uses APEXLang application
definitions and Oracle SQL/PLSQL with APEX runtime and session APIs.

Both applications use Universal Theme. Their JavaScript runs inside APEX and
uses its APIs and `apex.jQuery`. The LESS styles depend on theme variables and
APEX markup, as illustrated by
[ProgramCode.less](../frontend/less/core/ProgramCode.less).

## Content representation

| Content | Storage |
| --- | --- |
| Post HTML | `CLOB` in [BLOG_POSTS](../Database/Tables/BLOG_POSTS.sql) |
| Comment HTML | `VARCHAR2(4000 BYTE)` in [BLOG_COMMENTS](../Database/Tables/BLOG_COMMENTS.sql) |

These different storage limits matter to editing and content conversion.
The native rich-text post editor uses HTML. Its AI response workflow sends
Markdown to the `MARKDOWN_TO_HTML` Ajax callback in
[post properties](../applications/blog-admin/pages/p00012-post-properties.apx),
which calls `BLOG_HTML` before the result is placed in the editor.

## Full-text search

The [post index](../Database/Indexes/BLOG_POSTS_CTX.sql) and
[comment index](../Database/Indexes/BLOG_COMMENTS_CTX.sql) are Oracle Text
`CONTEXT` indexes. Their user datastores call `BLOG_CTX`, and the indexes
synchronize on commit.

## Runtime dependencies

| Integration | Application use and source |
| --- | --- |
| APEX accounts and optional Google sign-in | [Admin authentication schemes](../applications/blog-admin/shared-components/authentications.apx) |
| OCI Language | Comment language detection, translation, and sentiment analysis through `BLOG_LANGUAGE_AI` and `BLOG_AI`; see the [AI context](reference/blog-ai-remediation-2026-11.md) |
| OCI Object Storage | File storage through [BLOG_OBJECT_STORAGE_OBJECT](../applications/blog-admin/shared-components/rest-data-sources/BLOG-OBJECT-STORAGE-OBJECT.apx) and [BLOG_OCI_OS](../Database/Packages/BLOG_OCI_OS.pks) |
| OpenAI through APEX Generative AI | Assisted post writing through [BLOG_OPEN_AI_API](../applications/blog-admin/workspace-components/generative-ai-services/BLOG-OPEN-AI-API.apx) and native APEX AI actions |
| APEX Mail | Comment notifications and subscribed replies in [BLOG_COMMENT](../Database/Packages/BLOG_COMMENT.pkb) |
