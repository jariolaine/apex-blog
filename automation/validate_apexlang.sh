#!/usr/bin/env bash
# Validate the local APEXlang repo without requiring a database connection.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"
require_tool "$sqlcl_bin"
# Check local references and deployment IDs without requiring release versions
# to match during ordinary work-in-progress development.
python3 "$SCRIPT_DIR/lib/check_source_consistency.py" \
    --repo "$repoHome" --dev-ids "${devAppIds[@]}" --mode source \
    || die 'APEXLang source references or DEV application IDs are inconsistent'
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
