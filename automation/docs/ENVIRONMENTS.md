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
Previous-release upgrade baselines always come from the official GitHub
releases tagged on `master`; see [development flow](DEVELOPMENT_FLOW.md).
Local ZIP and download URL overrides are intentionally unsupported.

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
SQLcl/database access process. When using the optional containerized
ADB-S wallet, follow the [external wallet and CA instructions](MCP_AUTOMATION.md#optional-adb-s-wallet-and-private-root-ca-certificates); saved
connection names and authorization rules do not change. `make doctor` checks that SQLcl exists; it does
**not** verify connections, schemas, workspaces or permissions.

## Which environments are modified?

See [development flow](DEVELOPMENT_FLOW.md) for the actual command sequence.
The key environment boundaries are:

- **DEV:** `make source` reads APEXLang; `make sync-dev` overwrites DEV app
  definitions after authorization; `make build` changes DEV application
  versions but never automatically imports APEXLang from Git.
- **TEST:** `make pretest` exports SQL from DEV to disposable TEST; an optional
  `TEST=install|upgrade|deinstall` selects one stage (default all). `make build`
  and `make test-release` run **all** candidate TEST acceptance stages.
  TEST resets are preauthorized only for the configured dedicated schema.
- **QA/UAT:** `make qa` checks source fingerprint and uses the verified candidate;
  `make hotfix-export` only reads QA/UAT application definitions.
- **PROD:** `make production` promotes the same approved candidate;
  `make hotfix-production` performs the separately authorized emergency path.

**STAGING is not implemented.** There is no `stgDbConnName`,
`make staging` or `deploy.sh stg` path. Do not add an imagined staging step to
release instructions. The Terraform stack is legacy and is not changed by this
review; see [Stack README](../../Stack/README.md) for its separate context.

For the operational sequence, see [development flow](DEVELOPMENT_FLOW.md).
