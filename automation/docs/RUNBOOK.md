# Automation runbook

Use these procedures from the **repository root**, after checking the actual
[Make targets](../../Makefile). The developer prepares the environment using
the [connection configuration guide](ENVIRONMENTS.md); routine operations use
those configured mappings. This runbook covers release procedures, recovery,
and automation maintenance. The [maintenance guide](MAINTENANCE.md) defines
roles, task boundaries, environment authorization and documentation ownership.

## Before running release commands

For developer/maintainer tooling installation and diagnosis, see the
[automation setup instructions](../README.md#setup-and-diagnostics). The
[Dev Container guide](MCP_AUTOMATION.md#vs-code-development-container)
describes image-managed tools: rebuild that image to change them;
`make setup RESET=YES` is **not** a container repair command.

```bash
make check     # Full offline quality gate, including application tests
```

`make check` requires SQLcl and supported Java and validates APEXLang without
connecting to DEV/TEST. `make test` exercises application
JavaScript tests only; automation-maintainer suites are separate (see below).
For developer-managed connection overrides, use the ignored
`automation/variables.local.sh` or
`APEX_BLOG_*` variables described in [environments](ENVIRONMENTS.md#local-configuration).
`make doctor` is a developer setup/diagnostic command, not a prerequisite for
each application task. It checks tool presence, not connection identities or
privileges. Environment-failure handling follows the
[role boundaries](MAINTENANCE.md#roles-and-task-boundaries).

The authoritative step order and command selection are in the
[development flow](DEVELOPMENT_FLOW.md). This runbook focuses on safeguards,
recovery, and exceptional operations.

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

**When reviewed Git source must be imported into DEV:** use the configured
DEV connection under the task's authorization:

```bash
make supporting             # When schema, metadata or version inputs changed
# Review the generated Supporting Objects diff before import.
make sync-dev               # Replaces DEV definitions under task authorization
```

Generate before checking: after a `VERSION.txt` change, `make check-schema`
rejects the old Public metadata version until `make supporting` renders it.
The generator validates its inputs before writing and never regenerates the
Admin deinstall script.

`make sync-dev` runs the full preflight and its automatic DEV environment
guard before import. It imports APEXLang and Supporting Objects definitions
with automatic Supporting Objects installation disabled. It does not apply
the database SQL or compile PL/SQL in DEV. Apply the relevant `Database/`
changes separately under the task's authorization, then import the reviewed
application definitions. For release-version changes, follow
[release-version preparation](DEVELOPMENT_FLOW.md#prepare-a-release-version).

## Pretest from live DEV

Use [development flow: optional pretest](DEVELOPMENT_FLOW.md#optional-pretest-from-live-dev)
for `make pretest` selection (`TEST=install|upgrade|deinstall`, or all when
omitted), version prerequisites and temporary-export behavior. Resets of the
configured disposable TEST environment are preauthorized under the
[environment policy](MAINTENANCE.md#application-data-and-environment-policy).
Exported DEV SQL is never a release candidate; successful pretest does
**not** approve promotion.

Before exporting, the script automatically checks the configured DEV/TEST
mappings and requires DEV application versions and `BLOG_SETTINGS.G_APP_VERSION`
to match local `VERSION.txt`. Before an upgrade reset it also validates the
published GitHub release. Equal application versions are valid **only** for
pretest, for example when TEST has a newer APEX runtime; formal candidate
acceptance requires a strictly older baseline. SQLcl diagnostics should be inspected for
failures; exported SQL files are discarded on exit.

## Release preparation

A normal release uses Git-owned schema/metadata, reviewed APEXLang and
matching DEV applications. The exact Make sequence is in
[development flow](DEVELOPMENT_FLOW.md#formal-candidate-build-and-release-acceptance).
Follow [release-version preparation](DEVELOPMENT_FLOW.md#prepare-a-release-version)
to align `VERSION.txt`, both tracked application versions, generated SQL and
DEV definitions. Leave historical upgrade conditions and version dates
unchanged. Run `make build` under the task's DEV authorization. A failed
DEV/Git parity check requires an explicit decision between `make source`
and `make sync-dev`; never perform both blindly.

If TEST acceptance fails after candidate publication, the candidate has not
passed acceptance. For an environment or transient problem, correct the cause
and rerun `make test-release` against the same candidate. For a defect in its
packaged application or schema SQL, correct and reconcile the source, then
build a corrected candidate under the
[overwrite/version procedure](#candidate-integrity-and-overwrite). Editing
working-tree files does not repair SQL already packaged in a candidate.

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
version**; build a new version. These restrictions are operator procedures:
the scripts do not track or enforce TEST/QA acceptance, approvals, promotion
or GitHub publication history. The overwrite helper checks paths, files,
version and locking; those checks do not establish eligibility. Record the
candidate's acceptance and promotion history before deciding whether it may
be replaced. Never manually edit candidate files.

## Testing and troubleshooting

### Application tests

Existing application tests are in `tests/`. They validate application behavior
rather than the automation that runs checks or builds releases. The current
suite uses Node.js's built-in test runner to exercise tracked frontend JavaScript with
mocked browser/APEX interfaces. It does **not** exercise PL/SQL, Oracle DDL,
APEX runtime behavior, or database connections; those need separate tests and
real Oracle acceptance where appropriate.

Responsibility for running existing checks versus developing test suites is
defined in [role boundaries](MAINTENANCE.md#roles-and-task-boundaries).

```bash
make test        # Application tests (currently frontend JavaScript)
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
candidate. They are not part of `make test`, `make check` or GitHub CI. Use the
developer-configured disposable TEST connection. These resets are
preauthorized, and the commands perform automatic environment guards before
reset; no separate connection-identity investigation is required.

The complete acceptance command validates an existing candidate, upgrades
TEST from the **latest stable published GitHub release** (tag on `master`),
then performs a fresh install, deinstalls and verifies TEST is empty. The
previous release is checked for tag ancestry, version and available published
checksums **before** TEST reset. The formal candidate must be strictly newer
than that published release. See
[development flow](DEVELOPMENT_FLOW.md#formal-candidate-build-and-release-acceptance)
for the authoritative version and provenance policy.

```bash
make test-release
make test-release RELEASE_DIR=build/releases/26.1.5.20261101
```

No local `PREVIOUS_ZIP` or download URL override is accepted. If a verified,
older published GitHub release is unavailable, formal acceptance fails. For preliminary installation
or cleanup diagnostics use `make pretest TEST=install` or
`make pretest TEST=deinstall` against live DEV, but record clearly that these
do **not** test the candidate or replace formal release acceptance. There are
no separate public `make test-install`, `test-upgrade` or `test-deinstall`
commands. `make test-release` runs all three scripts sequentially and leaves
TEST empty on success.

Reset and deinstallation use the current checkout's
`applications/blog-admin/supporting-objects/deinstall-script.sql`, not SQL
extracted from the selected candidate. When selecting an older `RELEASE_DIR`,
use a checkout whose deinstall script can clean up that candidate's objects.
Installation checks each app's packaged version and rejects invalid `BLOG_`
objects after both imports. The final deinstall check requires zero schema
user objects and neither configured TEST application to remain.

These scripts use temporary working directories under `${TMPDIR:-/tmp}` and
remove them when they exit; **do not rely on persistent TEST logs under
`build/deploy-logs/`**. Capture terminal/SQLcl diagnostics when troubleshooting.
Normal QA and production deployment logs live under
`build/deploy-logs/<candidate-version>/<environment>/`; emergency hotfix
exports/logs live under `build/hotfix/`.

If a check fails, use the smallest relevant command:

| Symptom | First check |
| --- | --- |
| Missing tool or Git hook | Application agent: report the failure. Developer/maintainer: run `make doctor`, use `make setup RESET=YES` on a host, or rebuild the relevant image for container-installed tools |
| Source/metadata/manifest inconsistency | Correct authored inputs, run `make supporting` when generation is needed, review its diff, then run `make check-schema` |
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
# After QA acceptance, under the task's production authorization:
make production RELEASE_DIR=build/releases/26.1.5.20261101
```

QA runs the full preflight and compares the candidate fingerprint with current
Git sources before connecting to the database. Production checks the candidate and verifies the connected target; it
does not re-run the full preflight or
require Git to remain at the original version. Both import **packaged full SQL
exports** (Admin first). `make production` is not a rollback command.
Neither promotion command establishes that prior TEST/QA acceptance or
authorization occurred; retain that evidence as part of the release record.

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
version compatibility checks, candidate checksums or backup. It automatically
verifies the configured PROD target, schema and workspace before the first
import. There is no
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
   specifications use `.pks` and bodies use `.pkb`.
2. Update `Database/install.list` and `Database/upgrade.list` when their file
   membership or execution order changes. Editing an already listed file
   does not itself require a manifest change. Review upgrade DDL as a
   migration; do not copy every fresh-install file into the upgrade list.
3. If a table, view, package, FK, or Oracle Text preference is added or
   removed, edit
   `applications/blog-admin/supporting-objects/deinstall-script.sql`
   with the appropriate **DROP** and cleanup statements. This is SQL source,
   not an `@Database/...` include file.
4. Run `make supporting`, then `make check-schema`;
   review `git diff -- applications/`.
5. Apply the relevant SQL and compile PL/SQL in DEV under the task's
   authorization. Import updated APEXLang/Supporting Objects definitions as
   described in [DEV synchronization](#dev-synchronization); importing these
   definitions does not execute the database scripts.
6. For release work, `make build` includes upgrade, fresh-install and
   deinstall acceptance on preauthorized disposable TEST. Retest an existing
   candidate with `make test-release` when appropriate.

Manifest validation requires a specification and body for each included
package, with all specifications before bodies. This validates source
membership/order; it does not require changing a specification whenever its
body changes.

The two metadata SQL files are Git authoritative. `G_ADMIN_APP_ID` and
`G_PUB_APP_ID` use
`blog_util.int_to_vc2(apex_application_install.get_application_id)` so the
installed values follow the target application's ID. Keep those expressions
when changing metadata. Generation renders only the Public `G_APP_VERSION`
literal from `VERSION.txt`.
