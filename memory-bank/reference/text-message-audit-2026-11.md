# Application text-message audit — November 2026

Historical audit reference, **not** a standing instruction to repeat an audit during unrelated
tasks. The live per-application resolution model is summarized in
[`../systemContext.md`](../systemContext.md); source files are authoritative.

## Read-only orphan detection method

1. Extract each `^textMessage <NAME>` definition from each application's
   `shared-components/messages.apx`.
2. For each name, search the **owning** application's `.apx` and static JS plus shared
   `Database/` source, excluding its own `messages.apx`. A reference only in the other
   application does not make a message live in this one.
3. Account for runtime-resolved names:
   - **Constraints:** `BLOG_UTIL.parse_error` resolves messages named after database constraints
     defined in `Database/Tables/*.sql` (lowercase DDL, uppercase names at runtime).
   - **Settings:** `BLOG_SETTING_<attribute>` and `BLOG_HELP_<attribute>`, plus group messages
     used by `blog_v_settings` and the help dialog; source attributes come from seeded
     `settings_merge` metadata.
   - **Features:** `build_option_name`, `build_option_group`, and `BLOG_HELP_<suffix>`
     (`regexp_replace(name, '^(BLOG)', '\1_HELP')`); seed data comes from `features_merge`.
     `INTERNAL` features are filtered out of the view.
   - **LOVs:** `blog_v_lov.display_message` seeded by `list_of_values_ins`.
4. Read seeded names in `applications/blog/supporting-objects/install-scripts/metadata.sql`.
   Exclude generated copies under `build/`. Names without literal or legitimate dynamic
   references are candidates for deletion; review each before editing.

## Findings and changes

The read-only audit on 2026-11-14 identified seven orphan messages. They were removed on
**2026-11-15**:

- Public `applications/blog/shared-components/messages.apx`: `BLOG_ERR_MSG_COMMENT_REQUEST` (21
  → 20 messages).
- Admin `applications/blog-admin/shared-components/messages.apx`: `BLOG_AI_GENERATE_MESSAGE`,
  `BLOG_AI_GENERATE_PROMPT`, `BLOG_MSG_AI_NO_POST_FOR_CONTEXT`,
  `BLOG_MSG_SELECTED_FILES_DELETED`, `BLOG_TXT_DOWNLOAD` (stale `usedInJavaScript: true`), and
  `BLOG_MSG_NO_DATA_FOUND` (184 → 178 messages).

The **public** application's `BLOG_MSG_NO_DATA_FOUND` is live and was retained; references in
public pages do not make the Admin duplicate live. After removal, the audit found no references
to deleted names in either application or `Database/`.

## Historical verification

- `make supporting` produced no diff; `make lint`, `make check-source`, and `make validate`
  passed.
- The authorized `make sync-dev` ran mandatory preflight (49 offline tests passed and both apps
  validated). A subsequent `make source` produced no diff, establishing DEV/Git agreement
  **at the time**.
- Re-run the read-only audit against **current** source if new message-related work requires it.
  The 2026 results do not establish that current DEV/Git or messages are unchanged.
