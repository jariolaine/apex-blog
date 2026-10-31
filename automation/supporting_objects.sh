#!/usr/bin/env bash
# Generate repository-maintained Supporting Objects SQL from BUILD_API and DDL.
# Run this BEFORE refreshing/importing APEXlang in DEV and building an installer.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"
require_tool "$sqlcl_bin"
require_tool python3
require_tool rsync
release_version="$(read_release_version)"

run_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-objects.XXXXXXXX")"
trap 'rm -rf -- "$run_dir"' EXIT
mkdir -p -- "$run_dir/out" "$run_dir/logs"
check_environment "$devDbConnName" "$devWorkspace" "$devDbSchema" "$run_dir/logs/check-dev.log"

# Spool targets are unique per run and never overlap a previous invocation.
cat >"$run_dir/build.sqlcl" <<SQL
set heading off
set feedback off
set echo off
set trim on
set trimspool on
set pagesize 0
set long 1000000
set longchunksize 32000
set linesize 32000
set newpage none
set embedded on
set tab off
set serveroutput on size unlimited
spool "$run_dir/out/objects.list"
exec build_api.export_object_list;
spool off
spool "$run_dir/out/upgrade.list"
exec build_api.export_upgrade_list;
spool off
spool "$run_dir/out/foreign_keys.sql"
exec build_api.export_foreign_keys;
spool off
spool "$run_dir/out/foreign_key_indexes.sql"
exec build_api.export_indexes;
spool off
spool "$run_dir/out/admin_metadata.sql"
exec build_api.export_metadata(p_application => 'ADMIN', p_release_version => '$release_version');
spool off
spool "$run_dir/out/public_metadata.sql"
exec build_api.export_metadata(p_application => 'PUBLIC', p_release_version => '$release_version');
spool off
spool "$run_dir/out/deinstall.sql"
exec build_api.export_deinstall;
spool off
SQL
log 'Generating Supporting Objects using BUILD_API'
run_sqlcl "$devDbConnName" "$run_dir/logs/build-api.log" "$run_dir/build.sqlcl" \
    || die 'BUILD_API failed; no repository files updated'

for file in objects.list foreign_keys.sql foreign_key_indexes.sql admin_metadata.sql \
            public_metadata.sql deinstall.sql; do
    require_file "$run_dir/out/$file"
done
# Upgrade list may be empty (meaning there are no database objects to upgrade).
[[ -f "$run_dir/out/upgrade.list" ]] || die 'BUILD_API did not create upgrade.list'
render_release_template "$SCRIPT_DIR/templates/postupgrade.sql.in" \
    "$run_dir/out/postupgrade.sql" "$release_version"

python3 "$SCRIPT_DIR/lib/assemble_objects.py" \
    "$run_dir/out/objects.list" "$scriptSourceDir" "$run_dir/out/database-objects.sql" \
    --append "$run_dir/out/foreign_keys.sql" \
    --append "$run_dir/out/foreign_key_indexes.sql" || die 'Object installation assembly failed'
python3 "$SCRIPT_DIR/lib/assemble_objects.py" \
    "$run_dir/out/upgrade.list" "$scriptSourceDir" "$run_dir/out/database-objects-upgrade.sql" \
    --header $'-- Database objects upgrade\n-- --------------------------------------------------------\n' \
    || die 'Object upgrade assembly failed'

# Validate all files first, THEN synchronize: not halfway through generation.
source_files=(
    foreign_keys.sql foreign_key_indexes.sql database-objects.sql
    admin_metadata.sql public_metadata.sql postupgrade.sql deinstall.sql
    database-objects-upgrade.sql
)
target_files=(
    "${dbForeignKeysFile[1]}" "${dbIndexFile[1]}" "${dbObjectsFile[1]}"
    "${adminAppMetadataFile[1]}" "${publicAppMetadataFile[1]}"
    "${appPostupgradeFile[1]}" "${dbDeinstallFile[1]}"
    "${upgradeFile[1]}"
)
for file in "${source_files[@]}"; do require_file "$run_dir/out/$file"; done
require_file "${pubVwBlogVersion[0]}"
for i in "${!source_files[@]}"; do
    dest="${target_files[$i]}"
    mkdir -p -- "$(dirname -- "$dest")"
    rsync --checksum -- "$run_dir/out/${source_files[$i]}" "$dest"
done
rsync --checksum -- "${pubVwBlogVersion[0]}" "${pubVwBlogVersion[1]}"

log 'Supporting Objects updated in applications/*/supporting-objects'
log 'NEXT: refresh APEXlang source, review and import into DEV, then build'
