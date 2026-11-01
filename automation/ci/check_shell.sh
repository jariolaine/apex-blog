#!/usr/bin/env bash
set -Eeuo pipefail
cd "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd -P)"
mapfile -d '' files < <(find automation -type f -name '*.sh' -not -name 'variables.local.sh' -print0)
for file in "${files[@]}"; do
    bash -n "$file"
done
# Keep the baseline strict on proven errors, not inherited style warnings.
shellcheck --severity=error "${files[@]}"
