#!/usr/bin/env bash
# Shared image/local pre-commit command resolver.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_DIR="$(cd -- "$SCRIPT_DIR/../.." && pwd -P)"
cd "$REPO_DIR"
exec bash automation/ci/run_tool.sh pre-commit "$@"
