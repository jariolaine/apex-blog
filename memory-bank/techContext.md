# Tech Context

Technical reference for APEX Blog coding tasks. Use the repository's tool
configuration files for exact versions and current environment values.

## Source and toolchain

- Target Oracle **APEX 26.1**. Tracked application definitions use APEXLang
  (`.apx`) in `applications/blog/` (Public) and `applications/blog-admin/`
  (Admin).
- `automation/` uses Bash, Python 3.12 helpers and unit tests, and SQLcl for
  APEXLang validation and Oracle operations. Offline workflow tests use mock
  SQLcl. Static checks use ShellCheck, Ruff, and Node tools (ESLint,
  Stylelint, markdownlint and Prettier).
- `frontend/less/` contains LESS sources compiled and minified into application
  static assets. GitHub Actions performs validation and offline checks, not
  database deployment. Refer to `package.json`, `.pre-commit-config.yaml`, and
  `.github/workflows/ci.yml` for the exact checks.
