#!/usr/bin/env bash
# Install a previous public release in TEST, then upgrade with the candidate.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"

previous_zip=''
release_dir="$(current_release_dir)"
while (( $# )); do
    case "$1" in
        --release-dir)
            (( $# >= 2 )) || die '--release-dir requires a directory'
            release_dir="$2"; shift 2 ;;
        --previous-zip)
            (( $# >= 2 )) || die '--previous-zip requires a file'
            previous_zip="$2"; shift 2 ;;
        *) die "Unknown option: $1" ;;
    esac
done
if [[ -n "$previous_zip" ]]; then
    require_file "$previous_zip"
fi
[[ -n "$tstDbConnName" ]] || die 'Set APEX_BLOG_TST_CONNECTION to a disposable TEST saved connection'
[[ "$tstDbConnName" != "$devDbConnName" && "$tstDbConnName" != "$uatDbConnName" && "$tstDbConnName" != "$prdDbConnName" ]] \
    || die 'TEST saved connection must differ from DEV, QA and production'
require_tool "$sqlcl_bin"
require_tool python3
verify_release "$release_dir"
run_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-upgrade-test.XXXXXXXX")"
trap 'rm -rf -- "$run_dir"' EXIT
mkdir -p "$run_dir/previous"

if [[ -n "$previous_zip" ]]; then
    log "Using previous release ZIP: $previous_zip"
    cp -- "$previous_zip" "$run_dir/previous.zip"
else
    require_tool curl
    [[ -n "$upgDownloadUrl" ]] || die 'Set upgDownloadUrl in automation/variables.local.sh or supply PREVIOUS_ZIP'
    log "Downloading previous release: $upgDownloadUrl"
    curl --fail --silent --show-error --location --retry 3 \
        --output "$run_dir/previous.zip" "$upgDownloadUrl" \
        || die "Could not download previous release from $upgDownloadUrl; provide PREVIOUS_ZIP to use a local archive"
fi
# The candidate's VERSION.txt is checksum-verified by verify_release. Require
# the previous ZIP to identify an OLDER release before resetting TEST.
python3 "$SCRIPT_DIR/lib/extract_previous_release.py" \
    --candidate-version-file "$release_dir/VERSION.txt" \
    "$run_dir/previous.zip" "$run_dir/previous" "${releaseSqlNames[@]}" \
    || die 'Previous release ZIP must identify a release older than the candidate; provide PREVIOUS_ZIP if GitHub latest is not older'
check_environment "$tstDbConnName" "$tstWorkspace" "$tstDbSchema" "$run_dir/preflight.log"

{
    if test_schema_has_objects "$tstDbConnName" "$run_dir"; then
        emit_deinstall_objects "$deinstallSqlScript"
    else
        log 'TEST schema has no blog objects; skipping deinstallation SQL'
    fi
    emit_remove_app "$tstWorkspace" "$tstDbSchema" "${tstAppIds[0]}"
    emit_remove_app "$tstWorkspace" "$tstDbSchema" "${tstAppIds[1]}"
} >"$run_dir/reset.sqlcl"
log 'Resetting TEST schema before previous-release installation'
run_sqlcl "$tstDbConnName" "$run_dir/reset.log" "$run_dir/reset.sqlcl" \
    || die 'Could not reset TEST schema'
install_two_apps "$tstDbConnName" "$tstWorkspace" "$tstDbSchema" \
    "${tstAppIds[0]}" "${tstAppIds[1]}" "$run_dir/previous" "$run_dir" previous
install_two_apps "$tstDbConnName" "$tstWorkspace" "$tstDbSchema" \
    "${tstAppIds[0]}" "${tstAppIds[1]}" "$release_dir" "$run_dir" upgrade
log 'Upgrade test completed: previous release to current candidate'
