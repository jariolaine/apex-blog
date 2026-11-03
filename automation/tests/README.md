# APEX Blog automation tests

This directory tests **APEX Blog-specific release invariants**, not the behavior
of generic CI tools or a reusable automation framework. The small Python suite
protects risks that static validation or ordinary live installation cannot
safely exercise:

- Schema manifests, generated SQL ordering, metadata and deinstall inventory.
- Preservation of Git-owned Supporting Objects and binary/static files.
- Candidate publication locks, rollback on failure, and safe handling of paths.
- Release integrity, environment boundaries and production hotfix options.
- Install/upgrade/deinstall *command sequencing* and stopping before unsafe
  database calls when prerequisites fail.

Workflow tests use `mock_sqlcl.py` as a **command recorder and response stub**.
They do not emulate Oracle, check PL/SQL compilation, or verify that a database
is empty after deinstallation. They must not be reported as database tests.

## What to run

From the repository root:

```bash
make test-fast     # Schema, metadata and source parity checks
make test          # All focused offline safety tests
make check         # Actual linters + offline safety tests + APEXLang validator
```

CI integration is verified by running the real lint, ShellCheck, actionlint,
Ruff, schema/source checks and SQLcl APEXLang validation. There are no Python
regression suites for npm bootstrap, Make wrappers around pre-commit, or
Terraform implementation. A single CI test protects the public workflow from
acquiring deployment permissions or invoking deployment commands.

Before releasing, run **real Oracle acceptance** against an approved, disposable
TEST schema:

```bash
make candidate
make test-release CONFIRM=YES PREVIOUS_ZIP=/path/to/older-release.zip
```

The latter executes upgrade, fresh install and deinstall, then verifies the
absence of user objects and APEX applications. This command resets TEST and
must never use DEV, QA or production connections. If a valid older release is
unavailable, run `make test-deinstall` and record upgrade testing as incomplete.

Keep new offline tests for **distinct failure modes affecting this application**.
Do not create tests solely to pin exact log messages, Make spelling, tool
versions or GitHub Actions YAML layout. Legacy Terraform stays outside this
refactor.
