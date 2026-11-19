#!/usr/bin/env bash
# Prefer image-baked tools in containers and repository-local installs on hosts.
# --which supports diagnostics without executing the selected tool.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_DIR="$(cd -- "$SCRIPT_DIR/../.." && pwd -P)"

locate=false
if [[ "${1:-}" == '--which' ]]; then
  locate=true
  shift
fi
name="${1:-}"
if [[ -z "$name" ]]; then
  printf 'Usage: %s [--which] tool [arguments...]\n' "$0" >&2
  exit 2
fi
shift
case "$name" in
  pre-commit|ruff|sqlfluff|actionlint)
    local_bin="$REPO_DIR/.venv/bin/$name"
    image_bin="/opt/apex-blog/venv/bin/$name"
    ;;
  eslint|stylelint|markdownlint-cli2|prettier)
    local_bin="$REPO_DIR/node_modules/.bin/$name"
    image_bin="/opt/apex-blog/npm/node_modules/.bin/$name"
    ;;
  *)
    printf '[apex-blog] Unsupported CI tool: %s\n' "$name" >&2
    exit 2
    ;;
esac

# An old host .venv/node_modules can be present under the bind mount. Never
# prefer it over image tools when running in the managed containers.
if [[ "${APEX_BLOG_IMAGE_TOOLS:-}" == 'true' ]]; then
  if [[ ! -x "$image_bin" ]]; then
    printf '[apex-blog] Image-installed %s missing: %s; rebuild the container image.\n' "$name" "$image_bin" >&2
    exit 1
  fi
  target="$image_bin"
elif [[ -x "$local_bin" ]]; then
  target="$local_bin"
elif [[ -x "$image_bin" ]]; then
  target="$image_bin"
elif command -v "$name" >/dev/null 2>&1; then
  target="$(command -v "$name")"
else
  printf '[apex-blog] %s unavailable. Rebuild the container image or run make setup on a local workstation.\n' "$name" >&2
  exit 1
fi

if [[ "$locate" == true ]]; then
  printf '%s\n' "$target"
else
  # Stylelint resolves postcss-less relative to its config. The npm packages
  # live outside /workspace in image-managed environments.
  if [[ "$name" == 'stylelint' && "${APEX_BLOG_IMAGE_TOOLS:-}" == 'true' ]]; then
    exec "$target" --config-basedir /opt/apex-blog/npm "$@"
  fi
  exec "$target" "$@"
fi
