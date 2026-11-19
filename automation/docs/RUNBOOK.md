# Automation runbook

Use these procedures from the **repository root**, after checking the actual
[Make targets](../../Makefile). Read [environment safeguards](ENVIRONMENTS.md)
before accessing a database. This runbook consolidates the earlier automation
README, release-candidate guide and emergency hotfix guide.

## Before running release commands

For host-only tooling installation and diagnosis, see the
[automation setup instructions](../README.md#setup-and-diagnostics). The
[Dev Container guide](MCP_AUTOMATION.md#vs-code-development-container)
describes image-managed tools: rebuild that image to change them;
`make setup RESET=YES` is **not** a container repair command.

```bash
make doctor    # Check tool presence; does not test database connections
make check     # Full offline quality gate, including application tests
```

`make check` requires SQLcl and supported Java and validates APEXLang without
connecting to DEV/TEST. `make test` and `make test-fast` exercise application
JavaScript tests only; automation-maintainer suites are separate (see below).
For connection overrides, use the ignored `automation/variables.local.sh` or
`APEX_BLOG_*` variables described in [environments](ENVIRONMENTS.md#local-configuration).
`make doctor` does not verify saved connection identities or privileges.

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

1. Review changes in `Database/` and `applications/`.
   Update `VERSION.txt` to the intended release version (format
   `Release x.y.z.YYYYMMDD`, with the actual approved version components).
2. Reconcile reviewed application changes deliberately: use `make source`
   when DEV should update Git, or `make sync-dev` when Git should update DEV.
   **Never run both blindly**; inspect source changes before overwriting either.
3. After confirming the saved DEV and disposable TEST connections and obtaining
   approval for both, run `make build` (optional `PREVIOUS_ZIP=path`). It
   assembles Supporting Objects from Git, prepares DEV versions, exports and
   checks both applications against Git, then runs all offline checks and application
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

### Application tests

Application tests belong in `tests/`. They validate application behavior rather
than the automation that runs checks or builds releases. The current suite uses
Node.js's built-in test runner to exercise tracked frontend JavaScript with
mocked browser/APEX interfaces. It does **not** exercise PL/SQL, Oracle DDL,
APEX runtime behavior, or database connections; those need separate tests and
real Oracle acceptance where appropriate.

```bash
make test        # Application tests (currently frontend JavaScript)
make test-fast   # Same application suite until a fast subset is introduced
make check       # Lint, schema/source checks, application tests, APEXLang
```

### Automation maintainer regression tests

The Python suites under `automation/tests/` and `automation/mcp/tests/` test the
**automation implementation**, including:

- Schema assembly, metadata processing, source parity and deinstall validators.
- Candidate integrity, safe paths, locks, rollback and release workflows.
- Environment restrictions, TEST acceptance orchestration and hotfix safeguards.
- MCP queue, API schemas, worker behavior and bootstrap.

These are **not application tests**. They are intentionally excluded from all
Make targets, MCP jobs, application preflight, builds and normal CI. Automation
maintainers can run them directly using their configured Python environment:

```bash
python3 -m unittest discover -s automation/tests -v
python3 -m pytest -q automation/mcp/tests/
```

The Dev Container includes `pytest` and the MCP SDK for these tests;
when running on a host, install those optional maintainer dependencies
separately. The MCP runtime image is not the maintainer test environment.
Workflow tests use `automation/tests/mock_sqlcl.py` as a mock SQLcl
command recorder, not a real Oracle database. Passing these suites does not
prove an actual Oracle installation, PL/SQL compile or successful deinstall.

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
| Missing tool or Git hook | Run `make doctor`; use `make setup RESET=YES` on a host, or rebuild the Dev/MCP image for container-installed tools |
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
2. Maintain **both** `Database/install.list` and `Database/upgrade.list`
   for their different purposes. Upgrade DDL must be reviewed as a migration;
   do not blindly add every install file to it.
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
