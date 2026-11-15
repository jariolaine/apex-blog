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
| `BLOG_AI` | Language AI: OCI sentiment/detect-language/translate|
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

## Application text messages: resolution model

Messages are **per-app**: `textMessage <NAME>` blocks in
`applications/<app>/shared-components/messages.apx`; `apex_lang.get_message` /
`apex.lang.getMessage` resolve a name only inside the *current* app, so a name
referenced only by the other app is orphaned here. A message is live if it is
either referenced **literally** (owning app's `.apx`/static JS or shared
`Database/` code) or resolved **dynamically** through exactly these mechanisms:

1. **Constraint lookup** - `BLOG_UTIL.parse_error` extracts the ORA constraint
   name and calls `apex_lang.get_message` with it; a message named after any
   constraint in `Database/Tables/*.sql` (lowercase DDL, uppercase at runtime)
   is live.
2. **Settings** - `blog_settings` virtual columns
   `attribute_message = 'BLOG_SETTING_'||attribute_name` and
   `help_message = 'BLOG_HELP_'||attribute_name`, plus plain
   `attribute_group_message`; resolved in `blog_v_settings` (admin p20012) and
   the p20100 help dialog.
3. **Features** - `blog_v_features` resolves `build_option_name` (label),
   `build_option_group` (group header) and the per-feature help name via
   `regexp_replace(name, '^(BLOG)', '\1_HELP')`; consumed by admin p20011
   (`whereClause: application_id = :G_PUB_APP_ID`) and the p20100 union.
   Features seeded with group `INTERNAL` are filtered out of the view, so their
   label/help messages are dead.
4. **LOVs** - `blog_v_lov` resolves each row's `display_message`; consumed by
   admin `lovs.apx`.

The seed data that makes dynamic names live lives in
`applications/blog/supporting-objects/install-scripts/metadata.sql`
(`blog_install.settings_merge` / `features_merge` / `list_of_values_ins`).

## Orphan-message audit procedure (read-only)

1. Extract every `^textMessage <NAME>` from each app's `messages.apx`.
2. Literal check: case-insensitive fixed-string grep for the name in the
   **owning** app directory (excluding `messages.apx` itself) and shared
   `Database/`; hits in the other app alone do not count.
3. Dynamic checks - live if the name is a constraint defined in
   `Database/Tables/*.sql`, or `BLOG_SETTING_<attr>` / `BLOG_HELP_<attr>` where
   `<attr>` is seeded via `settings_merge`, or a non-INTERNAL seeded feature
   (`features_merge`) label, its help name (`BLOG_HELP_<suffix>`), or a seeded
   group name, or a LOV `display_message` seeded via `list_of_values_ins`.
4. Ignore `build/` (generated copies); anything left is orphaned.

Result 2026-11-14: 7 orphans - public `BLOG_ERR_MSG_COMMENT_REQUEST`; admin
`BLOG_AI_GENERATE_MESSAGE`, `BLOG_AI_GENERATE_PROMPT`,
`BLOG_MSG_AI_NO_POST_FOR_CONTEXT`, `BLOG_MSG_SELECTED_FILES_DELETED`,
`BLOG_TXT_DOWNLOAD` (stale `usedInJavaScript: true`) and `BLOG_MSG_NO_DATA_FOUND`
(live only in the public app; the admin duplicate is the orphan). All 7 removed on
2026-11-15: edited both `messages.apx` files in Git, then `make sync-dev`; the
follow-up `make source` round trip produced **no diff**, so DEV matches Git. The
public `BLOG_MSG_NO_DATA_FOUND` stays (live in public pages).

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
