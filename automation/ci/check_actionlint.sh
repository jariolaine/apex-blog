#!/usr/bin/env bash
# Shared workflow check for local pre-commit and GitHub Actions.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_DIR="$(cd -- "$SCRIPT_DIR/../.." && pwd -P)"
if [[ ! -x "$REPO_DIR/.venv/bin/actionlint" ]]; then
  printf '[apex-blog] actionlint is not installed. Run: make setup-ci\n' >&2
  exit 1
fi
cd "$REPO_DIR"
exec "$REPO_DIR/.venv/bin/actionlint" "$@"
