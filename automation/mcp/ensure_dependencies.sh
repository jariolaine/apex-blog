#!/usr/bin/env bash
# Container-only bootstrap: populate Docker-named .venv and node_modules volumes.
# The volume-init Compose service must assign ownership BEFORE this runs.
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_DIR="$(cd -- "$SCRIPT_DIR/../.." && pwd -P)"
cd "$REPO_DIR"

for path in .venv node_modules; do
  if [[ ! -d "$path" || ! -w "$path" ]]; then
    printf '[apex-blog MCP] %s is not writable. Start via Docker Compose so the volume initializer runs first.\n' "$path" >&2
    exit 1
  fi
done

# Regenerate only when dependencies are missing or their lock/config inputs
# change. The stamp lives inside the Docker-named virtualenv volume.
inputs=(
  automation/ci/bootstrap.sh
  automation/ci/install_actionlint.sh
  automation/ci/requirements.txt
  package.json
  package-lock.json
)
for path in "${inputs[@]}"; do
  if [[ ! -f "$path" ]]; then
    printf '[apex-blog MCP] Missing dependency input: %s\n' "$path" >&2
    exit 1
  fi
done
fingerprint="$({
  sha256sum "${inputs[@]}"
  python3 --version
  node --version
} | sha256sum | cut -d' ' -f1)"
stamp_file='.venv/.apex-blog-container-dependencies.sha256'

if [[ -x .venv/bin/python && -x .venv/bin/pre-commit &&
      -x .venv/bin/actionlint && -x node_modules/.bin/eslint &&
      -r "$stamp_file" ]] && [[ "$(cat "$stamp_file")" == "$fingerprint" ]]; then
  printf '[apex-blog MCP] Container dependencies already initialized.\n' >&2
  exit 0
fi

printf '[apex-blog MCP] Initializing container-managed Python/Node dependencies.\n' >&2
# Skips host Git-hook modification. The Compose service sets CI=true so npm
# installs exactly the committed lockfile using npm ci.
bash automation/ci/bootstrap.sh --no-hooks
printf '%s\n' "$fingerprint" > "$stamp_file"
printf '[apex-blog MCP] Dependencies ready in Docker volumes.\n' >&2
