#!/usr/bin/env bash
# Deploy the SAME immutable SQL export artifacts to QA and production.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"

[[ $# -ge 1 ]] || die 'Usage: deploy.sh qa|production [--release-dir PATH] [--confirm-production]'
environment="$1"; shift
release_dir="$buildDir"
confirmed=false
while (( $# )); do
    case "$1" in
        --release-dir)
            (( $# >= 2 )) || die '--release-dir needs a path'
            release_dir="$2"; shift 2 ;;
        --confirm-production) confirmed=true; shift ;;
        *) die "Unknown option: $1" ;;
    esac
done
case "$environment" in
    qa)
        # Only normal QA promotion has this gate; emergency hotfix uses hotfix.sh.
        # This runs before SQLcl and any database changes, including direct calls.
        "$SCRIPT_DIR/ci/preflight.sh"
        conn="$uatDbConnName"; ws="$uatWorkspace"; schema="$uatDbSchema"
        ids=("${uatAppIds[@]}") ;;
    production|prod)
        $confirmed || die 'Production requires --confirm-production'
        conn="$prdDbConnName"; ws="$prdWorkspace"; schema="$prdDbSchema"
        ids=("${prdAppIds[@]}") ;;
    *) die 'Environment must be qa or production' ;;
esac
require_tool "$sqlcl_bin"
verify_release "$release_dir"
release_dir="$(cd -- "$release_dir" && pwd -P)"
logs="$release_dir/deploy-logs"
mkdir -p -- "$logs"
check_environment "$conn" "$ws" "$schema" "$logs/$environment-preflight.log"
install_two_apps "$conn" "$ws" "$schema" "${ids[0]}" "${ids[1]}" \
    "$release_dir" "$logs" "$environment"
log "Deployment to $environment completed using verified release: $release_dir"
