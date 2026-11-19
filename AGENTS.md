# APEX Blog: coding-agent instructions

Develop the Oracle APEX **26.1** application, database objects, and frontend assets.

## Responsibilities

Use the development environment and tools prepared by the developer.

During application development, leave environment setup and repair to the
developer and report unavailable tools or connection failures. Change automation
only when explicitly assigned that work.

## Application source

- `applications/blog/` (Public) and `applications/blog-admin/` (Admin) contain
  APEXLang (`.apx`) application source.
- Tracked files in `Database/` are the source of truth for schema and PL/SQL
  objects. Make object changes in these files, then apply the SQL and compile
  PL/SQL in DEV under the task's authorization. Update `Database/install.list`
  and `Database/upgrade.list` when the included files or their dependency order
  change.
- When a task changes database structures or installation data, update the
  source definitions used for new installations and any migration required by
  existing installations. Put authored migration SQL under
  `applications/blog/supporting-objects/upgrade-scripts/` and add or update its
  entry in `applications/blog/supporting-objects/upgrade-scripts.apx`, including
  execution order and any applicable version condition. Preserve existing
  application data and user-configured values unless the requested change
  requires otherwise.
- After relevant database or release-version changes, run `make supporting`.
  It assembles `Database/` source using the manifests into generated database
  installation SQL under `applications/blog-admin/supporting-objects/` and
  upgrade SQL under `applications/blog/supporting-objects/`, and refreshes
  version-dependent SQL from `VERSION.txt`. Review the diff.
  These directories also contain manually authored installation metadata;
  edit that metadata when application installation data changes.
- `applications/blog-admin/supporting-objects/deinstall-script.sql` is manually
  maintained. Update it when object changes affect deinstallation.
- Edit application LESS in `frontend/less/` and JavaScript in `frontend/js/`.
  Run `assets` to regenerate their files under each application's
  `shared-components/static-files/`; use `check-assets` to verify the outputs.
  Independently authored plugin assets have their own source. When adding or
  renaming static files, update the corresponding `shared-components/static-files.apx`.
- `VERSION.txt` defines the release version. Change it when the task calls for
  a version change.
- Generated release artifacts under `build/` are not committed.

## Working procedure

1. Inspect task-relevant source and `git status --short`. Preserve unrelated work.
2. Make focused source changes and regenerate affected outputs.
3. Prefer MCP for supported project operations; use documented commands for
   other operations. Consult current tool descriptions and `make help` when
   their inputs or effects are unclear.
4. Run relevant existing application checks and review the diff. Report success
   only from a completed successful result; distinguish offline validation from
   real database compilation and application runtime testing.
5. Report changed files, completed checks, and remaining blockers. Keep
   credentials out of commits and reports.

A DEV source export can overwrite local `.apx` edits. Obtain explicit permission
before overwriting uncommitted work. Choose the intended direction when
reconciling source: `source` reads DEV into local files; `sync-dev` writes local
application definitions to DEV.

## Database authorization

Run ad hoc SQL queries only when requested by the developer.

Trust developer-configured named connections and automation parameters as
authoritative. Select the configured connection for the intended environment;
do not independently verify its endpoint, schema mapping, or workspace mapping.
Report a failed connection rather than repairing it or substituting another.

- **TEST (`blog_tst`) is disposable.** Application testing, including
  installation, upgrade, deinstallation, and resets, is preauthorized through
  SQLcl, SQLcl MCP, and project automation. No additional approval is needed.
- **DEV, UAT, and PROD are persistent.** Database-changing operations require
  explicit authorization for the task. This includes `prepare-release`,
  `sync-dev`, `build`, `qa`, `production`, and `hotfix-production`, as well as
  direct SQLcl or MCP changes. Reuse authorization already granted for the task.
- Avoid overlapping writes to the same source or database. Check the outcome of
  interrupted database-changing operations before retrying or switching tools.
- Use the existing workflows for release and deployment tasks. An emergency
  hotfix requires an explicit request. Preserve the reviewed release artifact;
  failed checks do not authorize promotion.
