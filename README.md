# APEX Blog

Blog application built with Oracle APEX. It consists of two APEX applications
that share one database schema (the APEX parsing schema):

- **Blog Public Pages** — the reader-facing blog: posts with categories, tags
  and archives, full-text search, comments, links, and a file repository.
- **Blog Administration** — manage posts, comments, links, files, and settings,
  and view activity reports. Optional integrations include Google
  authentication and generative AI.

## Install

### System requirements

- Oracle Database 19c or later
- Oracle APEX 26.1 or later
- An APEX workspace administrator account for creating and managing the user
  group used for application authorization

The parsing schema that will own the blog objects needs these system
privileges and roles:

- `CREATE INDEXTYPE`
- `CREATE PROCEDURE`
- `CREATE SEQUENCE`
- `CREATE TABLE`
- `CREATE TRIGGER`
- `CREATE VIEW`
- `CTXAPP` (Oracle Text)

### Import the applications

1. Download the
   [latest release ZIP](https://github.com/jariolaine/apex-blog/releases/latest/download/apex-blog-latest.zip)
   and extract it.
2. In the target APEX workspace, open **App Builder**.
3. Import `blog-administration-latest.sql` and choose to **install Supporting
   Objects** when prompted.
4. Import `blog-public-pages-latest.sql` and again choose to **install
   Supporting Objects**.

The import order matters: Blog Administration first, then Blog Public Pages.
Both applications create their database objects in the same parsing schema.

### After installation

1. Create an APEX workspace user group named **Bloggers** and add the users
   who are authorized to administer the blog. See Oracle's
   [Using Groups to Manage Oracle APEX Users](https://docs.oracle.com/en/database/oracle/apex/26.1/aeadm/managing-users-in-a-workspace.html#GUID-0FD7B406-8A83-40C0-A3E7-EF19BBDEA5A4).
2. Sign in to **Blog Administration** with a user who belongs to the Bloggers
   group.

## Upgrade

Direct upgrades are supported from application version **24.1.0.20240714 or
later**. You can see the installed version on the *About This Application*
page of Blog Administration. If your version is older, download the older
release ZIPs from the GitHub
[releases page](https://github.com/jariolaine/apex-blog/releases) and upgrade
one version at a time until you reach a directly supported version.

Before upgrading:

- Back up the parsing schema's data and objects (for example, a Data Pump
  export) so you can roll back.
- Read the release notes of every version newer than your installed version;
  some releases include required schema or data changes.

Then extract the new release ZIP and import the two SQL exports in the same
order as in a fresh install — Blog Administration, then Blog Public Pages —
choosing to **upgrade Supporting Objects** for each. Verify both applications
and their data afterward.

## Support

Found an issue or have an idea? Open it at
[GitHub issues](https://github.com/jariolaine/apex-blog/issues).

## License

Released under the [MIT license](LICENSE.txt) by Jari Laine.
