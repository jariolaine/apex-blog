#!/usr/bin/env bash
# Make the optional, ignored repository-root .env available to Compose when
# VS Code opens the single development configuration from automation/docker/.
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd -P)"
root_env="$repo_root/.env"
compose_env="$repo_root/automation/docker/.env"

# Without .env, Compose uses the harmless empty directory and CA file
# committed under automation/docker/placeholders/. No host credentials or
# configuration are required just to open the development environment.
[[ -f "$root_env" ]] || exit 0

if [[ -L "$compose_env" ]]; then
  if [[ "$(readlink -f -- "$compose_env")" == "$(readlink -f -- "$root_env")" ]]; then
    exit 0
  fi
  printf '[apex-blog] %s is a symlink to another file; refusing to replace it.\n' "$compose_env" >&2
  exit 1
fi

if [[ -e "$compose_env" ]]; then
  printf '[apex-blog] %s already exists; refusing to overwrite it.\n' "$compose_env" >&2
  exit 1
fi

ln -s ../../.env "$compose_env"
printf '[apex-blog] Linked Compose environment to repository-root .env.\n'
