# Project Brief

**APEX Blog** (`jariolaine/apex-blog`, MIT license, by Jari Laine) is a
self-hosted personal blog built entirely with Oracle APEX.

## Requirements

- Oracle Database 19c or later (Oracle Text / `CTXAPP` required; parsing schema
  needs `CREATE INDEXTYPE/PROCEDURE/SEQUENCE/TABLE/TRIGGER/VIEW`).
- Oracle APEX 26.1 or later.
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
- Generative AI integration (OpenAI credential `BLOG_OPEN_AI_API`) for comment
  sentiment and prompt-driven features; OCI object storage for files.
- Install/upgrade delivered as full SQL exports **with Supporting Objects**;
  upgrade requires an existing version Release v22.2.1.20230117 or later.

## Out of scope

- `ideas/` is scratch space for drafts/fixes, not shipped code.
- `Stack/` Terraform (OCI Resource Manager always-free stack) is legacy and
  maintained separately from the automation workflow.
