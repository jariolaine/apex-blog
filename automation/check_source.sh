#!/usr/bin/env bash
# Work-in-progress source checks or strict release-readiness checks.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"
mode="${1:-source}"
[[ "$mode" == source || "$mode" == release ]] || die 'Usage: check_source.sh [source|release]'
[[ $# -le 1 ]] || die 'Usage: check_source.sh [source|release]'
if [[ "$mode" == release ]]; then
    python3 "$SCRIPT_DIR/lib/check_deinstall.py" \
        "$SCRIPT_DIR/schema/install.list" "$scriptSourceDir" "$deinstallSqlScript" \
        || die 'Release deinstall SQL is inconsistent with schema sources'
fi
python3 "$SCRIPT_DIR/lib/check_source_consistency.py" \
    --repo "$repoHome" --dev-ids "${devAppIds[@]}" --mode "$mode"
