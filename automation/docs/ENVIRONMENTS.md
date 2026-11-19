# Environments and connections

The supported automation targets are **DEV**, **disposable TEST**, **QA/UAT**
and **PROD**. Their defaults come from
[`automation/variables.sh`](../variables.sh). Both applications are processed
in order: **Admin**, then **Public**.

The [maintenance guide](MAINTENANCE.md#roles-and-task-boundaries) assigns
configuration to the developer. Configured names and mappings are authoritative
for application coding agents; the scripts perform their own automatic
environment guards. Task authorization and the disposable TEST policy are
defined in the [environment policy](MAINTENANCE.md#application-data-and-environment-policy).

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
During setup, the developer configures and tests each connection through the
organization's approved SQLcl/database access process. When using the optional
containerized ADB-S wallet, follow the
[external wallet and CA instructions](MCP_AUTOMATION.md#optional-adb-s-wallet-and-private-root-ca-certificates).
Saved connection names and authorization rules do not change. `make doctor`
checks that SQLcl exists; it does **not** verify connections, schemas,
workspaces or permissions.

## Which environments are modified?

See [development flow](DEVELOPMENT_FLOW.md) for the actual command sequence.
The key environment boundaries are:

- **DEV:** `make source` reads APEXLang; `make sync-dev` overwrites DEV app
  and Supporting Objects definitions under task authorization, without
  executing Supporting Objects SQL. `make build` changes both DEV application
  versions and live `BLOG_SETTINGS.G_APP_VERSION`, but never automatically
  imports APEXLang from Git. Applying database SQL and compiling PL/SQL is
  separate; see [development flow](DEVELOPMENT_FLOW.md#from-source-changes-to-promotion).
- **TEST:** `make pretest` exports SQL from DEV to disposable TEST; an optional
  `TEST=install|upgrade|deinstall` selects one stage (default all). `make build`
  and `make test-release` run **all** candidate TEST acceptance stages.
  Resets of the configured disposable TEST environment are preauthorized;
  this applies to automation, SQLcl and SQLcl MCP under the environment policy.
- **QA/UAT:** `make qa` checks source fingerprint and uses the verified candidate;
  `make hotfix-export` only reads QA/UAT application definitions.
- **PROD:** `make production` promotes the same approved candidate;
  `make hotfix-production` performs the emergency path under explicit
  production authorization for that task.

**STAGING is not implemented.** There is no `stgDbConnName`,
`make staging` or `deploy.sh stg` path. Do not add an imagined staging step to
release instructions. The Terraform stack is legacy and is not changed by this
review; see [Stack README](../../Stack/README.md) for its separate context.

For the operational sequence, see [development flow](DEVELOPMENT_FLOW.md).
