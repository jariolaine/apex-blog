# Repository quality gate

Local commits, GitHub Actions, normal DEV synchronization and QA/UAT promotion
share the same checks. The lint/test/validate commands do not connect to Oracle.

## Set up once on Linux

Use your **installed** `python3`, `node` and `npm`. The repository does not
require an exact Node.js or Python version, and does not require a globally
installed `pre-commit`. You still need versions compatible with the upstream
lint tools; **no software can work with every past/future runtime version**.

Install Python's `venv` module if needed (Ubuntu: `sudo apt install
python3-venv`), plus Git, ShellCheck, Terraform, and Oracle SQLcl with a
supported Java runtime for APEXLang validation.

```bash
make setup-ci
make lint
make test
make validate
```

`make setup-ci` creates an ignored `.venv/`, uses `python3` from your PATH to
install Python tools into it, runs npm using the existing Node.js installation,
and registers the Git pre-commit hook. You need neither `nvm use 22` nor
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
make setup-ci      # Install tools and hook into local .venv
make lint          # All configured linters against all tracked files
make test-fast     # Short regression subset (also run in Git hooks)
make test          # Complete mocked automation suite
make validate      # SQLcl APEXLang validation (no database)
make preflight     # Lint + full tests + validate
```

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
