# APEX Blog automation guide

This is the **canonical guide** for local tooling, CI, schema assembly, and
routine development automation. Run commands from the repository root. For
application installation and general project information, see the
[project README](../README.md). Coding agents must also follow
[AGENT.md](../AGENT.md).

**Separate, safety-critical procedures:**

- [Release candidates and promotion](RELEASE_CANDIDATES.md) — immutable builds,
  TEST/QA/production, and release verification.
- [Emergency QA/UAT-to-production hotfixes](HOTFIX.md) — application-only
  promotion that deliberately bypasses the normal release pipeline.

## Quick start

```bash
make doctor          # Read-only local prerequisite check; no Oracle connection
make setup           # Local lint/test tools and Git hook; no database changes
make check           # Lint, full mocked regression suite, APEXLang validation
make check-schema    # Validate repository schema, metadata and deinstall SQL
make supporting      # Generate Supporting Objects from Git; no Oracle connection
```

`make supporting` **updates tracked files** under `applications/`; inspect the
Git diff after it runs. `make check` requires SQLcl for APEXLang validation,
but does not log in to Oracle. Installation, deployment and DEV-modifying
commands have separate safety requirements; see below.

## Local setup and prerequisites

Use the installed `python3`, `node`, and `npm`; the repository does not require
an exact Python or Node.js version or a globally installed `pre-commit`.
Upstream tools must still support the installed runtimes; the bootstrap does
not reject Node.js 25 solely because of its major version.

On Linux, install Python's `venv` module if needed (Ubuntu:
`sudo apt install python3-venv`), Git, curl, unzip, ShellCheck, Terraform, and
Oracle SQLcl with a supported Java runtime for APEXLang checks. Supporting
Objects assembly additionally uses Python and `rsync`. `make doctor` checks
local requirements without changing anything, reading connection secrets, or
trying to connect to a database; it exits nonzero if required setup is missing.
It **does not prove** that a saved DEV connection or schema is usable.

`make setup` calls `make setup-ci` to install local tools and the Git hook.
Neither command installs or compiles Oracle database objects. The bootstrap:

- Creates an ignored `.venv/` and installs Python tools from
  `automation/ci/requirements.txt`.
- Installs npm development dependencies using the available Node.js runtime.
  Locally, npm updates `package-lock.json` when needed; **commit the lockfile
  with `package.json` changes**. CI uses `npm ci` when the lockfile exists,
  falling back to `npm install` until it is committed.
- Installs checksum-verified **actionlint 1.7.12** under `.venv/bin/` for Linux
  and macOS (x86_64/arm64), without Go or Docker. Updating it requires
  changing the version and release digests in
  `automation/ci/install_actionlint.sh`.
- Installs the pre-commit Git hook. The first pre-commit run may download
  additional hook environments.

The npm package has no fixed Node.js engine upper bound and uses compatible
dev-dependency ranges; Python tooling also uses minimum-version constraints.
These are **not** guarantees that every future runtime works. The bootstrap
disables automatic npm audit to speed setup, not as a security assessment.
Review advisories with `npm audit` or `npm run audit:tools`; do not run
`npm audit fix --force` without checking for breaking upgrades.

## Command reference and safety

### Diagnostics and local quality

| Command | Purpose |
| --- | --- |
| `make help` | List the supported entry points. |
| `make doctor` | Read-only local tool and Git-hook checks; no database login. |
| `make setup` | Install local tooling and Git hook; no DEV database change. |
| `make setup-ci` | Underlying local bootstrap, equivalent setup for CI tools. |
| `make lint` | Run all configured pre-commit linters on tracked files. |
| `make test-fast` | Run quick regression tests explicitly; not a pre-commit hook. |
| `make test` | Run the complete mocked automation test suite. |
| `make validate` | Validate APEXLang with SQLcl; no database login. |
| `make check` | Run mandatory `preflight`: lint, schema/source, full tests, APEXLang validation. |
| `make check-source` | WIP-safe local source/reference checks. |
| `make check-schema` | Validate schema manifests, metadata and deinstall SQL offline. |
| `make check-release` | Strict source-version and Supporting Objects checks. |
| `make verify-release` | Verify a previously built candidate's manifest/checksums. |
| `make release-check` | Run `check-release`, then `verify-release`; read-only. |

`make release-check` requires a built candidate (`RELEASE_DIR=...` selects one).
It does not build, deploy, or compare that candidate's fingerprint against
current working source; the QA promotion gate performs that additional check.
Use `make verify-release` alone when verifying an older candidate.

### Source generation and database operations

| Command | Effect and safety boundary |
| --- | --- |
| `make supporting` | Offline, but **modifies tracked** Supporting Objects files. |
| `make source` | Exports APEXLang from DEV; **may overwrite local** `.apx` changes. |
| `make build` | Reads DEV to build a versioned SQL release; does not refresh tracked APEXLang. |
| `make build OVERWRITE=YES` | Replaces only an eligible unpromoted local candidate. |
| `make prepare-release CONFIRM=YES` | **Modifies DEV** application versions; requires approval. |
| `make sync-dev` | **Overwrites DEV** application definitions; requires approval. |
| `make test-install` | **Resets the disposable TEST schema** and tests installation. |
| `make test-upgrade` | **Resets disposable TEST** and tests an older release upgrade. |
| `make test-deinstall` | Runs `test-install` first, then removes both TEST apps and all user objects. |
| `make qa` | Deploys the selected candidate to QA after mandatory preflight. |
| `make production CONFIRM=YES` | Promotes the candidate to production; requires approval. |
| `make hotfix-export` / `make hotfix-production` | Emergency QA/UAT-to-PROD path; installs Supporting Objects by default. Use `INSTALL_SUPPORTING_OBJECTS=NO` to skip their automatic installation. See [HOTFIX.md](HOTFIX.md). |

Database targets must only be run against verified saved SQLcl connections and
approved environments. TEST reset/deinstall targets are **destructive** and
must never target DEV, QA or production. A successful `make test-deinstall`
leaves TEST with zero rows in `USER_OBJECTS` and neither APEX app installed;
rerun `make test-install` if you need TEST populated again. `RELEASE_DIR=...`
selects an existing release candidate for the install/test/promotion commands.

## Quality gates and lint scope

Pre-commit hooks run **static lint and formatting checks only**; they do not
run Python regression tests. Use `make test-fast` explicitly while developing.
GitHub Actions, `make check` and `make ci` run the complete
`automation/ci/preflight.sh` gate, in order: lint, offline `check-schema`,
WIP-safe `check-source`, the full regression suite **once**, and SQLcl APEXLang
validation. This avoids running the fast tests both in pre-commit and again as
part of the full suite. Normal `make sync-dev` and `make qa` enforce this gate
**inside their scripts**, so direct invocations cannot bypass it; failures
stop before a database connection. The emergency hotfix path intentionally
does not run the normal gate.

- ESLint and `node --check`: hand-maintained JavaScript (excluding `.min.js`).
- Stylelint: LESS and nonminified CSS; generated CSS is not rewritten.
- Markdownlint: repository Markdown.
- Prettier: workflow YAML and `package.json`, not bulk source reformatting.
- actionlint: GitHub Actions syntax, expressions and embedded shell.
- ShellCheck and `bash -n`: shell scripts; Ruff: Python errors.
- SQL hygiene for `.sql`, `.pks` and `.pkb`, with conservative SQLFluff Oracle
  checks on views.
- Manifest checks: all repository schema files accounted for, package specs
  and bodies paired; tracked deinstall matches objects, foreign keys and
  Oracle Text preferences.
- Terraform `fmt` locally; `init -backend=false` and `validate` in CI.
- Pre-commit checks for merge conflicts, oversized files, JSON/YAML syntax
  and accidentally committed private keys.

### Automation regression test layout

The tests in `automation/tests/` have separate purposes:

- `test_source_workflows.py` runs real source/sync and Supporting Objects
  scripts against a private fixture.
- `test_release_workflows.py` checks real build, candidate publication,
  checksums and rollback behavior.
- `test_deploy_workflows.py` checks QA and production safety boundaries using
  verified, locally created release candidates; it does not re-export DEV.
- `test_test_database_workflows.py` checks TEST installation, upgrade and
  deinstallation **orchestration**, not database-side PL/SQL execution.
- `test_previous_release_archive.py`, the schema/metadata modules, and the
  CI modules cover focused parsers, source consistency and gate policies.

Workflow tests run actual Bash scripts and Make targets in isolated temporary
repositories with a deterministic stand-in for SQLcl. The SQLcl stand-in
records commands and simulates database responses; it **cannot** prove that
SQL, APEX or PL/SQL executes correctly on Oracle. The shared fixture lives in
`automation/tests/workflow_fixture.py`, has bounded subprocess runtimes, and
uses locally generated checksum-valid candidates for deployment and TEST
orchestration checks rather than requiring unnecessary DEV exports.

Run a specific group while changing that workflow, for example:

```bash
python3 -m unittest discover -s automation/tests -p 'test_release_workflows.py' -v
```

`make test` runs every offline group, and `make check` adds lint, source checks
and APEXLang validation. **Release acceptance still requires** `make
test-install`, `make test-upgrade` and `make test-deinstall` against an approved,
disposable TEST schema; those commands reset/remove real database objects and
must never be run as ordinary unit tests or with production credentials.

## GitHub Actions and branch protection

GitHub Actions runs `make ci` on pushes and pull requests, using the same
local quality gate. The `quality` job uses current stable Python 3 and Node
LTS versions, a compatible Terraform release, and Oracle's SQLcl download.
SQLcl requires a supported Java runtime. `setup-node`/`setup-python` cache
package downloads from committed dependency files, **not** complete
`node_modules` directories or Python virtual environments.

Superseded push/PR checks for the same branch are cancelled. On failure, the
workflow uploads available quality and Terraform logs to the short-lived
`quality-failure-logs` artifact. The workflow has `contents: read` permission
and no deployment secrets.

The use of moving runtimes/tools trades some reproducibility for less
version maintenance. The npm lockfile reduces drift; pin affected tools only
if an upstream change warrants it.

GitHub Actions YAML cannot enable repository branch protection. After the
first successful run, a repository admin must open **Settings → Rules →
Rulesets** (or **Branches** in older interfaces), protect the default branch,
and require the `quality` status check before merging. Select the status check
actually reported by GitHub. Configure ruleset actor enforcement if direct
pushes must also be restricted.

## Repository-owned schema and Supporting Objects

Schema source lives in `Database/`, with package specs and bodies as `.pks`
and `.pkb`. `automation/schema/install.list` and `upgrade.list` define the
explicit installation/upgrade order. The install inventory covers all active
schema source except `Database/Views/BLOG_V_VERSION.sql`, which the Public
application installs separately. Upgrade inputs are narrower than install
inputs; do not automatically add new DDL to upgrades without reviewing
migration behavior.

Foreign keys and foreign-key indexes come from
`Database/Tables/foreign_keys.sql` and
`Database/Indexes/foreign_key_indexes.sql`. Admin and Public metadata SQL in
`applications/*/supporting-objects/install-scripts/metadata.sql` are
**authoritative in Git**: preserve the dynamic application-ID expressions.
`make supporting` renders only Public metadata's `G_APP_VERSION` from
`VERSION.txt`, assembles the schema and upgrade SQL, and stages output before
updating the tracked Supporting Objects files. It never contacts DEV, exports
metadata from a database, or overwrites the tracked deinstall script.

The authoritative uninstall script is
`applications/blog-admin/supporting-objects/deinstall-script.sql`. Update it
when schema objects, foreign keys or Oracle Text preferences change. Run
`make check-schema` to verify manifest inventory, metadata consistency and
uninstall coverage before `make supporting`; review the generated Git diff and
run TEST install/upgrade/deinstall checks before releasing.

## Normal DEV and release workflow

Use `make source` explicitly to refresh tracked APEXLang from DEV, after
reviewing possible overwrites. `make sync-dev` imports the tracked APEXLang
into DEV and requires approval; `make prepare-release CONFIRM=YES` sets DEV
versions from `VERSION.txt`. `make build` checks local/DEV source parity and
produces a **versioned, protected release candidate** with checksums and a
manifest; it does not overwrite tracked application source. Existing release
candidates cannot be replaced by default.

The normal release procedure, safe local candidate replacement, selection via
`RELEASE_DIR=...`, TEST/QA/production promotion, and release publishing are
specified in [RELEASE_CANDIDATES.md](RELEASE_CANDIDATES.md). Always promote the
same verified candidate; do not rebuild between TEST, QA and production.

## Troubleshooting and maintenance

- **`make doctor` fails before initial setup:** run `make setup` after
  installing its missing prerequisites. It deliberately reports missing hooks
  and the ignored `.venv/` on a new checkout.
- **`python3 -m venv` fails:** install the system Python `venv` package (for
  example `python3-venv` on Ubuntu).
- **SQLcl is missing or uses a different executable name:** install SQLcl
  for `make validate`/`make check`, or set `SQLCL_BIN` to its executable.
  Check that the Java runtime supports the installed SQLcl version. Neither
  `make doctor` nor `make validate` verifies a saved database connection.
- **Dependency update breaks CI:** review the error, refresh and commit
  `package-lock.json` with npm manifest changes, or adjust the affected
  dependency deliberately. Do not globally disable the failing check.
- **Schema or metadata drift:** update Git-owned manifests/SQL, run
  `make check-schema`, then `make supporting` and review the resulting diff.
  `make supporting` does not repair a missing deinstall DROP statement.
- **Legacy build-helper objects in DEV:** removing `BUILD_API`,
  `BUILD_SETTINGS` and `BUILD_MIME_TYPES` from repository automation does
  **not** drop previously installed DEV objects. Check dependencies and obtain
  separate approval for any database cleanup. Neither `make setup` nor
  `make supporting` performs such cleanup.

For routine automation, use this guide rather than copying operational
instructions into other README files. For deployments and emergency actions,
follow the separate [release](RELEASE_CANDIDATES.md) and
[hotfix](HOTFIX.md) procedures.
