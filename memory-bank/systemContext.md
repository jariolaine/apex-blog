# System Context

## Top-level repository map

| Path | Ownership / purpose |
| --- | --- |
| `applications/blog/` | Public Pages app APEXLang source + Supporting Objects + static files |
| `applications/blog-admin/` | Admin APEXLang, Supporting Objects, manual deinstall SQL |
| `Database/` | Schema DDL and `install.list` / `upgrade.list` execution order |
| `automation/` | All release/CI automation scripts, docs, offline tests (see below) |
| `build/releases/<version>/` | Generated candidate: manifest, checksums, SQL, ZIPs |
| `build/hotfix/` | Generated emergency QA/UAT → PROD exports and logs |
| `frontend/less/` | LESS sources for generated app CSS files |
| `ideas/` | Non-shipping scratch notes, draft SQL/LESS |
| `Stack/` | Legacy OCI Resource Manager Terraform stack |
| `VERSION.txt` | Release version authority (`Release x.y.z.YYYYMMDD`) |

## Application details

- Both apps: Universal Theme, global page 0, nav lists, session-state
  protection, minified static assets via `#APP_FILES#`.
- `blog` static files: `js/blog.js(.min.js)`, `css/style(.min).css`,
  `rss(.min).css`, icons. Plugins: item `mathQuestionField`, template
  component `footerLinkCustom-theme-universal-theme`.
- `blog-admin` static files: `js/admin.js(.min.js)`, `css/admin(.min).css`.
  Plugins: DA `copyToClipboard`, DA `speechRecognition`, template components
  `buttonCustom-...`, `footerLinkCustom-...`, `iconCustom-...`. Gen-AI service
  `@BLOG_OPEN_AI_API` backed by web credential `@BLOG_OPEN_AI_API_KEY`;
  authorization scheme `@bloggers` (workspace group).
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

For the completed read-only orphan audit, its method and 2026-11 findings, see
[`reference/text-message-audit-2026-11.md`](reference/text-message-audit-2026-11.md).

## Release pipeline (immutable candidate model)

The normal flow is Git source → reviewed DEV synchronization (Admin/Public
IDs 402/401) → `make build` (assemble Supporting Objects, set DEV versions,
export and compare APEXLang with Git, run offline checks, publish a
checksummed candidate) → disposable-TEST upgrade/install/deinstall acceptance
→ promotion of the **same candidate** to QA/UAT and PROD (Admin/Public IDs
102/101). Candidate publication uses per-version `flock` locks in
`build/releases/.locks/` and rollback backups.

There is no STAGING environment. The emergency QA/UAT → PROD hotfix path is
separate from the normal candidate flow.
