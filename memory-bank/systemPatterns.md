# System Patterns

## Post visibility

The [Admin posts page](../applications/blog-admin/pages/p00011-posts.apx) uses
[`BLOG_V_ALL_POSTS`](../Database/Views/BLOG_V_ALL_POSTS.sql), which exposes
states such as draft, scheduled, and disabled blogger or category. The
[Public home page](../applications/blog/pages/p00001-home.apx) uses
[`BLOG_V_POSTS`](../Database/Views/BLOG_V_POSTS.sql), which requires active
post, blogger, and category rows and a publication time that has arrived.
These views serve different visibility requirements.

`BLOG_V_POSTS` also obtains URLs from
[`BLOG_URL`](../Database/Packages/BLOG_URL.pks) and tag markup from
[`BLOG_V_POST_TAGS`](../Database/Views/BLOG_V_POST_TAGS.sql). A change to public
post output can therefore involve the view and its helpers as well as the
APEX region template.

## Session values and application settings

The [Public application processes](../applications/blog/shared-components/app-processes.apx)
and [Admin application processes](../applications/blog-admin/shared-components/app-processes.apx)
call `BLOG_UTIL.initialize_items` when a session starts; Admin also calls it
after authentication. The implementation in
[`BLOG_UTIL`](../Database/Packages/BLOG_UTIL.pkb) reads
[`BLOG_V_INIT_ITEMS`](../Database/Views/BLOG_V_INIT_ITEMS.sql), which joins
`BLOG_INIT_ITEMS` to `BLOG_SETTINGS` by item/attribute name.

The [Admin Settings page](../applications/blog-admin/pages/p20012-settings.apx)
uses [`BLOG_V_SETTINGS`](../Database/Views/BLOG_V_SETTINGS.sql). The
[Features page](../applications/blog-admin/pages/p20011-features.apx) uses
[`BLOG_V_FEATURES`](../Database/Views/BLOG_V_FEATURES.sql) with
`application_id = :G_PUB_APP_ID`. Both views combine stored configuration
with APEX build-option state. The
[setting-help page](../applications/blog-admin/pages/p20100-setting-help.apx)
uses their help-message names. The settings, feature, and LOV seed values are
in the application's
[metadata SQL](../applications/blog/supporting-objects/install-scripts/metadata.sql).

## Frontend integration

The [Public application definition](../applications/blog/application.apx) and
[Admin application definition](../applications/blog-admin/application.apx)
declare their JavaScript and CSS resources. Page actions call the `blog.ui`
helpers in [blog.js](../frontend/js/blog.js) and the `blog.admin` helpers in
[admin.js](../frontend/js/admin.js). Those function names and options connect
the JavaScript implementation to declarative actions in the `.apx` pages.

Comment analysis and post-generation call paths are described in
[the BLOG_AI context](reference/blog-ai-remediation-2026-11.md).

## Application text messages

Definitions are separate in the
[Public messages](../applications/blog/shared-components/messages.apx) and
[Admin messages](../applications/blog-admin/shared-components/messages.apx).
Usage depends on the consuming application and its shared code. A reference
in the other application alone does not establish use of this application's
definition. APEX substitutions such as `&{BLOG_MSG_NO_DATA_FOUND}.` are also
consumers.

Some names are supplied at runtime. Examples in this application include:

| Name source | Consumer |
| --- | --- |
| Extracted database constraint name | `BLOG_UTIL.apex_error_handler` in [BLOG_UTIL](../Database/Packages/BLOG_UTIL.pkb) |
| `BLOG_SETTING_<attribute>`, `BLOG_HELP_<attribute>`, and the stored group-message name | [BLOG_SETTINGS](../Database/Tables/BLOG_SETTINGS.sql), [BLOG_V_SETTINGS](../Database/Views/BLOG_V_SETTINGS.sql), and the setting-help page |
| Build-option name, group name, and help name formed by replacing the leading `BLOG` with `BLOG_HELP` | [BLOG_V_FEATURES](../Database/Views/BLOG_V_FEATURES.sql) and the setting-help page |
| Stored `display_message` | [BLOG_V_LOV](../Database/Views/BLOG_V_LOV.sql) |
| Plugin attributes and package arguments | [BLOG_PLUGIN](../Database/Packages/BLOG_PLUGIN.pkb) math-question callbacks, [BLOG_ADMIN](../Database/Packages/BLOG_ADMIN.pkb) `is_integer`, and [BLOG_HTML](../Database/Packages/BLOG_HTML.pkb) `get_button` |
| JavaScript options and Ajax response values | [admin.js](../frontend/js/admin.js) `get_message`, including `options.titleMsg` and `data.errMsg` |

A literal-name search can miss these consumers; the argument values and
calling code determine whether a definition is used. `BLOG_V_FEATURES` filters
out `INTERNAL` rows from that view, which alone does not establish that their
messages have no other consumers.

The [November message cleanup](reference/text-message-audit-2026-11.md)
records the removed definitions and the Public message deliberately retained.

## Packaged database lifecycle

The applications share a schema. Admin's
[installation scripts](../applications/blog-admin/supporting-objects/install-scripts.apx)
create the main database objects, and its
[deinstall script](../applications/blog-admin/supporting-objects/deinstall-script.sql)
removes them. Public's
[upgrade definitions](../applications/blog/supporting-objects/upgrade-scripts.apx)
carry the shared-schema upgrade SQL and version-dependent patches, with each
script's execution order and optional server-side condition.

Both applications' Supporting Objects definitions
([Admin](../applications/blog-admin/supporting-objects/supporting-objects.apx),
[Public](../applications/blog/supporting-objects/supporting-objects.apx)) use
`upgradeWhenSqlQuery` to check `USER_VIEWS` for `BLOG_V_VERSION`. This is the
existing-installation check. Individual upgrade conditions separately determine
whether a version-dependent script applies.

Those version conditions read `application_date` from
[`BLOG_V_VERSION`](../Database/Views/BLOG_V_VERSION.sql), which converts the
final eight characters of the `G_APP_VERSION` setting in `BLOG_SETTINGS` to a
number. The application version recorded in the schema therefore affects
which conditional upgrade scripts qualify.
