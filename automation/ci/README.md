# Repository quality gate

Local commits, GitHub Actions, normal DEV synchronization and QA/UAT promotion
share the same checks. The lint/test/validate commands do not connect to Oracle.

## Set up once on Linux

Use your **installed** `python3`, `node` and `npm`. The repository does not
require an exact Node.js or Python version, and does not require a globally
installed `pre-commit`. You still need versions compatible with the upstream
lint tools; **no software can work with every past/future runtime version**.

Install Python's `venv` module if needed (Ubuntu: `sudo apt install
python3-venv`), plus Git, curl, ShellCheck, Terraform, and Oracle SQLcl with a
supported Java runtime for APEXLang validation.

```bash
make doctor             # Read-only diagnostics; missing setup is expected at first
make setup CONFIRM=YES  # Local CI tooling + compile BUILD_API in DEV
make check              # Lint + complete tests + SQLcl APEXLang validation
```

`make setup CONFIRM=YES` is the **single setup entry point**. It first runs
`make setup-ci`, then `make setup-build-api` **sequentially** and stops if
either fails. The second step connects to the saved DEV SQLcl connection,
verifies the expected workspace/schema, and compiles `BUILD_API` in DEV. It
never targets QA or production. Run it only with approval to modify DEV and
with a correctly configured connection. Do **not** use this target in GitHub
Actions, where database credentials are intentionally absent. For local
lint/test tooling **without Oracle access**, run only `make setup-ci`; for
recompilation of the package alone, use `make setup-build-api`.

`make doctor` checks installed commands, the local virtual environment,
pre-commit hook and necessary setup files. It reads no connection secrets,
never executes SQLcl and cannot prove database access or package validity.
It exits nonzero when required local setup is missing.

`make setup-ci` creates an ignored `.venv/`, uses `python3` from your PATH to
install Python tools into it, runs npm using the existing Node.js installation,
installs **actionlint 1.7.12** from a SHA-256-verified upstream release, and
registers the Git pre-commit hook. The actionlint executable lives under
`.venv/bin/`, and requires neither a Go compiler nor Docker. It supports Linux
(x86_64/arm64) and macOS (x86_64/arm64). Updating actionlint requires changing
the version and verified release digests in `automation/ci/install_actionlint.sh`.
You need neither `nvm use 22` nor
`pipx` nor a global `pre-commit` installation.

The package has **no Node engine upper bound** and uses semver-compatible npm
dev-dependency ranges. Python tools also use lower-bound ranges instead of
exact version pins. The upstream tools still determine the runtime versions
they support; see any npm/Python resolver errors for actual compatibility
requirements. On Node.js 25, the local bootstrap does not reject the version.

Locally, npm updates `package-lock.json` as required. **Commit the generated
lockfile together with changes to `package.json`** to keep resolved tool
versions reproducible. CI uses `npm ci` when a lockfile is present, and uses
`npm install` until the lockfile is committed. An exact lockfile is compatible
with using different supported Node runtime versions.

Bootstrap disables automatic npm audit for setup speed only. It does **not**
make any security claim. Run `npm audit` or `npm run audit:tools`, review the
reported dependencies, and avoid `npm audit fix --force` without reviewing
breaking changes.

The first pre-commit run downloads generic hook environments. For SQLcl on
PATH under a different name, use `SQLCL_BIN`. SQLcl validation requires no
Oracle connection; however **Oracle SQLcl requires a supported Java version**.

## Commands

```bash
make doctor             # Read-only local environment diagnostics (no database)
make setup CONFIRM=YES  # One command: local tools, then DEV BUILD_API compilation
make setup-ci           # Local tools and Git hook only (no database)
make setup-build-api    # Explicit DEV BUILD_API compilation only
make lint               # All configured linters against all tracked files
make test-fast          # Short regression + CI/permissions checks (also in Git hooks)
make test               # Complete mocked automation suite
make validate           # SQLcl APEXLang validation (no database)
make check              # Alias for make preflight (lint + full tests + validate)
make release-check      # Strict release source + built candidate integrity checks
```

`make release-check` requires an existing built release candidate (use
`RELEASE_DIR=...` to select one). It is read-only and does not build, deploy,
or claim the candidate matches the current working-source fingerprint;
normal QA promotion performs that additional check.

A regular commit runs the applicable pre-commit hooks. GitHub Actions runs
`make ci` (`make preflight`) on push and pull requests. Its Python version is
the current stable Python 3, Node is the current LTS, Terraform is the latest
compatible distribution, and SQLcl is downloaded from Oracle's latest URL.
The Java runtime is selected from Oracle's supported versions; this is an
**actual SQLcl compatibility requirement**, not a Node-specific project pin.

**Normal DEV synchronization and QA promotion always execute preflight** in
the underlying scripts, including direct calls to `import_apps_to_dev.sh`
and `deploy.sh qa`. Failures stop before any SQLcl database connection.
There is no bypass flag. Emergency `make hotfix-export` and
`make hotfix-production` intentionally remain outside these gates.

## Lint scope

- ESLint and `node --check`: hand-maintained JavaScript (`.min.js` excluded).
- Stylelint: LESS and nonminified CSS; generated CSS is not rewritten.
- Markdownlint: repository documentation.
- Prettier: GitHub workflow YAML and `package.json`, not bulk source reformat.
- actionlint: GitHub Actions workflow syntax, expressions, and embedded shell.
- ShellCheck and `bash -n`: Bash scripts.
- Ruff: Python correctness checks.
- SQL source hygiene and conservative SQLFluff Oracle checks on views.
- Terraform `fmt` locally; `init -backend=false` and `validate` in CI.
- Pre-commit: merge conflicts, large files, JSON/YAML syntax, private keys.

## Notes

CI's use of moving LTS/tool versions trades some reproducibility for fewer
manually maintained version settings. Review any future upstream-breaking
changes and pin an affected tool *only when necessary*. `package-lock.json`
reduces npm drift without enforcing a specific Node.js version.

GitHub branch protection must mark the quality job as required; workflow YAML
alone does not enforce branch protection. The mocked regression suite does not
replace real fresh-install/upgrade tests on disposable Oracle instances.

## GitHub Actions reliability and branch protection

The `quality` job uses the same lint, full regression tests, and APEXLang
validation as local preflight. `setup-node` and `setup-python` cache npm and pip
downloads using committed dependency files; the caches do **not** include
`node_modules` or a Python virtual environment. Superseded push/PR checks for
the same branch are cancelled. When a job fails, GitHub uploads the available
quality and Terraform logs as a short-lived `quality-failure-logs` artifact.
The workflow has only `contents: read` permissions and no deployment secrets.

After the first successful push/PR run, configure GitHub under **Settings ->
Rules -> Rulesets** (or **Branches** in older interfaces): protect your default
branch and require the `quality` status check before merging. Use GitHub's
status-check picker to select the check actually reported by the workflow.
A workflow file cannot itself enable branch protection; repository admins must
configure it. If direct pushes must also be blocked, configure the ruleset to
enforce that policy for the appropriate actors.

Keep normal DEV/QA preflight mandatory in the scripts. The independent QA/UAT
-> production emergency hotfix commands are intentionally outside these gates.
