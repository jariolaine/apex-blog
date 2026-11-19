# Automation architecture

This describes the implemented automation, not a proposal for additional
environments. See [automation README](../README.md) for commands,
[environments](ENVIRONMENTS.md) for connection settings and the
[runbook](RUNBOOK.md) for operational procedures. The
[maintenance guide](MAINTENANCE.md) defines roles, task boundaries and
documentation ownership.

## Source and build ownership

| Source | Owner and purpose |
| --- | --- |
| `applications/blog-admin/`, `applications/blog/` | Git-tracked **APEXLang** sources, Supporting Objects and static assets |
| `Database/` | Git-tracked schema DDL and `install.list` / `upgrade.list` execution order; package specs and bodies are `.pks` / `.pkb` |
| `Database/Tables/foreign_keys.sql`, `Database/Indexes/foreign_key_indexes.sql` | Authoritative constraints and FK index definitions |
| `applications/*/supporting-objects/install-scripts/metadata.sql` | Git-owned installation metadata; application-ID settings are evaluated during installation |
| `applications/blog-admin/supporting-objects/deinstall-script.sql` | **Manually maintained** deinstallation SQL |
| `VERSION.txt` | Release-version authority |
| `build/releases/<version>/` | Checksummed, protected SQL release candidate (not tracked in Git) |

`make supporting` validates the Git-owned inputs and deinstall consistency,
then updates the following tracked files without connecting to a database:

| Input | Output under `applications/` |
| --- | --- |
| `Database/install.list` and its ordered source files | `blog-admin/supporting-objects/install-scripts/database-objects.sql` |
| `Database/upgrade.list` and its ordered source files | `blog/supporting-objects/upgrade-scripts/database-objects-upgrade.sql` |
| `Database/Views/BLOG_V_VERSION.sql` | `blog/supporting-objects/install-scripts/create-view-blog-v-version.sql` |
| `VERSION.txt` | `G_APP_VERSION` literal in `blog/supporting-objects/install-scripts/metadata.sql` |
| `automation/templates/postupgrade.sql.in` and `VERSION.txt` | `blog/supporting-objects/upgrade-scripts/postupgrade.sql` |

The metadata files remain authored Git source; generation changes only the
Public version literal and preserves the Admin metadata. The deinstall script
is validated but never generated. Review the resulting diff before importing
these definitions into DEV or building a release.

`make source` explicitly exports APEXLang from DEV, preserving Git-owned
Supporting Objects SQL and static files. `make build` reads DEV, verifies
strict release/source parity against Git, then exports **full application SQL
with Supporting Objects**. It does not change the tracked APEXLang. These are
separate modes of `automation/export_application.sh`; no combined default mode
exists.

`make sync-dev` imports the local APEXLang and Supporting Objects definitions
with automatic Supporting Objects installation disabled. Applying database
SQL and compiling PL/SQL in DEV is a separate step in the
[development flow](DEVELOPMENT_FLOW.md#from-source-changes-to-promotion).

## Release implementation

The step-by-step Make command sequence and Mermaid diagrams are maintained in
[development flow](DEVELOPMENT_FLOW.md). This section describes release
integrity and implementation details, not a second workflow definition.

The previous-release TEST baseline is selected and validated exclusively
from the latest stable GitHub release tagged on `master`; implementation and
version policy are in [development flow](DEVELOPMENT_FLOW.md). Candidate
publication remains local until approved and published.

The candidate contains Admin and Public full SQL exports, the application
release ZIP, the legacy stack ZIP, `README.md`, `LICENSE.txt`, `VERSION.txt`,
`manifest.json` and `SHA256SUMS`. The two ZIP names retain `-latest` inside a
**versioned directory**. Deployments consume the two checked/verified SQL
exports from the candidate; they do not re-export applications in QA or PROD.

**Release integrity:** the exporter sources
`automation/lib/candidate_publish.sh`; an exclusive `flock` is acquired before
DEV export. Publication stages and verifies a complete candidate on the same
filesystem. Replacement requires `OVERWRITE=YES` and is restricted by the
[overwrite procedure](RUNBOOK.md#candidate-integrity-and-overwrite) to eligible
unpromoted local candidates; the helper does not track approval or promotion
history. It keeps backup/rollback state through final verification.
TEST/QA/PROD/verification take shared candidate locks. Lock files
live in `build/releases/.locks/`, are persistent and should **not** be deleted
manually. A failed interrupted replacement can retain `.backup.*` recovery
directories. See [safe candidate handling](RUNBOOK.md#candidate-integrity-and-overwrite).

`make build` verifies application frontend assets before any DEV changes. It then
assembles Git-owned Supporting Objects SQL, updates both DEV application
versions and live `BLOG_SETTINGS.G_APP_VERSION`, exports both applications to
temporary space and compares them with Git. Only
then does the exporter run the full `make check` gate (including application
tests, not automation regression suites), **before publication**. The build verifies the candidate and runs real
TEST acceptance; it fails if either gate fails. Stages remain sequential even
under parallel Make. It never runs `source` or `sync-dev` automatically, and
never silently resolves DEV/Git differences. Neither generation nor DEV
version preparation updates the tracked `application.apx` version fields;
follow [release-version preparation](DEVELOPMENT_FLOW.md#prepare-a-release-version)
before building. Generated Supporting Objects may change tracked SQL; check
the diff.
`make verify-release` checks manifest and checksums. `make release-check`
combines strict source-version checks and artifact verification; it does **not**
check the candidate's source fingerprint against the current tree. The QA
promotion path **does** require that fingerprint match. PROD may promote an
older QA-tested candidate from `RELEASE_DIR` even if the working source has
moved forward, under the task's production authorization and after compatibility
review. TEST/QA acceptance and promotion history are recorded by the operator,
not enforced by the manifest verifier.

## Quality gates and tests

`make check` and GitHub Actions `make ci` run
`automation/ci/preflight.sh` in this order:

1. `make lint`: pre-commit static lint/format checks (no tests).
2. `make check-assets`: read-only verification of compiled application CSS/JS.
3. `make check-schema`: offline manifest, metadata and deinstall validation.
4. `make check-source`: work-in-progress-safe local APEXLang reference check.
5. `make test`: run application tests from `tests/` **once** (currently
   Node.js frontend tests).
6. `make validate`: SQLcl APEXLang validation **without a DB login**.

`automation/tests/` and
`automation/mcp/tests/` contain tests of the automation implementation.
Maintainers run those Python suites directly; they are **not** invoked by
Make targets, MCP jobs, preflight, builds or application CI.
`make check-schema` and `make check-source` remain direct repository-source
validators, not automation unit-test runners. Application frontend tests run
against the tracked JavaScript with mocked APEX browser APIs; they do not
prove Oracle DDL, APEX installation or PL/SQL compilation succeeds.
See [testing procedures](RUNBOOK.md#testing-and-troubleshooting) and the
[DEV-to-TEST pretest flow](DEVELOPMENT_FLOW.md#optional-pretest-from-live-dev).
Real candidate acceptance is part of `make build` and can be repeated using
`make test-release` (all stages, never a selective subset). It runs on
disposable TEST, not in CI.

Direct `make sync-dev` and `make qa` enforce the full preflight before
database mutations. `make build` has its own strict source/version/parity
checks. Production promotion verifies its candidate and connected target;
it does **not** rerun the entire preflight. The emergency hotfix bypasses the
normal candidate, version, checksum and preflight gates altogether.

GitHub Actions runs the same quality gate on push and pull request, without
deployment secrets. It also validates the **unchanged legacy Terraform stack**
separately. Static checks include pre-commit, actionlint, ShellCheck, Ruff,
SQL hygiene, APEXLang validation and Terraform checks. See the actual
[CI workflow](../../.github/workflows/ci.yml) and
[pre-commit configuration](../../.pre-commit-config.yaml). The workflow
**does not** configure branch protection; repository administrators must
require the reported `quality` check in their branch rules/rulesets.

## Emergency hotfix boundary

`make hotfix-export` reads both QA/UAT applications into `build/hotfix/f<ID>.sql`
(Admin first), exporting Supporting Objects with them. A later
`make hotfix-production` imports **those saved SQL files** into
PROD without normal release checks or an automatic backup. The script also
verifies the configured PROD schema/workspace before either import. Supporting Objects install/
upgrade scripts run by default for both apps; `OBJECTS=NO` skips **automatic**
installation. The second import can fail after the first has already changed
PROD. See the [emergency runbook](RUNBOOK.md#emergency-hotfix).

**No staging target or automation is implemented.** Deployment code supports
QA and production; legacy `Stack/terraform` is maintained separately.
