#!/usr/bin/env bash
# Always use pre-commit from the repository virtual environment.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_DIR="$(cd -- "$SCRIPT_DIR/../.." && pwd -P)"
cd "$REPO_DIR"
if [[ ! -x .venv/bin/pre-commit ]]; then
  printf '[apex-blog] pre-commit not installed locally. Run: make setup-ci\n' >&2
  exit 1
fi
exec .venv/bin/pre-commit "$@"
