# Immutable release candidates and source consistency

Normal APEX Blog releases are built from APEXLang in `applications/` and
packaged into **two full SQL exports with Supporting Objects**. This is separate
from the emergency QA/UAT-to-production hotfix workflow in `HOTFIX.md`.

## Check source before preparing a release

```bash
make check-source    # WIP-safe: APEXLang static and Supporting Objects references, DEV IDs
make check-release   # Strict: also match VERSION.txt and current installer metadata
```

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
make verify-release
```

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

**A candidate cannot be overwritten:** rebuilding the same version fails.
Never manually edit files inside `build/releases/<version>/`. Keep the candidate
outside Git as a local or CI artifact until it is promoted and published.
Checksums detect accidental changes but are not a substitute for signatures.

## Test and promote the exact same candidate

By default, the scripts select `build/releases/<version-from-VERSION.txt>/`.
Use `RELEASE_DIR` to select a previously built candidate explicitly:

```bash
make verify-release RELEASE_DIR=build/releases/26.1.5.20261101
make test-install RELEASE_DIR=build/releases/26.1.5.20261101
make test-upgrade PREVIOUS_ZIP=/path/to/previous.zip RELEASE_DIR=build/releases/26.1.5.20261101
make qa RELEASE_DIR=build/releases/26.1.5.20261101
make production CONFIRM=YES RELEASE_DIR=build/releases/26.1.5.20261101
```

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
