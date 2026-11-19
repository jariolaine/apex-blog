# APEX Blog: coding-agent instructions

Scope: this repository. Target Oracle APEX **26.1**. Do not invent APEXLang
syntax, SQLcl flags, paths, or Make targets.

## Agent responsibilities

Focus on **APEX Blog application development and maintenance**:

- Oracle APEX applications using APEXLang.
- Oracle Database schema DDL and PL/SQL, including `Database/install.list` and
  `Database/upgrade.list` when schema execution order changes.
- JavaScript, LESS, and CSS.
- Application debugging, refactoring, validation, and tests for APEX, PL/SQL,
  and frontend behavior. Application tests belong in `tests/`.

Use existing project tooling to validate application changes. `automation/`
contains supporting tooling and infrastructure tests; do not modify its
implementation or tests unless explicitly requested.

## Start and finish

1. Inspect task-relevant source and the Make targets needed for the task. Check
   `git status --short` before editing; preserve unrelated work.
2. State a short plan, make the smallest necessary change, and run relevant **non-destructive**
   checks.
3. Report changed files, checks and results, database actions not run, and remaining risks or
   approvals. Never treat mocked tests as proof of a real Oracle compile, import, or deployment.
4. Treat development tools, saved database connections, and MCP availability as
   **human-configured**. Report missing prerequisites; do not install or reconfigure
   them unless explicitly requested.

## Source ownership and repository map

- `applications/blog/` and `applications/blog-admin/` contain tracked **APEXLang** (`.apx`)
  application source files.
- `Database/` contains all database schema DDL files. `install.list` and
  `upgrade.list` define their execution order.
- `applications/*/supporting-objects/` contains Git-owned metadata and generated install/upgrade
  SQL. Admin `supporting-objects/deinstall-script.sql` is **manually maintained**. Do not
  regenerate metadata or deinstall SQL from DEV; retain dynamic application-ID expressions and
  update deinstall with schema changes.
- `applications/*/shared-components/static-files/` contains owned CSS, JS, and binary assets.
  When adding/renaming files, update the corresponding `shared-components/static-files.apx`
  metadata. Edit application LESS in `frontend/less/` and JavaScript in `frontend/js/`.
  `make assets` generates CSS and JavaScript under each application's `static-files/`;
  do not edit generated files directly. `make check-assets` verifies them.
  Independently developed plugin assets are excluded from this process.
- `VERSION.txt` defines the release version, including its final `YYYYMMDD` suffix; historical
  upgrade SQL retains its original version dates.
- `automation/variables.sh` defines defaults; ignored `automation/variables.local.sh` and
  environment overrides may change the effective values. Never print or commit secrets.
- `build/releases/<version>/` contains versioned, checksummed release candidates;
  `build/hotfix/` is separate. Do not commit generated artifacts or delete candidate lock files.

## Validation and automation

Prefer MCP for supported project operations. Follow
[`.clinerules/project-workflow.md`](.clinerules/project-workflow.md) for tool
selection, invocation, and job results. For unsupported operations or options,
use available documented project commands; otherwise report the blocker.

Apply the authorization rules below regardless of execution method. Never silently
switch execution methods for database-changing operations, overlap operations
against the same source or database, or automatically retry interrupted database
jobs without inspecting actual state.

## Commands and authorization

**Non-destructive checks:** `make test` runs application
tests only. `check-source` supports changes in progress; `check-release` verifies
release consistency. `validate` requires SQLcl but does not connect to a
database. `check` runs the full offline quality gate, including APEXLang
validation and the `preflight` gate used by DEV/QA scripts. Discover other
checks through the MCP tool interface or `make help`.

**Git-only generation:** `make supporting` assembles tracked Supporting Objects from Git and
renders the version. It does not regenerate the Admin deinstall script. Review the resulting
diff.

**Read DEV, write local source:** `make source` exports APEXLang into `applications/` and can
overwrite uncommitted `.apx` changes. Review the working tree first; obtain explicit
permission before overwriting uncommitted `.apx` work.
Supporting Objects SQL and static-file bytes are preserved, but this does **not** establish
DEV/Git parity. `make source` (DEV → Git) and `make sync-dev` (Git → DEV) must never be chained
blindly. Direct `automation/export_application.sh` calls require an explicit `--source-only` or
`--build-only` mode.

**Disposable TEST is preauthorized:** `make pretest` (all stages or
`TEST=install|upgrade|deinstall`) and `make test-release` may reset and
recreate only the dedicated `BLOG_TST` schema and its test applications without
asking for approval. Verify the saved TEST connection and workspace; never infer
that DEV, QA or PROD is disposable. `pretest` reads DEV SQL, installs it on TEST
and deletes temporary exports; it does not create or approve a release candidate.
For APEX runtime upgrades it can test the same application release version.

**Obtain explicit human authorization before these operations**
(including equivalent direct scripts or MCP jobs):

- `make prepare-release` — changes DEV application versions.
- `make sync-dev` — replaces both application definitions in DEV.
- `make build` — assembles Supporting Objects, updates DEV versions, compares DEV exports with
  Git, runs the full gate, publishes a candidate, and runs real TEST acceptance.
  Upgrade tests always use the latest stable published GitHub release tagged on
  `master`, never a local previous ZIP. Never run without DEV authorization. Do not recreate this
  workflow by chaining separate MCP jobs. The full development command flow
  is documented in [`automation/docs/DEVELOPMENT_FLOW.md`](automation/docs/DEVELOPMENT_FLOW.md).
- `make qa`, `make production`, `make hotfix-production` — deploy application definitions; the
  emergency hotfix has different safeguards (below).

Before any database operation, verify the effective saved SQLcl connection, schema,
workspace, and intended target. Never run destructive SQL merely because it is listed in a
runbook. The existing scripts enforce their own environment checks. `make sync-dev` and
`make qa` also enforce mandatory preflight **inside the scripts**, without a bypass flag; do not
weaken or skip it.

## APEXLang, source consistency, and release integrity

- Keep APEXLang as the tracked application format; never replace it with SQLcl `-split` exports.
  If available, use Oracle's
  [APEXLang skill](https://github.com/oracle/skills/blob/main/apex/apexlang/SKILL.md) and
  [APEX 26.1 guidance](https://github.com/oracle/skills/blob/main/apex/apexlang/26.1/SKILL.md)
  for syntax, but use repository automation for validation and deployment.
- Installable artifacts are **full SQL exports with Supporting Objects**, not APEXLang files
  alone. Install Admin before Public. Keep `Database/`, manifests, Supporting Objects SQL, and
  the manually maintained deinstall script in sync. Check every `.pks` has a matching `.pkb`.
- Keep application and Supporting Objects versions consistent with `VERSION.txt`.
  Never falsify drift checks or suppress test failures.
- `make build` must stop when DEV Supporting Objects or static-file metadata differs from Git,
  rather than silently running `source`/`sync-dev`. It runs `make check` after export and before
  candidate publication.
- A failed TEST gate does not approve the candidate. Rerun authorized `make test-release` after
  fixing it. `make build OVERWRITE=YES` may replace **only** an eligible unpromoted local
  candidate; never overwrite a QA-approved or published version.
- For a normal release, use the **same unchanged versioned candidate** for TEST, QA, PROD, and
  GitHub. Select it with `RELEASE_DIR=...`; never rebuild between environments. Preserve
  candidate locks and rollback behavior.

## Emergency QA/UAT → PROD hotfix

Only follow this path when explicitly requested; it intentionally bypasses the normal DEV/TEST
pipeline and release gates.

- `make hotfix-export` reads both QA/UAT applications into `build/hotfix/f<ID>.sql` (overwrites
  an older hotfix candidate).
- After explicit authorization, `make hotfix-production` imports the saved Admin and then Public
  exports to the verified PROD target. By default it **installs Supporting Objects**, which can
  change schema/data. `OBJECTS=NO` disables their automatic installation.
- Do not commit hotfix artifacts; propagate fixes back into regular source control separately.
