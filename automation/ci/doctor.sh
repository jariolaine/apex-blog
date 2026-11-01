#!/usr/bin/env bash
# Read-only diagnostic for local tooling; never connects to a database.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_DIR="$(cd -- "$SCRIPT_DIR/../.." && pwd -P)"
cd "$REPO_DIR"

issues=0
ok() { printf '[OK] %s\n' "$1"; }
missing() {
  printf '[MISSING] %s - %s\n' "$1" "$2"
  issues=$((issues + 1))
}

check_command() {
  local name="$1" hint="$2"
  if command -v "$name" >/dev/null 2>&1; then
    ok "$name"
  else
    missing "$name" "$hint"
  fi
}

check_local_executable() {
  local path="$1" hint="$2"
  if [[ -x "$path" ]]; then
    ok "$path"
  else
    missing "$path" "$hint"
  fi
}

printf '%s\n' 'APEX Blog automation doctor (no database access)'
for tool in python3 node npm git curl unzip shellcheck terraform java; do
  check_command "$tool" 'install the command and ensure it is on PATH'
done
check_command "${SQLCL_BIN:-sql}" 'install Oracle SQLcl or set SQLCL_BIN'

check_local_executable '.venv/bin/python' 'run make setup-ci'
check_local_executable '.venv/bin/pre-commit' 'run make setup-ci'
check_local_executable '.venv/bin/actionlint' 'run make setup-ci'

if [[ -s 'automation/variables.sh' && -s 'automation/database/BUILD_API.sql' ]]; then
  ok 'repository DEV setup files'
else
  missing 'repository DEV setup files' 'verify automation/variables.sh and automation/database/BUILD_API.sql'
fi

# Check the active Git hook location, including a custom core.hooksPath.
# Do not read or run the hook; this diagnostic only tests its existence.
if command -v git >/dev/null 2>&1; then
  if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null || true)" == 'true' ]]; then
    ok 'Git working tree'
    hooks_dir="$(git config --get core.hooksPath || true)"
    if [[ -n "$hooks_dir" ]]; then
      [[ "$hooks_dir" == /* ]] || hooks_dir="$REPO_DIR/$hooks_dir"
      hook_path="$hooks_dir/pre-commit"
    else
      hook_path="$(git rev-parse --git-path hooks/pre-commit)"
      [[ "$hook_path" == /* ]] || hook_path="$REPO_DIR/$hook_path"
    fi
    check_local_executable "$hook_path" 'run make setup-ci to install the Git hook'
  else
    missing 'Git working tree' 'clone the repository instead of using a source ZIP'
  fi
fi

if [[ -f package-lock.json ]]; then
  ok 'npm lockfile present'
else
  printf '%s\n' '[WARN] npm lockfile missing - commit package-lock.json for reproducible CI installs'
fi

# Never source variables.local.sh or run SQLcl here. SQLcl presence is not
# evidence that a saved DEV connection or the expected schema is accessible.
printf '%s\n' '[INFO] DEV saved connection, workspace and schema not tested (no database access)'
if (( issues != 0 )); then
  printf '[apex-blog] Doctor found %d missing requirements.\n' "$issues" >&2
  exit 1
fi
printf '%s\n' '[apex-blog] Local requirements present; run make check for quality gates.'
