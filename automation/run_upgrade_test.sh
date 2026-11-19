#!/usr/bin/env bash
# Install a previous public release in TEST, then upgrade with the candidate.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"

release_dir="$(current_release_dir)"
while (( $# )); do
    case "$1" in
        --release-dir)
            (( $# >= 2 )) || die '--release-dir requires a directory'
            release_dir="$2"; shift 2 ;;
        *) die "Unknown option: $1" ;;
    esac
done
[[ -n "$tstDbConnName" ]] || die 'Set APEX_BLOG_TST_CONNECTION to a disposable TEST saved connection'
[[ "$tstDbConnName" != "$devDbConnName" && "$tstDbConnName" != "$uatDbConnName" && "$tstDbConnName" != "$prdDbConnName" ]] \
    || die 'TEST saved connection must differ from DEV, QA and production'
require_tool "$sqlcl_bin"
require_tool python3
verify_release "$release_dir"
run_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-upgrade-test.XXXXXXXX")"
trap 'rm -rf -- "$run_dir"' EXIT

# GitHub's latest stable published release must be tagged on master and
# identify an OLDER application release. The SHA-256 requirement is configured
# in variables.sh; published checksums are always verified when available.
# Abort before
# destructive TEST changes if the official baseline is missing or invalid.
APEX_BLOG_REQUIRE_GITHUB_SHA256="$requireGithubReleaseSha256" \
    python3 "$SCRIPT_DIR/lib/fetch_previous_release.py" \
    --candidate-version-file "$release_dir/VERSION.txt" \
    --output-dir "$run_dir/previous" \
    || die 'Official GitHub release must be older than this candidate and pass verification'
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
