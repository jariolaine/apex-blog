# Immutable release candidates and source consistency

Normal APEX Blog releases are built from APEXLang in `applications/` and
packaged into **two full SQL exports with Supporting Objects**. This is separate
from the emergency QA/UAT-to-production hotfix workflow in `HOTFIX.md`.

## Check source before preparing a release

```bash
make check-schema    # Offline: validate manifests and tracked deinstall SQL
make check-source    # WIP-safe: APEXLang static and Supporting Objects references, DEV IDs
make check-release   # Strict: also match VERSION.txt and current installer metadata
```

`make supporting` assembles schema files in manifest order, uses the checked-in
foreign keys and indexes, and contacts DEV **only for metadata**. It validates
but never regenerates the repository-owned admin deinstall script. When an
object, foreign key, or Oracle Text preference is added or removed, update
`applications/blog-admin/supporting-objects/deinstall-script.sql` together
with `install.list`, run `make check-schema`, and validate actual removal with
`make test-deinstall` against disposable TEST. Review regenerated install and
upgrade Supporting Objects SQL against the previous release.
`make validate` includes the WIP-safe source check. `make build` includes the
strict check; a failed check stops before publishing a candidate. Historical
upgrade patch version numbers are intentionally *not* compared to VERSION.txt.

**Baseline drift in the 2026-11-01 repository:** `VERSION.txt` and generated
installer metadata say `Release 26.1.5.20261003`, but both `application.apx`
files say `Release 26.1.5.20261031`. This mismatch is real. Choose the intended
release version before building. If `VERSION.txt` is authoritative, run the
explicit release-preparation sequence and review its diffs:

```bash
make prepare-release CONFIRM=YES  # Changes DEV applications and BLOG_SETTINGS
make supporting                   # Updates generated Supporting Objects SQL
make source                       # Refreshes local APEXLang from DEV
make check-release
```

Only perform DEV changes with appropriate authorization. Do not silence the
checks by editing tests, stripping versions, or rewriting unrelated migrations.
The default DEV IDs are 402 (Admin) and 401 (Public); local connection and ID
overrides belong in the ignored `automation/variables.local.sh`.

## Build one candidate

```bash
make build
make release-check  # Strict source versions + built candidate manifest/checksums
```

`make release-check` combines `make check-release` and `make verify-release`.
It is read-only, requires a built candidate, and supports `RELEASE_DIR=...`.
It does **not** compare the candidate fingerprint with the current working
source; the mandatory QA gate checks that separately. Use `make verify-release`
alone to verify an older candidate without requiring current source versions.

For a release with version `Release 26.1.5.20261101`, the output is:

```text
build/releases/26.1.5.20261101/
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

The ZIPs retain their `-latest` filenames **inside the versioned directory**
for compatibility with the existing GitHub release asset URLs. `manifest.json`
records the version, DEV IDs, Git commit (if available), whether the checkout
had uncommitted changes, a fingerprint of release-relevant source, and file
checksums. `SHA256SUMS` also covers the manifest.

By default, **a candidate cannot be overwritten**: a repeated `make build`
fails. For local development, deliberately replace just the current version
without manually removing anything from `build/`:

```bash
make build OVERWRITE=YES
make verify-release
```

`make build` is read-only with respect to tracked APEXLang: it exports DEV to a
temporary directory, checks that it matches `applications/`, and creates SQL
releases without refreshing source. Use `make source` explicitly to refresh
APEXLang when required.

An overwrite checks the configured release version, takes an exclusive lock,
completely builds and verifies the replacement before publication, backs up
and replaces only `build/releases/<version>/`, then verifies the published files.
If publication fails, automation restores the old candidate; it never deletes
other versions or deployment logs. Concurrent TEST/QA/production/verification
operations hold shared locks, so a rebuild refuses to run while a candidate is
in use. This locking requires the Linux `flock` command (util-linux). Lock files inside `.locks/` are persistent and should not be removed.
A sudden machine shutdown during directory renames may leave a hidden
`.backup.*` directory under `build/releases/`; retain it for recovery.

**Rebuild only local, unpromoted candidates.** After TEST or QA approval or
public release publication, do not overwrite that version: use a new release
version and repeat verification and testing. Local automation cannot know if a
candidate was uploaded to GitHub elsewhere. Never manually edit release files.
Checksums detect accidental changes but are not a substitute for signatures.

## Test and promote the exact same candidate

By default, the scripts select `build/releases/<version-from-VERSION.txt>/`.
Use `RELEASE_DIR` to select a previously built candidate explicitly:

```bash
make verify-release RELEASE_DIR=build/releases/26.1.5.20261101
make test-install RELEASE_DIR=build/releases/26.1.5.20261101
make test-deinstall RELEASE_DIR=build/releases/26.1.5.20261101
make test-upgrade RELEASE_DIR=build/releases/26.1.5.20261101  # Downloads GitHub latest release
make test-upgrade PREVIOUS_ZIP=/path/to/previous/apex-blog-latest.zip RELEASE_DIR=build/releases/26.1.5.20261101  # Uses local ZIP
make qa RELEASE_DIR=build/releases/26.1.5.20261101
make production CONFIRM=YES RELEASE_DIR=build/releases/26.1.5.20261101
```

`make test-deinstall` is destructive and is only for the dedicated disposable
TEST schema. It runs `make test-install` **first** using the selected release,
then executes the tracked admin Supporting Objects deinstall SQL, removes both
TEST APEX applications, and verifies that `USER_OBJECTS` contains **zero** rows
(not merely zero `BLOG_` rows) and neither TEST app is still installed.
Any remaining object or app fails the test. The database is left empty on
success; run `make test-install` again if you need TEST populated afterward.
This checks the current checked-in deinstall script against the release candidate;
review source/candidate alignment before testing an older `RELEASE_DIR`.

`make test-upgrade` downloads the **latest published GitHub release** by default,
using `upgDownloadUrl` from `automation/variables.sh` (overridable in
`automation/variables.local.sh` or `APEX_BLOG_UPGRADE_DOWNLOAD_URL`). Pass
`PREVIOUS_ZIP=/path/to/previous.zip` to use a local release ZIP instead and
skip the download. The ZIP must contain `VERSION.txt` and both application SQL
exports, and its version must be **strictly older** than the selected candidate.
The ZIP is validated **before** the disposable TEST schema is reset. If GitHub
latest is the same version or newer, explicitly select an older ZIP.
After importing both applications, TEST/QA/production verify application
versions and fail if BLOG_ database objects remain invalid. The application
installer does not override APEX-managed remote-server URLs.

`make qa` continues to run the **mandatory full preflight** and checks that
the local source fingerprint matches the chosen candidate before connecting
to QA. Production verifies the candidate files but does not require the current
working source to remain unchanged; an older, QA-tested candidate can still be
promoted. No build is performed during deployment. Deployment logs are kept in
`build/deploy-logs/`, not inside immutable candidates.

For a public GitHub release, upload the two prebuilt ZIPs from the same
candidate directory. For example (after QA/production verification and with
GitHub CLI configured):

```bash
CANDIDATE=build/releases/26.1.5.20261101
gh release create 26.1.5.20261101 \
  "$CANDIDATE/apex-blog-latest.zip" \
  "$CANDIDATE/apex-blog-stack-latest.zip" \
  --title 'Release 26.1.5.20261101'
```

The hotfix commands (`make hotfix-export`, `make hotfix-production`) remain
independent: **no release manifest, source gate, or versioned candidate** is
required for them.
