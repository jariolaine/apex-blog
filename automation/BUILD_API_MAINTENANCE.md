# BUILD_API and APEX Blog release maintenance

This patch implements **phases 1 and 2** of the BUILD_API review. It is
intentionally incremental: the APEXLang applications and full SQL/Supporting
Objects releases remain the deployment format. `make qa`, `make production`,
installation tests, and historical upgrade patches continue to use full SQL
application exports from the same release candidate.

## Ownership

| Artifact or state | Authoritative owner |
|---|---|
| `VERSION.txt`, `README.md`, `LICENSE.txt` | Git repository |
| `automation/templates/postupgrade.sql.in` | Git repository |
| Admin/Public Supporting Objects SQL | Generated from BUILD_API + source DDL + Git template |
| APEXLang `.apx` source | Git; deliberately synchronized with DEV |
| Application static assets (CSS, JS, PNG, etc.) | Git; preserved on source export, synchronized explicitly into DEV |
| Release ZIP / SQL exports | `make build`, then promote unchanged |
| DEV APEX application versions | Explicit `make prepare-release CONFIRM=YES` |
| DEV `BLOG_SETTINGS.G_APP_VERSION` | Explicit `make prepare-release CONFIRM=YES` |

Do not run `build_api.export_readme`, `.export_license`, `.export_version`,
`.export_manifest`, or `.export_postupgrade` to publish release files. These
legacy public procedures remain in the package for manual callers. Their old
`BUILD_SETTINGS` rows also remain for compatibility, but are ignored by the
normal build. The new SQL metadata exporter takes **`p_release_version`**.

## When changing the package

1. Verify the DEV connection, workspace, schema, and application IDs in
   `automation/variables.sh` / ignored `automation/variables.local.sh`.
2. After updating the checked-in `automation/database/BUILD_API.sql`, run
   `make setup-build-api`. This **compiles the package in DEV** and fails if
   either the specification or body remains invalid. This is intentionally
   not part of the read-only `make supporting` command.
3. Edit `VERSION.txt` when preparing a release. Keep the `Release ... .YYYYMMDD`
   format because current versioned upgrade predicates depend on that suffix.
4. Run `make prepare-release CONFIRM=YES` if you want the two DEV APEX
   applications and DEV setting updated to that version. This command changes
   DEV. It is separate from file generation and should be reviewed first.
5. Run `make supporting`, inspect the changes, then `make source`,
   `make validate`, `make sync-dev` after reviewing the source, and `make build`.
   Build checks the versions of both DEV apps and the DEV setting; it rejects
   mismatches rather than silently generating a different candidate.
6. Test fresh install and upgrade, then promote **the same** exported SQL
   files through QA and production before publishing the GitHub release.

### Direct BUILD_API use

The new signature is:

```sql
exec build_api.export_metadata(
  p_application => 'PUBLIC',
  p_release_version => 'Release 26.1.5.20261025');
```

`export_settings` uses the same second argument. Both are **read-only**.
The package no longer changes DEV application versions or blog settings when
spooling metadata. The legacy `get_app_version` function now reports the
installed `BLOG_SETTINGS.G_APP_VERSION` rather than creating a date-based
version. The normal build never calls it.

### Circular dependencies in BUILD_API object lists

`EXPORT_OBJECT_LIST` and `EXPORT_UPGRADE_LIST` now share one private
`WRITE_OBJECT_LIST` procedure. The query limits dependency edges to the objects
selected for the particular export and matches **both names and object types**.
`CONNECT BY NOCYCLE` prevents `ORA-01436` for cyclic dependencies. A final
left join to the complete candidate list ensures that even disconnected cycles
are not silently omitted.

There is no topological ordering that can satisfy every edge in a cycle. Objects
with no root-reachable depth receive a stable fallback order by type and name.
The existing installer still emits package specifications before package bodies,
and its views use `CREATE OR REPLACE FORCE VIEW`. **Do not treat successful
list generation as proof of a valid installation**: compile BUILD_API and run
fresh-install and upgrade tests in a disposable Oracle schema. Check invalid
objects after installation and review any unexpected dependency cycles.

After changing this package, run:

```bash
make setup-build-api   # modifies DEV; review the package first
make supporting
make test-install      # destructive; disposable TEST schema only
```

### What has *not* changed

- Object-list ordering still comes from the database-driven dependency graph.
  Cycles are handled by `NOCYCLE` and a candidate-list fallback, but cyclic
  objects cannot be strictly topologically ordered. A deterministic Git object
  inventory is a separate migration.
- The deinstaller still discovers `BLOG%` objects in DEV. Do **not** execute it
  on shared/non-disposable schemas without carefully reviewing its output.
  Replacing it with a repository-owned inventory is a later, behavioral change.
- Structural schema upgrades and historic patches still require installation
  and upgrade testing, including multi-column index behavior and package
  compilation. This patch does not introduce generic DDL migrations.
- `BUILD_SETTINGS.sql` retains the old README/license/manifest/postupdate
  values for compatibility. The `G_APP_VERSION` build setting is now documented
  as `BUILD_PARAMETER`; the new export code ignores any installed legacy
  expression for this specific attribute.

## Validation and rollout

```bash
python3 -m unittest discover -s automation/tests -v
bash -n automation/*.sh
make setup-build-api
make prepare-release CONFIRM=YES  # intentionally updates DEV
make supporting
make source
make validate
make sync-dev                      # after reviewing local APEXLang diff
make build                         # requires DEV versions to match VERSION.txt
make test-install
make test-upgrade PREVIOUS_ZIP=/path/to/previous-release.zip
```

The unit tests mock SQLcl: they check orchestration and generated text, not
Oracle PL/SQL compilation or upgrade execution. The live DEV/test steps above
are required before deploying QA or production.
