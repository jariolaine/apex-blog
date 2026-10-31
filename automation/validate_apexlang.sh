#!/usr/bin/env bash
# Validate the local APEXlang repo without requiring a database connection.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"
require_tool "$sqlcl_bin"
run_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-validate.XXXXXXXX")"
trap 'rm -rf -- "$run_dir"' EXIT
for alias in "${appAliases[@]}"; do
    require_file "$apexSourceDir/$alias/application.apx"
    printf 'apex validate -input "%s"\n' "$apexSourceDir/$alias" >"$run_dir/$alias.sqlcl"
    log "Validating local APEXlang: $alias"
    run_sqlcl_nolog "$run_dir/$alias.log" "$run_dir/$alias.sqlcl" \
        || die "Validation failed: $alias"
    grep -qi 'Validation successful' "$run_dir/$alias.log" \
        || die "SQLcl did not report validation success: $alias"
done
log 'Both applications validated successfully'
