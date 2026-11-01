#!/usr/bin/env bash
# Install lint tools locally using the available Python and Node.js runtimes.
# No global pre-commit and no Node.js major-version selector required.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_DIR="$(cd -- "$SCRIPT_DIR/../.." && pwd -P)"
cd "$REPO_DIR"

if [[ $# -gt 1 || ( $# -eq 1 && "$1" != '--no-hooks' ) ]]; then
  printf 'Usage: bash automation/ci/bootstrap.sh [--no-hooks]\n' >&2
  exit 2
fi

for command_name in python3 node npm; do
  if ! command -v "$command_name" >/dev/null 2>&1; then
    printf '[apex-blog] Missing %s; install it before setup.\n' "$command_name" >&2
    exit 1
  fi
done

if [[ ! -x .venv/bin/python ]]; then
  if ! python3 -m venv .venv; then
    printf '[apex-blog] Unable to create .venv; on Ubuntu install python3-venv.\n' >&2
    exit 1
  fi
fi

.venv/bin/python -m pip install --disable-pip-version-check \
  -r automation/ci/requirements.txt

# CI uses the checked-in dependency lock when present. On a local workstation,
# npm install updates an out-of-date lockfile after a package.json change.
if [[ "${CI:-}" == 'true' && -f package-lock.json ]]; then
  npm ci --ignore-scripts --no-audit --no-fund
else
  npm install --ignore-scripts --no-audit --no-fund
  if [[ "${CI:-}" != 'true' ]]; then
    printf '[apex-blog] Review and commit package-lock.json.\n' >&2
  else
    printf '[apex-blog] No package-lock.json: CI used npm install; commit a lockfile for reproducibility.\n' >&2
  fi
fi

# Install a checksum-verified actionlint binary in the same local tool directory.
# No system-wide installation, Go toolchain, or Docker daemon is required.
bash automation/ci/install_actionlint.sh

if [[ "${1:-}" != '--no-hooks' ]]; then
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    printf '[apex-blog] No Git working tree; run setup-ci from a Git checkout.\n' >&2
    exit 1
  fi
  .venv/bin/pre-commit install
  printf '[apex-blog] Git pre-commit hook installed.\n' >&2
fi

printf '[apex-blog] Tools ready with local Node %s and Python %s.\n' \
  "$(node --version)" "$(.venv/bin/python --version 2>&1)" >&2
printf '[apex-blog] Run: make lint\n' >&2
printf '[apex-blog] Review security advisories separately: npm audit\n' >&2
