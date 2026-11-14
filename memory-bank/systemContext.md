# System Context

## Top-level repository map

| Path | Ownership / purpose |
| --- | --- |
| `applications/blog/` | Public Pages app APEXLang source + Supporting Objects + static files |
| `applications/blog-admin/` | Admin app APEXLang source + Supporting Objects (incl. **manually maintained** `deinstall-script.sql`) |
| `Database/` | Git-tracked schema SQL: `Tables/`, `Packages/` (`.pks`/`.pkb`), `Views/`, `Triggers/`, `Sequences/`, `Indexes/` |
| `automation/` | All release/CI automation scripts, docs, offline tests (see below) |
| `automation/schema/install.list`, `upgrade.list` | Explicit object install/upgrade order; every `.pks` pairs with a `.pkb`; all specs precede bodies |
| `build/releases/<version>/` | Immutable checksummed candidate (manifest.json, SHA256SUMS, both SQL exports, both ZIPs) — **never committed** |
| `build/hotfix/` | Emergency QA→PROD exports/logs — never committed |
| `less/` | LESS source (`style.less`, `admin.less`, `rss.less`, `core/*.less`) compiled/minified into app static files; keep both in sync |
| `ideas/` | Non-shipping scratch notes, draft SQL/LESS |
| `Stack/` | Legacy OCI Resource Manager Terraform stack |
| `VERSION.txt` | Release version authority, format `Release x.y.z.YYYYMMDD` (currently `Release 26.1.5.20261107`) |

## Application details

- Both apps: Universal Theme, global page 0, nav lists, session-state
  protection, minified static assets via `#APP_FILES#`.
- `blog` static files: `js/blog.js(.min.js)`, `css/style(.min).css`,
  `rss(.min).css`, icons. Plugins: item `mathQuestionField`, template
  component `footerLinkCustom-theme-universal-theme`.
- `blog-admin` static files: `js/admin.js(.min.js)`, `css/admin(.min).css`.
  Plugins: DA `copyToClipboard`, DA `speechRecognition`, template components
  `buttonCustom-...`, `footerLinkCustom-...`, `iconCustom-...`. Gen-AI service
  `@BLOG_OPEN_AI_API`; authorization scheme `@bloggers` (workspace group).
- Admin pages (id → purpose): 0 global, 1 home, 11 posts, 12 post-properties,
  14 categories, 15 tags, 16 post-tags, 50/51/52/53 links & link groups,
  60/61/62 comments, 80/81 popup pages, 201 help, 202 about, 300-303 file
  repository/upload, 501 my-profile, 9999 login, 20010 administration hub,
  20011 features, 20012 settings, 20013 object-storage config, 20014 file
  synchronization, 20015 language-AI config, 20016 generative-AI config,
  20017 google-auth, 20018 apex-auth, 20019 oci-api-key, 20020 AI prompts,
  20100 setting help, 30000 reports, 30020 activity dashboard, 30021 page-view
  metric, 30022 app-error-log, 30023 page-performance, 30024 page-views,
  30025 error-debug-log, 30026 session-log.
- Public pages: 0 global, 1 home, 2 post, 4 search, 6 tag, 10 links, 11
  repository, 12 about, 14 category, 15 archives, 1001 comment, 1002
  information, 1003 pgm, 9999 login.

## Database packages (spec `.pks` + body `.pkb` each)

| Package | Responsibility |
| --- | --- |
| `BLOG_ADMIN` | Admin app data operations |
| `BLOG_AI` | Language AI: OCI sentiment/detect-language/translate via REST data source `BLOG_LANGUAGE_AI`; config for admin pages 20015/20016; public surface is `get_param_value`, `set_lang_ai`, `set_gen_ai`, `merge_sentiment`, `get_lang_code`, `get_translation` (dead body-only `get_sentiments`/`gen_ai_chat` removed 2026-11-14) |
| `BLOG_COMMENT` | Comment management workflow |
| `BLOG_CTX` | Oracle Text indexing/sync |
| `BLOG_FILE` | File repository operations |
| `BLOG_HTML` | HTML generation/rendering |
| `BLOG_INSTALL` | Install/upgrade support |
| `BLOG_MIME` | MIME type handling |
| `BLOG_OCI_OS` | OCI object storage REST calls |
| `BLOG_PLUGIN` | APEX plugin render/validate/AJAX callbacks |
| `BLOG_URL` | URL generation |
| `BLOG_UTIL` | Shared utilities for both apps |
| `BLOG_XML` | RSS/Atom feed generation |

Core tables: `BLOG_POSTS`, `BLOG_BLOGGERS`, `BLOG_CATEGORIES`, `BLOG_TAGS`,
`BLOG_POST_TAGS`, `BLOG_COMMENTS` (+ flags, sentiments, subscribers),
`BLOG_LINKS`/`BLOG_LINK_GROUPS`, `BLOG_FILES`, `BLOG_DYNAMIC_CONTENT`,
`BLOG_FEATURES`, `BLOG_SETTINGS`, `BLOG_INIT_ITEMS`, `BLOG_LIST_OF_VALUES`,
`BLOG_SUBSCRIBERS_EMAIL`, `BLOG_COMMENTS_CTX`/`BLOG_POSTS_CTX` (Oracle Text).
Views follow `BLOG_V_*` naming; `BLOG_V_VERSION` feeds the public metadata
`G_APP_VERSION` rendered from `VERSION.txt`.

## Release pipeline (immutable candidate model)

Git source → (reviewed sync with DEV, DEV ids 402/401) → `make build` assembles
Supporting Objects from Git, sets DEV versions from VERSION.txt, exports both
apps to temp space, diffs against Git, runs full offline gate, publishes and
verifies a checksummed candidate under `build/releases/<version>/`, then runs
real TEST acceptance (upgrade from strictly-older published release, fresh
install, verified deinstall leaving **zero** user objects). The same verified
candidate is then promoted to QA/UAT (ids 102/101) and PROD (102/101) with
approval. Candidate locking: exclusive `flock` per version in
`build/releases/.locks/` (persistent — never delete); rollback restores
backups; overwrite only with `OVERWRITE=YES` for unpromoted local candidates.
No STAGING environment exists. Emergency hotfix path (QA export → PROD import,
Supporting Objects installed by default) deliberately bypasses normal gates.
