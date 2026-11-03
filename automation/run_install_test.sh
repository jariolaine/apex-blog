#!/usr/bin/env bash
# Destructive fresh install test, only against a dedicated disposable schema.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"
confirmed=false
release_dir="$(current_release_dir)"
while (( $# )); do
    case "$1" in
        --confirm-reset-test) confirmed=true; shift ;;
        --release-dir)
            (( $# >= 2 )) || die '--release-dir requires a directory'
            release_dir="$2"; shift 2 ;;
        *) die "Unknown option: $1" ;;
    esac
done
$confirmed || die 'Usage: run_install_test.sh --confirm-reset-test [--release-dir PATH]'
[[ -n "$tstDbConnName" ]] || die 'Set APEX_BLOG_TST_CONNECTION to a disposable TEST saved SQLcl connection'
[[ "$tstDbConnName" != "$devDbConnName" && "$tstDbConnName" != "$uatDbConnName" && "$tstDbConnName" != "$prdDbConnName" ]] \
    || die 'TEST saved connection must be different from DEV, UAT and production'
require_tool "$sqlcl_bin"
verify_release "$release_dir"
run_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-install-test.XXXXXXXX")"
trap 'rm -rf -- "$run_dir"' EXIT
check_environment "$tstDbConnName" "$tstWorkspace" "$tstDbSchema" "$run_dir/preflight.log"

# Test targets are disposed of deliberately, never inferred from DEV credentials.
{
    if test_schema_has_objects "$tstDbConnName" "$run_dir"; then
        emit_deinstall_objects "$deinstallSqlScript"
    else
        log 'TEST schema has no blog objects; skipping deinstallation SQL'
    fi
    emit_remove_app "$tstWorkspace" "$tstDbSchema" "${tstAppIds[0]}"
    emit_remove_app "$tstWorkspace" "$tstDbSchema" "${tstAppIds[1]}"
} >"$run_dir/reset.sqlcl"
log 'Removing prior test applications and Supporting Objects'
run_sqlcl "$tstDbConnName" "$run_dir/reset.log" "$run_dir/reset.sqlcl" \
    || die 'Unable to reset TEST schema (inspect SQLcl log)'
install_two_apps "$tstDbConnName" "$tstWorkspace" "$tstDbSchema" \
    "${tstAppIds[0]}" "${tstAppIds[1]}" "$release_dir" "$run_dir" fresh
log 'Fresh-install test completed against disposable TEST schema'
