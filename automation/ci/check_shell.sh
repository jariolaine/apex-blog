#!/usr/bin/env bash
set -Eeuo pipefail
cd "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# Ignore the locally downloaded Oracle APEX distribution, even when it is
# present under automation/ as untracked files.
mapfile -d '' files < <(find automation \
    -path 'automation/docker/apex' -prune -o \
    -type f -name '*.sh' ! -name 'variables.local.sh' -print0)
for file in "${files[@]}"; do
    bash -n "$file"
done
# Keep the baseline strict on proven errors, not inherited style warnings.
shellcheck --severity=error "${files[@]}"
