#!/usr/bin/env bash
# Mandatory local quality gate for normal DEV synchronization and QA promotion.
# Also used by GitHub Actions. Never connects to an Oracle database.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_DIR="$(cd -- "$SCRIPT_DIR/../.." && pwd -P)"
cd "$REPO_DIR"
printf '[apex-blog] Preflight: lint\n' >&2
make --no-print-directory lint
printf '[apex-blog] Preflight: repository schema and metadata\n' >&2
make --no-print-directory check-schema
printf '[apex-blog] Preflight: APEXLang source references\n' >&2
make --no-print-directory check-source
printf '[apex-blog] Preflight: full automation tests\n' >&2
make --no-print-directory test
printf '[apex-blog] Preflight: validate both APEXLang applications\n' >&2
make --no-print-directory validate
printf '[apex-blog] Preflight passed\n' >&2
