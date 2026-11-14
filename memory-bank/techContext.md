# Tech Context

## Toolchain

- **APEXLang**: tracked application source format under `applications/` — never
  replace with SQLcl `-split` SQL exports.
- **SQLcl** (needs a compatible Java runtime; CI uses Temurin 21): validates
  APEXLang (`make validate`) and executes all database operations. Binary
  selectable with `SQLCL_BIN`.
- **Bash** scripts in `automation/` (ShellCheck-linted), Python 3.12 helpers in
  `automation/lib/` (Ruff-selected rules E4/E9/F63/F7/F82), Python tests in
  `automation/tests/` with `mock_sqlcl.py` as a command recorder/response stub.
- **Node tools** (`package.json`): ESLint 10, Stylelint 17 (+postcss-less) for
  `less/**/*.less` and `applications/**/*.css`, markdownlint-cli2,
  Prettier (singleQuote false, printWidth 100, tabWidth 2).
- **pre-commit** Git hook runs static lint only (`.pre-commit-config.yaml`);
  GitHub Actions `.github/workflows/ci.yml` runs the real tools plus offline
  tests and APEXLang validation. No deployment job exists in CI.
- VS Code recommendations: `hookyqr.minify`, `mrcrowl.easy-less`,
  `oracle.sql-developer`. LESS is compiled/minified locally (no build step in
  Make); generated `.min.*` static files are committed.

## Make targets (Makefile help is authoritative)

Safe / local (no database):

- `make setup` (`RESET=YES` to reinstall `.venv/`, `node_modules/`, hook),
  `make doctor` (read-only diagnostic), `make lint`, `make test`,
  `make test-fast`, `make validate`, `make check` (full gate = preflight),
  `make check-schema`, `make check-source`, `make check-release`,
  `make verify-release [RELEASE_DIR=path]`, `make release-check`,
  `make supporting` (assembles Git-owned Supporting Objects SQL offline; renders
  `G_APP_VERSION`; never regenerates the deinstall script).

Reads DEV / changes local files:

- `make source` — export APEXLang **from DEV** into `applications/`; overwrites
  local `.apx` changes; preserves Supporting Objects SQL and static assets.

Approval required before running (destructive to a database):

- `make prepare-release` (sets DEV app versions), `make sync-dev` (overwrites
  DEV app definitions; preflight enforced inside the script — no bypass flag),
  `make build` (everything: supporting + prepare-release + export/diff + gate +
  publish candidate + real TEST acceptance; `OVERWRITE=YES` only for unpromoted
  local candidates; refuses `RELEASE_DIR`), `make test-install` /
  `test-upgrade` / `test-deinstall` / `test-release` (disposable TEST schema;
  upgrade input defaults to GitHub latest release, `PREVIOUS_ZIP=path`
  overrides and must be strictly older), `make qa`, `make production`.
- Hotfix: `make hotfix-export` (reads QA/UAT, writes `build/hotfix/f<ID>.sql`),
  `make hotfix-production` (imports saved files into PROD, admin first;
  `OBJECTS=NO` skips Supporting Objects install — default YES). Gate-exempt by
  design; requires prior human authorization and target verification.

## Environments and configuration

- Saved **SQLcl connection names** (not connect strings): defaults
  `blog_dev`, `blog_uat`, `blog_prd`, `blog_tst`.
- Schemas == workspaces: `BLOG_DEV`, `BLOG_UAT`, `BLOG_PRD`, `BLOG_TST`.
- App ID arrays always ordered **admin first, then public**:
  DEV `402 401`; UAT/PRD/TST `102 101`.
- Release ZIP names keep `-latest` inside the versioned candidate directory:
  `blog-administration-latest.sql`, `blog-public-pages-latest.sql`,
  `apex-blog-latest.zip`, `apex-blog-stack-latest.zip`.
- Config precedence in `automation/variables.sh`: ignored
  `automation/variables.local.sh` (sourced last, wins) > exported
  `APEX_BLOG_*` env vars at source time > defaults. Assign effective shell
  variables (e.g. `devDbConnName`) directly in the local file.
- Upgrade-test download URL override: `APEX_BLOG_UPGRADE_DOWNLOAD_URL`.

## Test strategy

- `make test` / `make check` are **offline only**; they never connect to a
  database and mock tests never prove a real install/compile/deploy works.
- Offline safety tests cover: schema manifests/ordering, metadata/deinstall
  inventory, preserved static/binary parity, candidate locks and rollback,
  environment boundaries, hotfix options, safe command sequencing, and one CI
  contract test that the public workflow cannot deploy.
- Real acceptance = TEST-schema upgrade/install/deinstall runs only.
