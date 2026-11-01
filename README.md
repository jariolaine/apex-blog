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

## Developer quality checks

The repository uses shared local pre-commit hooks and GitHub Actions for
CSS/LESS, JavaScript, SQL, Bash, Python, Markdown, Terraform and APEXLang checks.
Run `make setup-ci` to set up repository-local lint tools and install the Git hook.
No global `pre-commit` installation or fixed Node.js major version is needed.
See [automation/ci/README.md](automation/ci/README.md) for details.

`make sync-dev` and `make qa` always execute the complete local preflight
before performing their database operations. Emergency QA/UAT-to-production
hotfix exports remain separate (see [HOTFIX.md](automation/HOTFIX.md)).
