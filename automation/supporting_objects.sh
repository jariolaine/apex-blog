#!/usr/bin/env bash
# Assemble Supporting Objects from Git; no SQLcl, DEV connection, or build package.
# Run this BEFORE refreshing/importing APEXLang in DEV and building an installer.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"
require_tool python3
require_tool rsync
release_version="$(read_release_version)"

run_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-objects.XXXXXXXX")"
trap 'rm -rf -- "$run_dir"' EXIT
mkdir -p -- "$run_dir/out"
# Validate ALL Git-owned inputs before writing any tracked Supporting Objects.
python3 "$SCRIPT_DIR/lib/assemble_objects.py" \
    "$SCRIPT_DIR/schema/install.list" "$scriptSourceDir" "$run_dir/out/database-objects.sql" \
    --check-inventory || die 'Install schema manifest validation failed'
python3 "$SCRIPT_DIR/lib/assemble_objects.py" \
    "$SCRIPT_DIR/schema/upgrade.list" "$scriptSourceDir" "$run_dir/out/database-objects-upgrade.sql" \
    --header $'-- Database objects upgrade\n-- --------------------------------------------------------\n' \
    || die 'Upgrade schema manifest validation failed'
python3 "$SCRIPT_DIR/lib/check_deinstall.py" \
    "$SCRIPT_DIR/schema/install.list" "$scriptSourceDir" "$deinstallSqlScript" \
    || die 'Checked-in deinstall script is inconsistent with install.list'
# Metadata source and dynamic APEX installation IDs stay in Git. Only the
# G_APP_VERSION string literal is rendered from VERSION.txt into staging.
python3 "$SCRIPT_DIR/lib/metadata_source.py" render \
    --repo "$repoHome" --output "$run_dir/out/public_metadata.sql" \
    || die 'Git-owned metadata validation failed; no repository files updated'
require_file "$adminAppMetadataFile"
cp -- "$adminAppMetadataFile" "$run_dir/out/admin_metadata.sql"
render_release_template "$SCRIPT_DIR/templates/postupgrade.sql.in" \
    "$run_dir/out/postupgrade.sql" "$release_version"

source_files=(
    database-objects.sql
    admin_metadata.sql public_metadata.sql postupgrade.sql
    database-objects-upgrade.sql
)
target_files=(
    "$dbObjectsFile"
    "$adminAppMetadataFile" "$publicAppMetadataFile"
    "$appPostupgradeFile"
    "$upgradeFile"
)
for file in "${source_files[@]}"; do require_file "$run_dir/out/$file"; done
require_file "$pubVwBlogVersionSource"
for i in "${!source_files[@]}"; do
    dest="${target_files[$i]}"
    mkdir -p -- "$(dirname -- "$dest")"
    rsync --checksum -- "$run_dir/out/${source_files[$i]}" "$dest"
done
rsync --checksum -- "$pubVwBlogVersionSource" "$pubVwBlogVersionTarget"

log 'Supporting Objects updated from Git (no database access)'
log 'NEXT: refresh APEXLang source, review and import into DEV, then build'
