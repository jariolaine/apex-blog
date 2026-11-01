#!/usr/bin/env bash
# Destructive deinstallation test against dedicated, disposable TEST ONLY.
# The Makefile runs test-install first; direct callers must explicitly confirm.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"

[[ "${1:-}" == '--confirm-test-deinstall' && $# -eq 1 ]] \
    || die 'Usage: run_deinstall_test.sh --confirm-test-deinstall (run make test-deinstall to install first)'
[[ -n "$tstDbConnName" ]] || die 'Set APEX_BLOG_TST_CONNECTION to a disposable TEST saved SQLcl connection'
[[ "$tstDbConnName" != "$devDbConnName" && "$tstDbConnName" != "$uatDbConnName" && "$tstDbConnName" != "$prdDbConnName" ]] \
    || die 'TEST saved connection must be different from DEV, UAT and production'
[[ "${tstAppIds[0]}" =~ ^[1-9][0-9]*$ && "${tstAppIds[1]}" =~ ^[1-9][0-9]*$ && "${tstAppIds[0]}" != "${tstAppIds[1]}" ]] \
    || die 'TEST application IDs must be distinct positive integers'
require_tool "$sqlcl_bin"

run_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-deinstall-test.XXXXXXXX")"
trap 'rm -rf -- "$run_dir"' EXIT
# Validate the connected schema and workspace before any DROP or app removal.
check_environment "$tstDbConnName" "$tstWorkspace" "$tstDbSchema" "$run_dir/preflight.log"

{
    emit_deinstall_objects "$deinstallSqlScript"
    emit_remove_app "$tstWorkspace" "$tstDbSchema" "${tstAppIds[0]}"
    emit_remove_app "$tstWorkspace" "$tstDbSchema" "${tstAppIds[1]}"
} >"$run_dir/deinstall.sqlcl"
log 'Deinstalling Supporting Objects and both applications from disposable TEST'
run_sqlcl "$tstDbConnName" "$run_dir/deinstall.log" "$run_dir/deinstall.sqlcl" \
    || die 'TEST deinstallation failed (see SQLcl diagnostics above)'

# APEX application definitions are not USER_OBJECTS: check both explicitly.
printf '@%s %s %s %s\n' \
    "$(sqlcl_arg "$sqlScriptDir/verify_deinstalled_objects.sql")" \
    "$(sqlcl_arg "$tstWorkspace")" \
    "$(sqlcl_arg "${tstAppIds[0]}")" \
    "$(sqlcl_arg "${tstAppIds[1]}")" >"$run_dir/verify.sqlcl"
log 'Verifying TEST has zero USER_OBJECTS and no installed test applications'
run_sqlcl "$tstDbConnName" "$run_dir/verify.log" "$run_dir/verify.sqlcl" \
    || die 'TEST deinstallation left objects or applications (see SQLcl diagnostics above)'
grep -qx 'APEX_BLOG_DEINSTALL_OK' "$run_dir/verify.log" \
    || die 'SQLcl did not confirm TEST deinstallation; missing success marker'
log 'Deinstall test passed: TEST schema has no user objects or test applications'
