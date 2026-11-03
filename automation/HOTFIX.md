# QA/UAT -> production application hotfix

For routine automation setup, linting and commands, see the
[automation guide](README.md).

Use this when DEV/TEST runs a newer APEX version than production and the fix has
been made directly in the QA/UAT applications. QA/UAT exports must be compatible
with the production APEX release; **this workflow does not check versions**.

Run from the repository root:

```bash
make hotfix-export       # QA/UAT -> build/hotfix/f102.sql and f101.sql
make hotfix-production   # Import both apps + Supporting Objects (default)

# Only replace the applications; do not run Supporting Objects scripts:
make hotfix-production OBJECTS=NO
```

Application IDs are taken from `uatAppIds` and `prdAppIds` in
`automation/variables.sh` (or the ignored `automation/variables.local.sh`).
It uses `uatDbConnName` and `prdDbConnName` as SQLcl saved connections.

Both applications are processed in configuration order: Admin, then Public.
These are **normal, single-file SQL exports**, not APEXLang exports and not
packaged releases. The production step imports exactly the saved SQL files;
it does not export again or contact DEV or TEST.

Exports always include Supporting Objects. By default, production import sets
`APEX_APPLICATION_INSTALL.SET_AUTO_INSTALL_SUP_OBJ(TRUE)` for **both** apps.
The exported Supporting Objects installation/upgrade scripts can modify the
production schema and data. **Review those scripts and confirm they are safe to
run on production before importing.** This hotfix path does not check schema
migration compatibility.

Set `OBJECTS=NO` on `make hotfix-production` to set
`SET_AUTO_INSTALL_SUP_OBJ(FALSE)` for **both** imports. The SQL exports still
include Supporting Objects, but their automatic installation/upgrade scripts
are skipped. Direct script invocation supports
`automation/hotfix.sh production --skip-supporting-objects`.

No release validation, version check, checksum check, backup, or confirmation
is performed. This command **overwrites the production application definitions**
and, by default, may change database objects or data through Supporting Objects.
Explicitly obtain production approval and verify the saved SQLcl connection.
A new `make hotfix-export` replaces `build/hotfix/` with a new pair of exports.
SQLcl operation failures still stop the command; if the second production import
fails, the first application may already have been replaced.

The script does not update APEXLang, the Git repository, or the normal release
artifacts. Developers must separately carry the fixes into the application
source and the usual DEV/TEST/QA release workflow. Environment-specific APEX
settings may be overwritten by the imported application definitions.
