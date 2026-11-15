# APEX Blog: coding-agent instructions

Scope: this repository. Target Oracle APEX **26.1**. Work in small, reviewable steps. Do not
invent APEXLang syntax, SQLcl flags, paths, or Make targets.

## Start and finish

1. Inspect `Makefile` and the task-relevant files. Check `git status --short` before editing;
   preserve unrelated work.
2. State a short plan, make the smallest necessary change, and run relevant **non-destructive**
   checks.
3. Report changed files, checks and results, database actions not run, and remaining risks or
   approvals. Never treat mocked tests as proof of a real Oracle compile, import, or deployment.
4. Treat Docker, SQLcl saved connections, environment variables, and MCP as
   **human-configured**. If a required tool or connection is unavailable, report the blocker; do
   not change the developer's setup unless explicitly asked.

## Source ownership and repository map

- `applications/blog/` and `applications/blog-admin/` contain tracked **APEXLang** (`.apx`)
  applications, not split SQLcl exports.
- `Database/` owns schema SQL, including separate `.pks`/`.pkb` packages;
  `automation/schema/install.list` and `upgrade.list` define object order (all specs before
  bodies).
- `applications/*/supporting-objects/` contains Git-owned metadata and generated install/upgrade
  SQL. Admin `supporting-objects/deinstall-script.sql` is **manually maintained**. Do not
  regenerate metadata or deinstall SQL from DEV; retain dynamic application-ID expressions and
  update deinstall with schema changes.
- `applications/*/shared-components/static-files/` contains owned CSS, JS, and binary assets.
  When adding/renaming files, update the corresponding `shared-components/static-files.apx`
  metadata. Keep `less/` sources and generated CSS/minified assets consistent.
- `VERSION.txt` defines the release version, including its final `YYYYMMDD` suffix; historical
  upgrade SQL retains its original version dates.
- `automation/variables.sh` defines defaults; ignored `automation/variables.local.sh` and
  environment overrides may change the effective values. Never print or commit secrets.
- `build/releases/<version>/` contains versioned, checksummed release candidates;
  `build/hotfix/` is separate. Do not commit generated artifacts or delete candidate lock files.

## Commands and authorization

**Non-destructive checks:** `make doctor`, `make lint`, `make test-fast`, `make test`,
`make check-schema`, `make check-source`, `make check-release`, `make verify-release`,
`make release-check`, `make validate`, and `make check`. `make validate` requires SQLcl but does
not connect to a database; `make check` is the full offline quality gate, including APEXLang
validation.

**Git-only generation:** `make supporting` assembles tracked Supporting Objects from Git and
renders the version. It does not regenerate the Admin deinstall script. Review the resulting
diff. Environment installation (`make setup`, bootstrap, Docker, Git hooks) is handled by the
human unless specifically requested.

**Read DEV, write local source:** `make source` exports APEXLang into `applications/` and can
overwrite uncommitted `.apx` changes. Review the working tree and warn about overwrites first.
Supporting Objects SQL and static-file bytes are preserved, but this does **not** establish
DEV/Git parity. `make source` (DEV → Git) and `make sync-dev` (Git → DEV) must never be chained
blindly. Direct `automation/export_application.sh` calls require an explicit `--source-only` or
`--build-only` mode.

**Obtain explicit human authorization before any of these database-changing operations**
(including equivalent direct scripts or MCP jobs):

- `make prepare-release` — changes DEV application versions.
- `make sync-dev` — replaces both application definitions in DEV.
- `make test-release`, `make test-install`, `make test-upgrade`, `make test-deinstall` — reset
  an **approved disposable TEST** schema. `test-deinstall` installs first, then verifies zero
  remaining user objects.
- `make build` — assembles Supporting Objects, updates DEV versions, compares DEV exports with
  Git, runs the full gate, publishes a candidate, and runs real TEST acceptance.
  `PREVIOUS_ZIP=path` is optional; without it, the upgrade input is GitHub's latest published
  release. Never run without DEV and TEST authorization.
- `make qa`, `make production`, `make hotfix-production` — deploy application definitions; the
  emergency hotfix has different safeguards (below).

Before an authorized database operation, verify the effective saved SQLcl connection, schema,
workspace, and intended target. Never run destructive SQL merely because it is listed in a
runbook. The existing scripts enforce their own environment checks. `make sync-dev` and
`make qa` also enforce mandatory preflight **inside the scripts**, without a bypass flag; do not
weaken or skip it.

For supported long-running Make targets, follow `.clinerules/project-workflow.md` when using
Cline's configured MCP tools. MCP adds **no second approval workflow**; the human authorization
above still applies. Cline/Docker/SQLcl setup is documented for maintainers in
`automation/docs/MCP_AUTOMATION.md`.

## APEXLang, source consistency, and release integrity

- Keep APEXLang as the tracked application format; never replace it with SQLcl `-split` exports.
  If available, use Oracle's
  [APEXLang skill](https://github.com/oracle/skills/blob/main/apex/apexlang/SKILL.md) and
  [APEX 26.1 guidance](https://github.com/oracle/skills/blob/main/apex/apexlang/26.1/SKILL.md)
  for syntax, but use repository automation for validation and deployment.
- Installable artifacts are **full SQL exports with Supporting Objects**, not APEXLang files
  alone. Install Admin before Public. Keep `Database/`, manifests, Supporting Objects SQL, and
  the manually maintained deinstall script in sync. Check every `.pks` has a matching `.pkb`.
- `make check-source` supports work in progress; `make check-release` requires matching
  application and Supporting Objects versions from `VERSION.txt`. Never falsify drift checks or
  suppress test failures.
- `make build` must stop when DEV Supporting Objects or static-file metadata differs from Git,
  rather than silently running `source`/`sync-dev`. It runs `make check` after export and before
  candidate publication.
- A failed TEST gate does not approve the candidate. Rerun authorized `make test-release` after
  fixing it. `make build OVERWRITE=YES` may replace **only** an eligible unpromoted local
  candidate; never overwrite a QA-approved or published version.
- For a normal release, use the **same unchanged versioned candidate** for TEST, QA, PROD, and
  GitHub. Select it with `RELEASE_DIR=...`; never rebuild between environments. Preserve
  candidate locks and rollback behavior; consult `automation/docs/ARCHITECTURE.md` when changing
  publication code.

## Emergency QA/UAT → PROD hotfix

Only follow this path when explicitly requested; it intentionally bypasses the normal DEV/TEST
pipeline and release gates.

- `make hotfix-export` reads both QA/UAT applications into `build/hotfix/f<ID>.sql` (overwrites
  an older hotfix candidate).
- After explicit authorization, `make hotfix-production` imports the saved Admin and then Public
  exports to the verified PROD target. By default it **installs Supporting Objects**, which can
  change schema/data. `OBJECTS=NO` disables their automatic installation.
- Do not commit hotfix artifacts; propagate fixes back into regular source control separately.
  See `automation/docs/RUNBOOK.md` for recovery and deployment details.
