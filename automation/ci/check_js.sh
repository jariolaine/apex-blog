#!/usr/bin/env bash
set -Eeuo pipefail
cd "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd -P)"
while IFS= read -r -d '' file; do
    node --check "$file"
done < <(find applications -type f -name '*.js' ! -name '*.min.js' -print0)
./node_modules/.bin/eslint applications --ext .js
