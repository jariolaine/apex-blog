#!/usr/bin/env bash
# Docker build only. Inputs are copied to /opt/apex-blog before invoking this.
# No dependency installation occurs at container startup or in /workspace.
set -Eeuo pipefail
root=/opt/apex-blog

python3 -m venv "$root/venv"
"$root/venv/bin/python" -m pip install --no-cache-dir \
  --disable-pip-version-check -r "$root/bootstrap/requirements.txt"

# npm ci uses the committed lockfile; keep modules outside the repository
# bind mount. The PATH in both images includes these binaries.
npm ci --prefix "$root/npm" --ignore-scripts --no-audit --no-fund

ACTIONLINT_TARGET="$root/venv/bin/actionlint" \
  bash "$root/bootstrap/install_actionlint.sh"

# Pre-commit's externally maintained hook environments are downloaded during
# image build. A real temporary Git checkout avoids relying on runtime mounts.
mkdir -p "$root/pre-commit-cache"
scratch="$(mktemp -d)"
trap 'rm -rf -- "$scratch"' EXIT
cp "$root/config/.pre-commit-config.yaml" "$scratch/.pre-commit-config.yaml"
git -C "$scratch" init -q
(
  cd "$scratch"
  PRE_COMMIT_HOME="$root/pre-commit-cache" \
    "$root/venv/bin/pre-commit" install-hooks \
      --config "$scratch/.pre-commit-config.yaml"
)

"$root/venv/bin/pre-commit" --version
"$root/venv/bin/ruff" --version
"$root/venv/bin/sqlfluff" --version
"$root/npm/node_modules/.bin/eslint" --version
"$root/npm/node_modules/.bin/stylelint" --version
