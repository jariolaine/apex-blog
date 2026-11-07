# APEX Blog

Blog application built with Oracle APEX.

## Install

### System requirements

- Oracle Database 19c or later
- Oracle Application Express 26.1 or later

The target parsing schema needs these privileges and roles:

- `CREATE INDEXTYPE`
- `CREATE PROCEDURE`
- `CREATE SEQUENCE`
- `CREATE TABLE`
- `CREATE TRIGGER`
- `CREATE VIEW`
- `CTXAPP`

APEX workspace administrator permissions are required to create the Bloggers
user group for application authorization.

### Download and import

Once a public release is available, download the
[latest release ZIP](https://github.com/jariolaine/apex-blog/releases/latest/download/apex-blog-latest.zip)
and extract it. In the target APEX workspace, open Application Builder and
import the included full SQL exports **in this order**:

1. `blog-administration-latest.sql` — choose **install Supporting Objects**.
2. `blog-public-pages-latest.sql` — choose **install Supporting Objects**.

After installation, create an APEX workspace user group named **Bloggers** and
add users authorized to administer the blog. See Oracle's
[Using Groups to Manage Application Express Users](https://docs.oracle.com/en/database/oracle/apex/26.1/aeadm/managing-users-in-a-workspace.html#GUID-0FD7B406-8A83-40C0-A3E7-EF19BBDEA5A4).

## Upgrade

Upgrades require an existing application version of **Release
v22.2.1.20230117 or later**. Back up the application parsing schema's **data
and objects** before upgrading, and review any schema/data migrations for
your installed version.

In the target APEX workspace, import the two files from the new release ZIP
in the same order: Admin then Public. Select **upgrade Supporting Objects**
for each import. Verify both applications and their data afterward.

## Development and automation

The source checkout tracks the APEX applications as **APEXLang** in
`applications/`, database SQL in `Database/`, and versioned release automation
under `automation/`. Development and CI commands are defined in `Makefile`.

For contributors working from the **source repository**, start with
[`automation/README.md`](automation/README.md) for the command
map and [`automation/docs/RUNBOOK.md`](automation/docs/RUNBOOK.md) for safe
operational steps. Coding agents should also read [`AGENT.md`](AGENT.md).
These source-only files are not included in the downloadable application ZIP;
the ZIP contains this README and the full installation exports.

## License

Released under the [MIT license](LICENSE.txt) by Jari Laine.
