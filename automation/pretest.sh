#!/usr/bin/env bash
# Test DEV's current packaged SQL directly on disposable TEST, without a release candidate.
# The exported SQL exists only in a private temporary directory and is deleted on exit.
set -Eeuo pipefail
umask 077
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"

test_selection='all'
while (( $# )); do
    case "$1" in
        --test)
            (( $# >= 2 )) || die '--test requires install, upgrade or deinstall'
            [[ "$test_selection" == 'all' ]] || die 'Duplicate --test'
            test_selection="$2"; shift 2 ;;
        *) die 'Usage: pretest.sh [--test install|upgrade|deinstall]' ;;
    esac
done
case "$test_selection" in
    all|install|upgrade|deinstall) ;;
    *) die '--test must be install, upgrade or deinstall' ;;
esac
[[ -n "$devDbConnName" && -n "$tstDbConnName" ]] \
    || die 'DEV and disposable TEST saved SQLcl connections are required'
[[ "$tstDbConnName" != "$devDbConnName" && "$tstDbConnName" != "$uatDbConnName" &&
   "$tstDbConnName" != "$prdDbConnName" ]] \
    || die 'TEST saved connection must be different from DEV, UAT and production'
[[ "${tstAppIds[0]}" =~ ^[1-9][0-9]*$ && "${tstAppIds[1]}" =~ ^[1-9][0-9]*$ &&
   "${tstAppIds[0]}" != "${tstAppIds[1]}" ]] \
    || die 'TEST application IDs must be distinct positive integers'
require_tool "$sqlcl_bin"
require_tool python3
require_file "$repoHome/VERSION.txt"
require_file "$deinstallSqlScript"

run_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-pretest.XXXXXXXX")"
trap 'rm -rf -- "$run_dir"' EXIT
mkdir -p -- "$run_dir/export" "$run_dir/current"
cp -- "$repoHome/VERSION.txt" "$run_dir/current/VERSION.txt"

# Both connections are checked before any destructive TEST operation. DEV is
# read-only: no APEXLang export, prepare-release, source sync or Git changes.
check_environment "$devDbConnName" "$devWorkspace" "$devDbSchema" "$run_dir/check-dev.log"
check_environment "$tstDbConnName" "$tstWorkspace" "$tstDbSchema" "$run_dir/check-test.log"
check_dev_release_version "$devDbConnName" "$devWorkspace" \
    "${devAppIds[0]}" "${devAppIds[1]}" "$run_dir"

for i in "${!devAppIds[@]}"; do
    id="${devAppIds[$i]}"
    cat >"$run_dir/export-$i.sqlcl" <<SQL
apex export -applicationid $id -exptype APPLICATION_SOURCE -expsupportingobjects Y -exppubreports -skipExportDate -dir $(sqlcl_arg "$run_dir/export")
SQL
    log "Pretest: exporting packaged DEV SQL for ${appAliases[$i]} (application $id)"
    run_sqlcl "$devDbConnName" "$run_dir/export-$i.log" "$run_dir/export-$i.sqlcl" \
        || die "Pretest DEV SQL export failed: ${appAliases[$i]}"
    require_file "$run_dir/export/f${id}.sql"
    mv -- "$run_dir/export/f${id}.sql" "$run_dir/current/${releaseSqlNames[$i]}"
done

# A verified, tagged GitHub release is the only previous-release source.
# Fetch and verify BEFORE touching TEST. Pretest permits equal application
# versions to validate an APEX runtime upgrade on an unchanged app release.
if [[ "$test_selection" == all || "$test_selection" == upgrade ]]; then
    APEX_BLOG_REQUIRE_GITHUB_SHA256="$requireGithubReleaseSha256" \
    python3 "$SCRIPT_DIR/lib/fetch_previous_release.py" \
        --candidate-version-file "$run_dir/current/VERSION.txt" --allow-equal-version \
        --output-dir "$run_dir/previous" \
        || die 'Pretest could not verify the official published GitHub release; use TEST=install to skip upgrade'
fi

reset_disposable_test() {
    local phase="$1" script
    script="$run_dir/reset-$phase.sqlcl"
    {
        if test_schema_has_objects "$tstDbConnName" "$run_dir"; then
            emit_deinstall_objects "$deinstallSqlScript"
        else
            log 'TEST schema has no blog objects; skipping deinstallation SQL'
        fi
        emit_remove_app "$tstWorkspace" "$tstDbSchema" "${tstAppIds[0]}"
        emit_remove_app "$tstWorkspace" "$tstDbSchema" "${tstAppIds[1]}"
    } >"$script"
    log "Pretest: resetting disposable TEST ($phase)"
    run_sqlcl "$tstDbConnName" "$run_dir/reset-$phase.log" "$script" \
        || die "Pretest could not reset TEST ($phase)"
}

if [[ "$test_selection" == all || "$test_selection" == upgrade ]]; then
    reset_disposable_test upgrade
    install_two_apps "$tstDbConnName" "$tstWorkspace" "$tstDbSchema" \
        "${tstAppIds[0]}" "${tstAppIds[1]}" "$run_dir/previous" "$run_dir" previous
    install_two_apps "$tstDbConnName" "$tstWorkspace" "$tstDbSchema" \
        "${tstAppIds[0]}" "${tstAppIds[1]}" "$run_dir/current" "$run_dir" pretest-upgrade
fi

if [[ "$test_selection" == all || "$test_selection" == install || "$test_selection" == deinstall ]]; then
    reset_disposable_test fresh
    install_two_apps "$tstDbConnName" "$tstWorkspace" "$tstDbSchema" \
        "${tstAppIds[0]}" "${tstAppIds[1]}" "$run_dir/current" "$run_dir" pretest-fresh
fi
if [[ "$test_selection" == all || "$test_selection" == deinstall ]]; then
    # The existing deinstall contract verifies zero user objects and no apps.
    bash "$SCRIPT_DIR/run_deinstall_test.sh"
fi
log "Pretest passed ($test_selection): current DEV SQL tested on disposable TEST"
