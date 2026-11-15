# Project Brief

**APEX Blog** (`jariolaine/apex-blog`, MIT license, by Jari Laine) is a
self-hosted personal blog built entirely with Oracle APEX.

## Requirements

- Oracle Database 19c or later (Oracle Text / `CTXAPP` required; parsing schema
  needs `CREATE INDEXTYPE/PROCEDURE/SEQUENCE/TABLE/TRIGGER/VIEW`).
- Oracle APEX **26.1** (current development and validation target; compatibility
  with later releases is not established here).
- An APEX workspace; after install, a workspace user group named **Bloggers**
  authorizes admin application users.

## Product shape: two APEX applications

1. **Blog Administration** (`blog-admin`, DEV app id 402) — privileged content
   and configuration management: posts, categories, tags, post-tags, links and
   link groups, comment moderation (flags/sentiments), dynamic content, file
   repository with OCI object-storage sync, features, settings, AI prompts,
   generative-ai and Google/apex authentication configuration, activity and
   error-log reports dashboards. Requires the Bloggers group.
2. **Blog Public Pages** (`blog`, DEV app id 401) — the reader-facing blog:
   home, single post, search (Oracle Text), tag and category pages, archives,
   links, repository, about, comment submission/login, RSS/Atom feeds.

## Notable capabilities

- Full-text search via Oracle Text ctx indexes on posts and comments.
- Comment workflow with subscribers, flags and AI-assisted sentiment.
- OpenAI-backed APEX generative-AI service `BLOG_OPEN_AI_API` (using web
  credential `BLOG_OPEN_AI_API_KEY`) for prompt-driven features; OCI language
  AI supports comment sentiment, and OCI Object Storage supports files.
- Install/upgrade delivered as full SQL exports **with Supporting Objects**;
  upgrade requires an existing version Release 24.1.0.20240714 or later.

## Out of scope

- `ideas/` is scratch space for drafts/fixes, not shipped code.
- `Stack/` Terraform (OCI Resource Manager always-free stack) is legacy and
  maintained separately from the automation workflow.
