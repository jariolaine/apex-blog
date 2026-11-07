#!/usr/bin/env bash
# Import repository APEXlang into DEV to synchronize Supporting
# Objects definitions before producing an installable SQL export.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"
(( $# == 0 )) || die 'Usage: import_apps_to_dev.sh (overwrites DEV applications)'
# Always validate before SQLcl or any DEV change, even if invoked directly.
"$SCRIPT_DIR/ci/preflight.sh"
# Keep the dev import independent of release-version preparation. Only local
# references and effective target IDs are checked here.
python3 "$SCRIPT_DIR/lib/check_source_consistency.py" \
    --repo "$repoHome" --dev-ids "${devAppIds[@]}" --mode source \
    || die 'Local APEXLang source consistency failed'
require_tool "$sqlcl_bin"
log_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-dev-import.XXXXXXXX")"
trap 'rm -rf -- "$log_dir"' EXIT
check_environment "$devDbConnName" "$devWorkspace" "$devDbSchema" "$log_dir/env.log"

# Check both applications BEFORE mutating either one.
for i in "${!devAppIds[@]}"; do
    alias="${appAliases[$i]}"
    app_dir="$apexSourceDir/$alias"
    require_file "$app_dir/application.apx"
    require_file "$app_dir/.apex/apexlang.json"
    printf 'apex validate -input "%s"\n' "$app_dir" >"$log_dir/validate-$i.sqlcl"
    run_sqlcl_nolog "$log_dir/validate-$i.log" "$log_dir/validate-$i.sqlcl" \
        || die "Validation failed: $alias"
    grep -qi 'Validation successful' "$log_dir/validate-$i.log" \
        || die "SQLcl did not report successful validation: $alias"
done

for i in "${!devAppIds[@]}"; do
    alias="${appAliases[$i]}"
    id="${devAppIds[$i]}"
    cat >"$log_dir/import-$i.sqlcl" <<SQL
begin
  apex_application_install.set_auto_install_sup_obj(false);
end;
/
apex import -input "$apexSourceDir/$alias" -id $id -workspace "$devWorkspace" -schema "$devDbSchema"
SQL
    log "Importing APEXlang $alias to DEV app $id WITHOUT installing Supporting Objects"
    run_sqlcl "$devDbConnName" "$log_dir/import-$i.log" "$log_dir/import-$i.sqlcl" \
        || die "APEXlang import failed: $alias"
    grep -qi 'Import successful' "$log_dir/import-$i.log" \
        || die "SQLcl did not confirm import: $alias"
done
log 'DEV APEXlang import completed. Build release exports from this DEV state.'
