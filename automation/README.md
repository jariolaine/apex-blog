# Automation documentation

Start here for APEX Blog development, CI, release preparation and deployment.
Run Make commands from the **repository root**. The source repository is the
reference for automation; the downloadable application ZIP does not contain
these automation scripts.

| Document | Purpose |
| --- | --- |
| **[Runbook](docs/RUNBOOK.md)** | Step-by-step setup, source/build workflows, TEST acceptance, promotion, hotfix and troubleshooting |
| **[Architecture](docs/ARCHITECTURE.md)** | Source ownership, scripts, CI gates, test limitations and release-candidate safeguards |
| **[Environments](docs/ENVIRONMENTS.md)** | DEV, disposable TEST, QA/UAT, PROD; SQLcl connections and local overrides |
| [Project README](../README.md) | End-user installation and upgrade instructions |
| [Agent guidance](../AGENT.md) | Repository-specific coding-agent safety and review rules |

## Quick start

```bash
make doctor        # Read-only; no database connection
make setup         # Install local tools and Git hooks; no database changes
make check         # Static checks, full mocked tests, APEXLang validation
make supporting    # Regenerate Git-owned Supporting Objects offline; review diff
```

`make check` is **not** an Oracle installation test. It needs local SQLcl for
APEXLang validation but does not connect to a database. `make supporting`
updates tracked files; it is not a read-only check.

## Which command should I run?

| Goal | Command | Details |
| --- | --- | --- |
| Show supported commands | `make help` | Makefile is authoritative |
| Diagnose local tooling | `make doctor` | [Setup](docs/RUNBOOK.md#local-setup) |
| Install CI tools and hooks | `make setup` | [Setup](docs/RUNBOOK.md#local-setup) |
| Static lint only | `make lint` | [CI architecture](docs/ARCHITECTURE.md#quality-gates-and-tests) |
| Quick / full mocked regression tests | `make test-fast` / `make test` | [Tests](docs/RUNBOOK.md#testing-and-troubleshooting) |
| Entire local / CI quality gate | `make check` | [CI architecture](docs/ARCHITECTURE.md#quality-gates-and-tests) |
| Validate APEXLang without a DB login | `make validate` | Requires SQLcl |
| Validate schema, metadata, deinstall | `make check-schema` | [Schema changes](docs/RUNBOOK.md#schema-changes) |
| Check APEXLang source references | `make check-source` | Work-in-progress-safe, offline |
| Generate Supporting Objects | `make supporting` | Offline; changes tracked files |
| Read APEXLang from DEV | `make source` | [DEV synchronization](docs/RUNBOOK.md#dev-synchronization) |
| Overwrite DEV applications | `make sync-dev` | **Approval required**; [DEV synchronization](docs/RUNBOOK.md#dev-synchronization) |
| Update DEV release versions | `make prepare-release CONFIRM=YES` | **Approval required** |
| Build release candidate | `make build` | [Release preparation](docs/RUNBOOK.md#release-preparation) |
| Check strict release source versions | `make check-release` | No DB login |
| Verify an existing candidate | `make verify-release` | Checks manifest and hashes |
| Check current source and candidate | `make release-check` | Requires existing candidate |
| Install, upgrade or deinstall in TEST | `make test-install`, `make test-upgrade`, `make test-deinstall` | **Destructive; approved disposable TEST only**; [Testing](docs/RUNBOOK.md#testing-and-troubleshooting) |
| Deploy to QA/UAT | `make qa` | **Approval required**, runs full gate |
| Promote to PROD | `make production CONFIRM=YES` | **Production approval required** |
| Emergency QA/UAT export | `make hotfix-export` | [Hotfix](docs/RUNBOOK.md#emergency-hotfix) |
| Emergency PROD import | `make hotfix-production` | **Production approval required**; Supporting Objects enabled by default |

For release-specific commands, an existing candidate can be selected using
`RELEASE_DIR=build/releases/<version>`. For upgrade testing, use
`PREVIOUS_ZIP=/path/to/older/apex-blog-latest.zip` when the latest published
release is not older than the candidate. For emergency import only,
`make hotfix-production OBJECTS=NO` skips **automatic** Supporting Objects
installation for both applications.

## Important safety distinctions

- **Local only:** `make doctor`, `make lint`, `make test`, `make check`,
  `make check-schema`, `make validate`, `make verify-release` do not mutate Oracle.
- **Changes source files:** `make supporting`, `make source`. Review their Git
  diffs; `make source` reads DEV and can overwrite local APEXLang changes.
- **Changes Oracle:** `make prepare-release`, `make sync-dev`, TEST operations,
  QA/production deployment and emergency hotfixes require an approved target.
- **Emergency hotfix:** bypasses normal release checks and may change PROD data
  and schema through Supporting Objects. It is **not** a rollback mechanism.
- **STAGING:** there is no supported staging connection, Make target or
  deployment path in v15. The normal pipeline is TEST → QA/UAT → PROD.

For manually managed infrastructure, see the legacy
[Stack documentation](../Stack/README.md); Terraform is outside this
application automation documentation change.
