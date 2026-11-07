# Automation runbook

Use these procedures from the **repository root**, after checking the actual
[Make targets](../../Makefile). Read [environment safeguards](ENVIRONMENTS.md)
before accessing a database. This runbook consolidates the earlier automation
README, release-candidate guide and emergency hotfix guide.

## Local setup

```bash
make doctor    # Read-only prerequisite report; does not test DB connections
make setup     # Local Python/npm tools and Git hooks; no database changes
make check     # Full local CI gate; no database connection
```

Use `make setup RESET=YES` if local tooling is broken or needs a clean
reinstall. It recreates `.venv/` and `node_modules/` and reinstalls the Git
hook; tracked files such as `package-lock.json`, local configuration and
shared user caches are preserved. This never accesses a database.

`make check` runs lint, schema/source checks, focused **offline release-safety**
tests and SQLcl APEXLang validation. It requires local SQLcl (and its supported Java
runtime), but **does not run** a real TEST install, upgrade or deinstall.
`make test-fast` runs the small schema/metadata/parity selection; `make test`
runs all selected offline safety tests, and `make validate` runs APEXLang
validation only. Generic CI tool behavior is verified by running the real
tools. See [offline safety tests](#offline-safety-tests) for their scope.
Pre-commit runs static lint without the Python tests. If setup fails because
Python cannot create `.venv/`, install the system Python `venv` package (for
example `python3-venv` on Ubuntu). SQLcl needs a compatible Java runtime;
`SQLCL_BIN` can select a nonstandard SQLcl executable.

If necessary, configure named SQLcl connections in your local environment.
Use the ignored `automation/variables.local.sh` to override effective shell
variables or export `APEX_BLOG_*` before invoking Make; see
[environments](ENVIRONMENTS.md#local-configuration). `make doctor` does not
verify saved database connections, workspace names or privileges.

## DEV synchronization

**When DEV has approved changes that Git does not:**

```bash
make check-source
make source                     # Reads DEV; may replace local APEXLang files
# Review the diff, especially application.apx and deployment metadata
git diff -- applications/
```

`make source` preserves the Git-owned Supporting Objects SQL and local static
assets. It does not prove that DEV and Git are identical afterward; inspect
the exported changes before committing. Avoid running it over uncommitted
APEXLang edits without reviewing how they will be reconciled.

**When reviewed Git source must be imported into DEV:** obtain approval,
verify the saved DEV connection, and only then use:

```bash
make check-schema
make supporting              # Offline; updates tracked Supporting Objects SQL
make check                  # Full preflight, no database mutation
make sync-dev               # DESTRUCTIVE TO DEV app definitions; approval required
```

`make sync-dev` performs its own mandatory preflight and validates the DEV
workspace/schema before import. It does **not** provision Oracle schema
objects independently of the application Supporting Objects lifecycle.
`make supporting` validates but never regenerates the Admin deinstall script.

## Release preparation

A normal release uses Git-owned schema and metadata, reviewed APEXLang and
matching DEV applications. Use a new version in `VERSION.txt` and keep both
APEX application versions synchronized. Do **not** edit old upgrade-patch
versions simply to match the current version.

1. Review changes in `Database/`, `automation/schema/` and `applications/`.
   Update `VERSION.txt` to the intended release version (format
   `Release x.y.z.YYYYMMDD`, with the actual approved version components).
2. Reconcile reviewed application changes deliberately: use `make source`
   when DEV should update Git, or `make sync-dev` when Git should update DEV.
   **Never run both blindly**; inspect source changes before overwriting either.
3. After confirming the saved DEV and disposable TEST connections and obtaining
   approval for both, run `make build` (optional `PREVIOUS_ZIP=path`). It
   assembles Supporting Objects from Git, prepares DEV versions, exports and
   checks both applications against Git, then runs all offline checks and Python
   tests **after exporting but before publishing**. Finally, it packages and
   verifies the candidate and performs real TEST upgrade/install/deinstall.
4. Review generated Supporting Objects changes and the resulting candidate.
   If DEV differs from Git, build stops with source-reconciliation guidance;
   it never automatically imports or overwrites application definitions.
   A failed TEST acceptance makes the build fail, even if its checksummed
   candidate was already published locally. That candidate is **not approved**.
   Resolve the TEST issue and run `make test-release` to retest it without
   rebuilding; don't promote it until acceptance succeeds.

The candidate directory is `build/releases/<version-without-Release-prefix>/`.
It contains:

```text
blog-administration-latest.sql
blog-public-pages-latest.sql
apex-blog-latest.zip
apex-blog-stack-latest.zip
README.md
LICENSE.txt
VERSION.txt
manifest.json
SHA256SUMS
```

The two ZIP names use `-latest` **inside the versioned directory** to preserve
existing release-download naming. The manifest records version, DEV app IDs,
Git identity/dirty status when available, source fingerprint and file hashes.
`SHA256SUMS` also checks the manifest. Checksum verification detects change;
it is **not** a cryptographic signature or proof of installation success.

## Candidate integrity and overwrite

```bash
make verify-release                     # Existing candidate, offline
make release-check                      # Strict source/version + candidate checks
make verify-release RELEASE_DIR=build/releases/26.1.5.20261101
```

`make release-check` does **not** compare the candidate's source fingerprint
with the current working tree. The QA deployment path performs that additional
check. `make verify-release RELEASE_DIR=...` can verify older candidates while
working on newer sources.

A second `make build` for the same version fails by default. Only for an
**unpromoted, local** candidate that has not passed TEST/QA or been published:

```bash
make build OVERWRITE=YES          # Rebuilds, verifies and reruns TEST acceptance
```

The publisher acquires an exclusive per-version `flock` before DEV export,
assembles a complete temporary candidate, verifies it, then publishes by
directory rename. On a failed replacement it attempts to restore the old
candidate. TEST, QA, PROD and artifact verification use shared locks.
**Never delete** the persistent lock files in `build/releases/.locks/`;
removing them can bypass locking. Inspect an interrupted build's
`build/releases/.backup.*` directories for recovery instead of deleting them.

After TEST/QA approval or public release publication, **never overwrite that
version**; build a new version. Automation cannot detect a candidate that was
uploaded outside the local repository. Never manually edit candidate files.

## Testing and troubleshooting

### Offline safety tests

The small Python suite in `automation/tests/` protects **APEX Blog-specific
release risks**, not generic CI tooling:

- Schema manifests, generated SQL ordering, metadata and deinstall inventory.
- Preservation of Git-owned Supporting Objects and binary/static assets.
- Candidate locks, safe paths, release integrity and rollback after failures.
- Environment boundaries, production hotfix options and safe command sequencing
  for install, upgrade and deinstall operations.

Workflow tests invoke Bash/Make with `automation/tests/mock_sqlcl.py` as a
**command recorder and response stub**. It does not emulate Oracle, compile
PL/SQL, install APEX applications or prove that TEST is empty after deinstall.
Mocked tests are **not** real database acceptance tests.

```bash
make test-fast   # Schema, metadata and source parity checks
make test        # All focused offline safety tests
make check       # Real linters, offline tests and APEXLang validation
```

CI verifies generic tooling by running the actual linters, ShellCheck,
actionlint, Ruff, SQLcl validation and source checks; it does not maintain
Python regression suites for npm bootstrap, pre-commit wrappers or Terraform.
One focused CI test ensures the public workflow cannot deploy. Add new offline
tests only for distinct APEX Blog risks, not exact log output, Make syntax,
tool versions or GitHub Actions layout. Legacy Terraform remains separate.

### Real Oracle TEST acceptance

The following commands are **real, destructive database acceptance tests**,
run by `make build` after candidate verification, or independently on an existing
candidate. They are not part of `make test`, `make check` or GitHub CI. Verify that the saved TEST
connection points to an approved, dedicated disposable schema first.

The complete acceptance command validates an existing candidate, installs a
**strictly older** release and upgrades it, then performs another fresh install,
deinstalls and asserts the disposable TEST schema and both applications are
gone. It is sequential even when Make uses `-j`. By default the upgrade test
downloads the latest published GitHub release (`apex-blog-latest.zip`). To
select a specific older ZIP instead, set `PREVIOUS_ZIP=path`:

```bash
make test-release
# Optional overrides:
make test-release PREVIOUS_ZIP=/path/to/older/apex-blog-latest.zip \
  RELEASE_DIR=build/releases/26.1.5.20261101
```

The downloaded or supplied ZIP must identify a release **strictly older** than
the candidate. A download failure, missing published release, or non-older ZIP
stops the upgrade test **before TEST is reset**. Consequently, `make build`
also fails when no suitable older release exists (for example before first
public publication). The built candidate remains unapproved. Run
`make test-deinstall` for fresh installation and cleanup, and record that
upgrade compatibility is **not yet verified**. Individual TEST operations remain
available for diagnosis:

```bash
make test-install RELEASE_DIR=build/releases/26.1.5.20261101
make test-upgrade RELEASE_DIR=build/releases/26.1.5.20261101
make test-deinstall RELEASE_DIR=build/releases/26.1.5.20261101
```

- **Install:** resets TEST and installs both applications and Supporting
  Objects from the verified candidate.
- **Upgrade:** validates an older ZIP **before resetting TEST**, installs the
  older release, then imports the selected candidate. By default it downloads
  the latest published GitHub release; if that release is equal to or newer
  than your candidate, supply `PREVIOUS_ZIP` with a **strictly older** release.
- **Deinstall:** `make test-deinstall` first runs `make test-install`, then
  uses the **current tracked Admin deinstall SQL**, removes both applications,
  and verifies **zero** `USER_OBJECTS` plus neither test application remaining.
  On success, TEST is empty; rerun `make test-install` to repopulate it.
  For older `RELEASE_DIR` values, review the tracked deinstall script's
  compatibility with that candidate before this test.

These scripts use temporary working directories under `${TMPDIR:-/tmp}` and
remove them when they exit; **do not rely on persistent TEST logs under
`build/deploy-logs/`**. Capture terminal/SQLcl diagnostics when troubleshooting.
Normal QA and production deployment logs live under
`build/deploy-logs/<candidate-version>/<environment>/`; emergency hotfix
exports/logs live under `build/hotfix/`.

If a check fails, use the smallest relevant command:

| Symptom | First check |
| --- | --- |
| Missing tool or Git hook | `make doctor`, then `make setup` |
| Source/metadata/manifest inconsistency | `make check-schema`, then `make supporting` and review the diff |
| Local APEXLang reference error | `make check-source` |
| DEV/parity or release-version failure | `make check-release`; reconcile Git/DEV deliberately |
| Corrupt candidate or unexpected ZIP content | `make verify-release RELEASE_DIR=...` |
| Failed real TEST installation/deinstall | Check SQLcl diagnostics and compare manifest/deinstall SQL; do not use DEV/QA/PROD to troubleshoot |

Schema checks can reject a missing or duplicated object, package body, foreign
key DROP, or Oracle Text cleanup; fix the checked-in source rather than
weakening the test or editing a generated release candidate.

## Promote to QA and production

**Use exactly the same verified candidate** across TEST, QA/UAT, production and
a public GitHub release. Never rebuild between promotions.

```bash
make qa RELEASE_DIR=build/releases/26.1.5.20261101
# After QA acceptance and explicit production approval:
make production RELEASE_DIR=build/releases/26.1.5.20261101
```

QA runs the full preflight and compares the candidate fingerprint with current
Git sources before connecting to the database. Production checks the candidate and verifies the connected target; it
does not re-run the full preflight or
require Git to remain at the original version. Both import **packaged full SQL
exports** (Admin first). `make production` is not a rollback command.

For a GitHub release, publish both **prebuilt** ZIPs and `SHA256SUMS` from
the selected candidate. Preserve `manifest.json` alongside the release assets
when possible; checksum validation is not a signature. Do not recreate ZIPs
from later source. Before publishing, record the approved candidate version,
Git commit/tag, successful TEST/QA acceptance and intended artifacts. The
public `-latest` asset URLs only work after a GitHub release is published.

## Emergency hotfix

Use the QA/UAT-to-PROD hotfix **only after explicit production approval**, when
normal release promotion cannot safely carry a critical fix (for example when
DEV is already ahead of PROD). The script does **not** run the normal preflight,
version compatibility checks, candidate checksums or backup. It verifies the configured
PROD target, schema and workspace before the first import. There is no
command-line confirmation flag; obtaining authorization is a separate process.
A verified target does not replace the bypassed release gates.

```bash
make hotfix-export                            # QA/UAT -> build/hotfix/f<ID>.sql
# Review both exported SQL files, including their actual Supporting Objects.
make hotfix-production            # Imports both; Supporting Objects ON
# Only if explicitly approved to skip automatic Supporting Objects installation:
make hotfix-production OBJECTS=NO
```

Both QA/UAT apps are exported with Supporting Objects. By default PROD import
uses `APEX_APPLICATION_INSTALL.SET_AUTO_INSTALL_SUP_OBJ(TRUE)` for **both**
apps; it may execute schema/data-changing scripts. `OBJECTS=NO` sets this
option to `FALSE` for both; the SQL files still contain Supporting Objects.
The script equivalent is
`automation/hotfix.sh production --skip-supporting-objects`.

`make hotfix-export` replaces the previous pair under `build/hotfix/` only
when both exports succeed. `make hotfix-production` then uses those **saved**
files; it does not fetch QA/UAT or DEV again. The imports run Admin first,
then Public; the first might already be changed if the second fails. Review
APEX version compatibility, exported Supporting Objects and any environment-
specific settings before running. No automatic rollback is provided.

**Afterward:** reconcile the approved hotfix into Git and DEV through a
reviewed application change, then run the normal release process. `make source`
always reads the configured **DEV** workspace; it does **not** export QA/UAT
APEXLang. Do not point it at QA by changing only a connection alias, because
DEV workspace/schema/ID checks still apply. Never overwrite existing DEV
changes merely to copy an emergency fix.

## Production recovery and rollback

**There is no automated, generally safe PROD rollback.** Restoring a previous
APEX definition is not necessarily sufficient to reverse database migrations
or data transformations. In particular, do **not** run the checked-in
`deinstall-script.sql` on PROD as a generic rollback step: it removes schema
objects and can destroy data.

For a production incident, stop further promotion, retain the original
candidate and SQLcl logs, establish the current schema/data state, and agree a
recovery procedure with the DBA and application owner. Use tested backups,
point-in-time recovery or a reviewed version-specific forward/rollback
migration where appropriate. Only import a previous verified application
candidate if its Supporting Objects and schema/data compatibility have been
confirmed. Record approvals and resulting versions.

## Schema changes

1. Add or edit the authoritative source under `Database/`; package
   specifications and bodies use paired `.pks` / `.pkb` files.
2. Maintain **both** explicit `automation/schema/install.list` and
   `upgrade.list` according to their different purposes. Upgrade DDL must be
   reviewed as a migration; do not blindly add every install file to it.
3. If a table, view, package, FK, or Oracle Text preference is added or
   removed, edit
   `applications/blog-admin/supporting-objects/deinstall-script.sql`
   with the appropriate **DROP** and cleanup statements. This is SQL source,
   not an `@Database/...` include file.
4. Run `make check-schema`, `make supporting`, then `make check-schema` again;
   review `git diff -- applications/`.
5. Before release, execute fresh-install, upgrade and deinstall tests on the
   **approved disposable TEST** environment.

The two metadata SQL files are Git authoritative. Preserve dynamic APEX
application-ID expressions. The Public metadata `G_APP_VERSION` is rendered
from `VERSION.txt`, never exported from a `BUILD_API` package.
