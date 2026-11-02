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

The repository keeps application source as APEXLang in `applications/` and
packages releases as full SQL exports with Supporting Objects. Contributors
and coding agents should read [AGENT.md](AGENT.md).

For local development, run:

```bash
make doctor         # Check local prerequisites (no database access)
make setup          # Install local tooling and Git hook (no database access)
make check          # Lint, full mocked tests and SQLcl APEXLang validation
make check-schema   # Verify manifests, metadata and deinstall SQL offline
make supporting     # Update tracked Supporting Objects from Git (offline)
```

`make supporting` modifies tracked SQL; review the diff before committing.
`make test-install`, `make test-upgrade` and `make test-deinstall` **reset the
disposable TEST schema** and require an approved TEST target.

Read the **[automation guide](automation/README.md)** for setup,
configuration, Make targets, schema manifests, CI and troubleshooting.
Normal releases use [versioned release candidates](automation/RELEASE_CANDIDATES.md);
emergency QA/UAT-to-production application changes use the separate
[hotfix procedure](automation/HOTFIX.md).
