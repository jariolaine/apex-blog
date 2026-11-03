# Environments and connections

The supported automation targets are **DEV**, **disposable TEST**, **QA/UAT**
and **PROD**. Their defaults come from
[`automation/variables.sh`](../variables.sh). Both applications are processed
in order: **Admin**, then **Public**.

| Environment | Saved SQLcl connection (default) | Schema / workspace (default) | App IDs (Admin, Public) | Use |
| --- | --- | --- | --- | --- |
| DEV | `blog_dev` | `BLOG_DEV` | 402, 401 | APEXLang export; version preparation; explicit source import |
| TEST | `blog_tst` | `BLOG_TST` | 102, 101 | **Disposable** installation, upgrade and deinstallation checks |
| QA/UAT | `blog_uat` | `BLOG_UAT` | 102, 101 | Verified release deployment and emergency source exports |
| PROD | `blog_prd` | `BLOG_PRD` | 102, 101 | Approved promotion or emergency imports |

`automation/variables.sh` exposes connection-name environment overrides:
`APEX_BLOG_DEV_CONNECTION`, `APEX_BLOG_TST_CONNECTION`,
`APEX_BLOG_UAT_CONNECTION`, and `APEX_BLOG_PRD_CONNECTION`.
`APEX_BLOG_UPGRADE_DOWNLOAD_URL` overrides the previous-release ZIP download
URL used by TEST upgrade checks.

## Local configuration

The scripts first set defaults using environment variables and then **source**
the ignored `automation/variables.local.sh`, if it exists. Therefore the
precedence of *effective shell variables* is:

1. Assignments in `variables.local.sh`, when present (evaluated last).
2. Exported `APEX_BLOG_*` values at the time `variables.sh` is sourced.
3. Defaults in `variables.sh`.

Example of an effective local override:

```bash
# automation/variables.local.sh (ignored by Git)
devDbConnName='my-dev-saved-connection'
tstDbConnName='my-disposable-test-connection'
```

Alternatively, export `APEX_BLOG_DEV_CONNECTION` **before** running `make`
and leave `devDbConnName` unset in the local override file. Merely assigning
`APEX_BLOG_DEV_CONNECTION` inside `variables.local.sh` is **too late** to
change an already initialized `devDbConnName`; set the shell variable directly
there instead. Never commit passwords, wallets, personal connection strings or
`variables.local.sh`.

These values are **saved SQLcl connection names**, not database URLs.
Configure and test each SQLcl connection through your organization's approved
SQLcl/database access process. `make doctor` checks that SQLcl exists; it does
**not** verify connections, schemas, workspaces or permissions.

## Which environments are modified?

- **DEV:** `make source` reads the two applications and refreshes local APEXLang.
  `make prepare-release CONFIRM=YES` changes DEV application versions;
  `make sync-dev` overwrites DEV application definitions. Both mutations
  require explicit approval. `make build` reads DEV but does not change it.
- **TEST:** `make test-release CONFIRM=YES PREVIOUS_ZIP=...` sequentially
  tests upgrade, then fresh installation and verified deinstallation. It
  resets the approved disposable TEST schema and leaves it empty on success.
  `make test-install` resets the schema, removes prior test apps,
  then installs a release. `make test-upgrade` resets TEST and installs an older
  release before upgrading. `make test-deinstall` runs a fresh install **first**,
  removes Supporting Objects and both applications, and verifies **zero**
  `USER_OBJECTS` plus absence of both APEX apps. These are destructive.
- **QA/UAT:** `make qa` enforces preflight and verifies both the release and
  candidate/source fingerprint before importing. `make hotfix-export` reads
  QA/UAT without creating a normal candidate.
- **PROD:** `make production CONFIRM=YES` deploys the previously verified
  candidate, without rebuilding. `make hotfix-production CONFIRM=YES` imports saved QA/UAT
  exports directly and deliberately skips normal quality/release gates.
  Supporting Objects are installed by default; `OBJECTS=NO` disables their
  **automatic** installation.

## Release flow

```text
Git-owned schema, metadata and APEXLang ↔ DEV (reviewed source synchronization)
                     │
          make candidate (checks, DEV export, verify)
                     │
       build/releases/<version>/ (checksummed candidate)
                     │
       TEST install / upgrade / deinstall acceptance
                     │
           QA/UAT (same candidate)
                     │
          PROD (same candidate)
```

TEST/QA/PROD install the **packaged SQL application exports** from the
selected candidate directory, not a fresh export from DEV. Neither
`make test` nor `make check` executes these Oracle installation checks.

**STAGING is not implemented.** There is no `stgDbConnName`,
`make staging` or `deploy.sh stg` path. Do not add an imagined staging step to
release instructions. The Terraform stack is legacy and is not changed by this
review; see [Stack README](../../Stack/README.md) for its separate context.

For the operational sequence, see the [runbook](RUNBOOK.md).
