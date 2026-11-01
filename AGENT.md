# APEX Blog: instructions for a local coding agent

Scope: this repository. Target Oracle APEX **26.1**. Work in small, reviewable steps. Do not invent APEXLang syntax, SQLcl flags, paths, or Makefile targets.

## First steps

1. Read `Makefile`, then inspect only the files needed for the task. Check `git status --short` before editing.
2. State a short plan. Prefer the smallest change; preserve unrelated files and existing behavior.
3. After editing, run the relevant *non-destructive* checks. Report changed files, test results, and anything not verified.
4. Never claim that a mock test proves an Oracle database import, PL/SQL compile, or deployment succeeded.

## Repository map

- `applications/blog/` and `applications/blog-admin/`: **APEXLang** application source (`.apx`), not split SQL.
- `Database/`: schema SQL, including separate package `.pks`/`.pkb` files. `automation/schema/`: Git-owned install/upgrade order. `automation/database/BUILD_API.sql`: metadata export helpers only.
- `applications/*/supporting-objects/`: install and upgrade SQL, plus manually
  maintained `blog-admin/supporting-objects/deinstall-script.sql`. Never
  regenerate deinstall SQL from DEV. Update it alongside schema changes.
- `applications/*/shared-components/static-files/`: Git-owned CSS, JS, images, and binaries. Add/rename assets in `shared-components/static-files.apx` too.
- `less/`: LESS source for generated CSS. Keep LESS and CSS consistent.
- `VERSION.txt`: authoritative release version; keep its final `YYYYMMDD` suffix.
- `automation/variables.sh`: default settings. `automation/variables.local.sh`: local overrides; **never commit or print secrets**.
- `build/releases/<version>/`: immutable SQL release candidates with manifest and checksums. `build/hotfix/` stays separate. Never commit generated artifacts.

## Commands and permission

**Local checks (may run):**

```sh
make doctor
make lint
make test
make validate
make check-source
make check-schema
make check-release
make verify-release
make release-check
make check
```

`make validate` needs SQLcl but does not connect to a database. If SQLcl is missing, say so.

**Read DEV but change local files (run only when relevant; warn about overwritten source):**

- `make supporting`: assemble database objects, foreign keys and indexes from Git manifests/files; export **metadata only** from DEV. It validates but never overwrites the tracked deinstall script. Inspect the resulting diff.
- `make source`: export APEXLang from DEV; may overwrite `.apx` changes. Existing local Supporting Objects SQL and static-file bytes are preserved.
- `make build`: read-only APEXLang parity/source validation and versioned SQL release ZIPs, manifest, checksums. Existing versions remain protected by default; `make build OVERWRITE=YES` replaces only the current unpromoted local candidate with staged verification and rollback, without changing tracked source. Never overwrite a QA-approved/published candidate.

**Requires explicit human approval BEFORE execution:**

- `make setup CONFIRM=YES`: installs local CI tools and then compiles `BUILD_API`
  in DEV. This is one command, but **not a local-only operation**.
- `make setup-build-api`: compiles `BUILD_API` in DEV only.
- `make prepare-release CONFIRM=YES`: changes DEV versions.
- `make sync-dev`: overwrites both DEV APEX application definitions.
- `make test-install` / `make test-upgrade` / `make test-deinstall`: reset the **disposable TEST** schema. `test-deinstall` always runs `test-install` first, then removes both TEST apps and Supporting Objects and verifies the schema has **zero** user objects. Run only against an approved disposable TEST schema.
- `make qa` / `make production CONFIRM=YES`: deploy normal release applications.
- `make hotfix-production`: directly replace both PROD applications from saved QA/UAT exports; no build or release gates.

Check the saved SQLcl connection and target schema before any approved database operation. Do not automatically execute SQL that drops or upgrades objects. Never run a command just because it is listed here.

## Mandatory quality checks

- Read `automation/ci/README.md` for tooling setup and lint scope. Use
  `make setup-ci` to create the local `.venv/` and Git hook without touching
  a database; use `make setup CONFIRM=YES` only with explicit authorization
  for DEV `BUILD_API` compilation. `make doctor` is a read-only diagnostic.
  Do not require a fixed Node.js major version or global `pre-commit`.
- Use `make lint` for all linters, `make test` for full automation regression
  tests, and `make preflight` for both plus SQLcl APEXLang validation.
- Pre-commit hooks and GitHub Actions run matching checks. Do not change code
  or suppress failures merely to make a test pass.
- `make sync-dev` and `make qa` **always** run mandatory preflight inside the
  underlying Bash scripts, including direct invocations. A failed check must
  stop before connecting to DEV/QA. No bypass flag is available.
- The independent QA-to-production emergency hotfix workflow is deliberately
  exempt. Do not insert normal release gates into it.

## APEXLang and release rules

- Use **APEXLang** for tracked application source; never replace it with SQLcl `-split` SQL exports.
- When Oracle's skill is available, consult [APEXLang skill](https://github.com/oracle/skills/blob/main/apex/apexlang/SKILL.md) and [APEX 26.1 guidance](https://github.com/oracle/skills/blob/main/apex/apexlang/26.1/SKILL.md). It is optional, not automatically installed. Use the repo `Makefile` for validation and deployment.
- `make source` protects locally maintained SQL and static assets, but does **not** prove that DEV matches Git. Inspect changes to `.apx` and static-file metadata.
- `make build` must fail on Supporting Objects or static-file drift from DEV. Correct the drift deliberately; do not overwrite files or weaken checks to make the build pass.
- Installer is the **full SQL export with Supporting Objects**, not APEXLang alone. Install Admin before Public. Preserve the order in `automation/schema/install.list` and `upgrade.list`: every `.pks` must have a matching `.pkb`, and all specs precede bodies. Run `make check-schema` before generation.
- `make check-source` is safe for work-in-progress; `make check-release` is strict and requires both app versions and current Supporting Objects versions to match VERSION.txt. Historical upgrade SQL retains old version dates.
- For **normal releases**, use one **unchanged versioned candidate** under `build/releases/<version>/` for TEST, QA, production, and GitHub. Use `RELEASE_DIR=...` to select it; QA also verifies the candidate's source fingerprint. Never rebuild between environments. Follow `automation/RELEASE_CANDIDATES.md`.

## Emergency QA/UAT -> production application hotfix

Only use this path when explicitly requested. Follow `automation/HOTFIX.md`:

- `make hotfix-export`: export both current QA/UAT applications to `build/hotfix/f<ID>.sql` (overwrites any prior hotfix candidate).
- `make hotfix-production`: import those two saved SQL files into PROD, Admin first. Request explicit human approval before running.
- This path deliberately skips DEV/TEST, APEXLang export, BUILD_API, checksum validation, and normal release gates. Supporting Objects are exported but **not executed** on import.
- Do not commit generated `build/hotfix/` files. Developers must carry fixes back into the usual development and source-control process separately.

## Finish every task

Report: (1) changed files, (2) tests run and results, (3) database actions *not* run, and (4) any remaining risk or needed approval. If unsure, stop and ask rather than guessing.
