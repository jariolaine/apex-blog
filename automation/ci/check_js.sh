#!/usr/bin/env bash
set -Eeuo pipefail
cd "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd -P)"
while IFS= read -r -d '' file; do
    node --check "$file"
done < <(find frontend/js applications -type f -name '*.js' ! -name '*.min.js' -print0)
bash automation/ci/run_tool.sh eslint frontend/js applications/blog-admin/shared-components/plugins --ext .js
