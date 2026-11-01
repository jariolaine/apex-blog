#!/usr/bin/env bash
# Install a checksum-verified actionlint release into the repository's .venv.
# This pins a lint tool, not a Node.js or Python runtime version.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_DIR="$(cd -- "$SCRIPT_DIR/../.." && pwd -P)"
TARGET="$REPO_DIR/.venv/bin/actionlint"
VERSION=1.7.12

if [[ -x "$TARGET" ]]; then
  exit 0
fi

for command_name in curl tar; do
  if ! command -v "$command_name" >/dev/null 2>&1; then
    printf '[apex-blog] Missing %s needed to install actionlint.\n' "$command_name" >&2
    exit 1
  fi
done

case "$(uname -s)/$(uname -m)" in
  Linux/x86_64)
    platform=linux_amd64
    checksum=8aca8db96f1b94770f1b0d72b6dddcb1ebb8123cb3712530b08cc387b349a3d8 ;;
  Linux/aarch64|Linux/arm64)
    platform=linux_arm64
    checksum=325e971b6ba9bfa504672e29be93c24981eeb1c07576d730e9f7c8805afff0c6 ;;
  Darwin/x86_64)
    platform=darwin_amd64
    checksum=5b44c3bc2255115c9b69e30efc0fecdf498fdb63c5d58e17084fd5f16324c644 ;;
  Darwin/arm64)
    platform=darwin_arm64
    checksum=aba9ced2dee8d27fecca3dc7feb1a7f9a52caefa1eb46f3271ea66b6e0e6953f ;;
  *)
    printf '[apex-blog] Unsupported actionlint platform: %s/%s\n' \
      "$(uname -s)" "$(uname -m)" >&2
    exit 1 ;;
esac

scratch="$(mktemp -d)"
trap 'rm -rf -- "$scratch"' EXIT
archive="$scratch/actionlint.tar.gz"
url="https://github.com/rhysd/actionlint/releases/download/v${VERSION}/actionlint_${VERSION}_${platform}.tar.gz"

printf '[apex-blog] Installing actionlint %s (%s)\n' "$VERSION" "$platform" >&2
curl --fail --silent --show-error --location --retry 3 \
  --output "$archive" "$url"
if command -v sha256sum >/dev/null 2>&1; then
  actual="$(sha256sum "$archive")"
elif command -v shasum >/dev/null 2>&1; then
  actual="$(shasum -a 256 "$archive")"
else
  printf '[apex-blog] Need sha256sum or shasum to verify actionlint.\n' >&2
  exit 1
fi
actual="${actual%% *}"
if [[ "$actual" != "$checksum" ]]; then
  printf '[apex-blog] actionlint archive SHA-256 mismatch; refusing installation.\n' >&2
  exit 1
fi

tar -xzf "$archive" -C "$scratch" actionlint
mkdir -p -- "$(dirname -- "$TARGET")"
install -m 755 "$scratch/actionlint" "$TARGET"
"$TARGET" -version
