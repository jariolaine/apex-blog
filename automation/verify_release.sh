#!/usr/bin/env bash
# Verify immutable release artifacts locally, without contacting any database.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"
release_dir="$(current_release_dir)"
if (( $# )); then
    [[ $# -eq 2 && "$1" == --release-dir ]] \
        || die 'Usage: verify_release.sh [--release-dir PATH]'
    release_dir="$2"
fi
verify_release "$release_dir"
log "Release candidate verified: $release_dir"
