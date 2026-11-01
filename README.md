# APEX Blog

![Oracle_Database 19c](https://img.shields.io/badge/Oracle_Database-19c-red)
![Oracle Application Express 26.1](https://img.shields.io/badge/APEX-26.1-blue)

Blog application built with Oracle Application Express (APEX).

## Install

### System Requirements

* Oracle database version 19c or later
* Oracle Application Express version 26.1 or later

### Needed Privileges

Ensure target schema associated to your APEX workspace has following system
privileges and roles:

- CREATE INDEXTYPE
- CREATE PROCEDURE
- CREATE SEQUENCE
- CREATE TABLE
- CREATE TRIGGER
- CREATE VIEW
- CTXAPP

APEX workspace administrator privileges are required to create a user group for
authorization.

### Download

Download [latest version](https://github.com/jariolaine/apex-blog/releases/latest/download/apex-blog-latest.zip)
and extract zip archive.

### Import Applications

1. Access your target APEX workspace
2. Select the Application Builder
3. Import and install *blog-administration-latest.sql* and select install
  supporting objects.
4. Import and install *blog-public-pages-latest.sql* and select install
  supporting objects.

### Post Install

Create a workspace user group named "Bloggers". Add APEX users to the group who
are authorized to use the blog admin application.

See how to create a workspace group in the APEX documentation
[*Using Groups to Manage Application Express Users*](https://docs.oracle.com/en/database/oracle/apex/26.1/aeadm/managing-users-in-a-workspace.html#GUID-0FD7B406-8A83-40C0-A3E7-EF19BBDEA5A4).

## Upgrade

Existing application version must be Release v22.2.1.20230117 or later.

Before starting the upgrade, backup the application parsing schema data and
objects.

### Import Applications

1. Access your target APEX workspace
2. Select the Application Builder
3. Import and install *blog-administration-latest.sql* and select upgrade
   supporting objects.
4. Import and install *blog-public-pages-latest.sql* and select upgrade
   supporting objects.

## License

This code is released under [MIT license](LICENSE.txt) by Jari Laine.

## Development and automation

The repository stores APEX applications as APEXLang in `applications/`, while
release downloads contain full SQL application exports with Supporting Objects.
Use `make help` to see build, validation, test and deployment commands.
Contributors and coding agents should follow [AGENT.md](AGENT.md) before
changing or running the automation. See [release candidates](automation/RELEASE_CANDIDATES.md)
for source consistency checks, protected versioned release artifacts, and
`make build OVERWRITE=YES` for safe replacement of an unpromoted local candidate.
For application-only emergency promotion from QA/UAT to production, see
[the hotfix workflow](automation/HOTFIX.md). It bypasses the normal release build.

The mock regression tests can be run with:

```bash
python3 -m unittest discover -s automation/tests -v
```

## Git-owned database schema assembly

All application PL/SQL packages are split into `Database/Packages/*.pks` and
`*.pkb`. The explicit `automation/schema/install.list` and `upgrade.list`
manifest files define the SQL input order, including package specs and bodies.
The **install** manifest must include every `Database/` SQL source except
`Database/Views/BLOG_V_VERSION.sql` (installed separately by the Public app).
Upgrade inputs are deliberately narrower than fresh-install inputs; review
migration requirements separately instead of automatically including every DDL
file in an upgrade. Foreign keys and their indexes come directly from
`Database/Tables/foreign_keys.sql` and `Database/Indexes/foreign_key_indexes.sql`.

Run `make check-schema` to validate the manifests and the checked-in deinstall
script locally without Oracle access. The authoritative uninstall SQL is
`applications/blog-admin/supporting-objects/deinstall-script.sql`: update it
when schema objects, foreign keys or Oracle Text preferences change. The check
compares DROP statements to the installation inventory and repository SQL.
Run `make supporting` to assemble tracked schema SQL into Supporting Objects
and export **metadata only** from DEV through `BUILD_API`. It does not generate
or overwrite the deinstall SQL or foreign-key/index source files. Review the
generated SQL diff and run fresh-install, upgrade and deinstall tests before
making a release.

## Developer quality checks

The repository uses shared local pre-commit hooks and GitHub Actions for
CSS/LESS, JavaScript, SQL, Bash, Python, Markdown, Terraform and APEXLang checks.
For a new Git checkout, `make doctor` checks local prerequisites without changing
anything or connecting to Oracle. To configure both local lint tooling and the
DEV database's `BUILD_API` package, run **`make setup CONFIRM=YES`**. This is
one command, but it **modifies DEV** after installing the local Git hook, so
confirm the saved DEV SQLcl connection and schema first. To install only local
tools with no database change, use `make setup-ci`; to compile only the DEV
package, use `make setup-build-api`. Use `make check` for the local quality gate.
No global `pre-commit` installation or fixed Node.js major version is needed.
See [automation/ci/README.md](automation/ci/README.md) for details.

To verify removal as well as installation, run `make test-deinstall` after
building a release candidate. This **destructively resets the disposable TEST
schema**: it first runs `make test-install`, then executes the tracked
Supporting Objects deinstall script, removes both TEST applications, and
fails unless the TEST schema contains **zero `USER_OBJECTS`** and neither
application remains. `RELEASE_DIR=...` selects the same candidate for the
fresh-install prerequisite. This must not be run on DEV/QA/production.

`make sync-dev` and `make qa` always execute the complete local preflight
before performing their database operations. Emergency QA/UAT-to-production
hotfix exports remain separate (see [HOTFIX.md](automation/HOTFIX.md)).
