#!/usr/bin/env bash
# Populate a private runtime trust bundle from the standard OS/JDK roots and
# optional, read-only external CA files. Run before starting MCP or Dev.
# Trust is scoped to processes that opt in through a Compose override.
set -Eeuo pipefail

custom_dir="${APEX_BLOG_CUSTOM_CA_DIR:-}"
[[ -n "$custom_dir" ]] || exit 0
# A wallet-only mount need not contain a certificates/ subdirectory.
# A path that exists but is not a directory is always a configuration error.
[[ ! -e "$custom_dir" || -d "$custom_dir" ]] || {
  printf '[apex-blog] Custom CA path is not a directory: %s\n' "$custom_dir" >&2
  exit 2
}

trust_dir="${APEX_BLOG_TRUST_DIR:-/tmp/apex-blog-trust}"
system_bundle=/etc/ssl/certs/ca-certificates.crt
java_cacerts="${JAVA_HOME:?JAVA_HOME is required}/lib/security/cacerts"
[[ -r "$system_bundle" && -r "$java_cacerts" ]] || {
  printf '[apex-blog] System CA bundle or JDK truststore is unavailable\n' >&2
  exit 2
}

umask 077
mkdir -p -- "$trust_dir"
[[ ! -L "$trust_dir" ]] || {
  printf '[apex-blog] Trust directory must not be a symlink\n' >&2
  exit 2
}
chmod 700 -- "$trust_dir"
staging="$(mktemp -d "$trust_dir/.stage.XXXXXXXX")"
trap 'rm -rf -- "$staging"' EXIT
cp -- "$system_bundle" "$staging/ca-bundle.pem"
cp -- "$java_cacerts" "$staging/cacerts"
# The JDK installed in our images is intentionally read-only. GNU cp keeps
# the source mode when creating a destination, so its temporary copy must be
# made writable before keytool can import additional roots as a non-root user.
chmod 600 -- "$staging/cacerts"

shopt -s nullglob
certs=()
if [[ -d "$custom_dir" ]]; then
  certs=("$custom_dir"/*.crt "$custom_dir"/*.pem)
fi
index=0
for cert in "${certs[@]}"; do
  [[ -f "$cert" && ! -L "$cert" ]] || {
    printf '[apex-blog] Custom CA must be a regular file, not a symlink: %s\n' "$cert" >&2
    exit 2
  }
  # One PEM certificate per file. keytool verifies the certificate before
  # trusting it; neither TLS verification nor system roots are disabled.
  if grep -Eq -- '-----BEGIN ([A-Z0-9 ]+ )?PRIVATE KEY-----' "$cert"; then
    printf '[apex-blog] A trust certificate must not contain a private key: %s\n' "$cert" >&2
    exit 2
  fi
  begins="$(grep -c -- '^-----BEGIN CERTIFICATE-----' "$cert" || true)"
  ends="$(grep -c -- '^-----END CERTIFICATE-----' "$cert" || true)"
  [[ "$begins" == 1 && "$ends" == 1 ]] || {
    printf '[apex-blog] Expected one PEM certificate in: %s\n' "$cert" >&2
    exit 2
  }
  "$JAVA_HOME/bin/keytool" -printcert -file "$cert" >/dev/null 2>&1 || {
    printf '[apex-blog] Invalid PEM certificate: %s\n' "$cert" >&2
    exit 2
  }
  index=$((index + 1))
  printf '\n' >> "$staging/ca-bundle.pem"
  cat -- "$cert" >> "$staging/ca-bundle.pem"
  printf '\n' >> "$staging/ca-bundle.pem"
  # Preserve the actual keytool diagnostic if an import fails. This output
  # concerns public certificates and is more useful than a generic error.
  keytool_log="$staging/keytool-import.log"
  if ! "$JAVA_HOME/bin/keytool" -importcert -noprompt -trustcacerts \
    -alias "apex-blog-runtime-$(printf '%04d' "$index")" \
    -file "$cert" -keystore "$staging/cacerts" -storepass changeit \
    >"$keytool_log" 2>&1; then
    printf '[apex-blog] Failed to import custom root into Java truststore: %s\n' "$cert" >&2
    cat -- "$keytool_log" >&2
    exit 2
  fi
done

# The destination paths are stable and declared in the optional Compose
# override; processes launched after this step read these generated files.
mv -f -- "$staging/ca-bundle.pem" "$trust_dir/ca-bundle.pem"
mv -f -- "$staging/cacerts" "$trust_dir/cacerts"
chmod 600 -- "$trust_dir/ca-bundle.pem" "$trust_dir/cacerts"
printf '[apex-blog] Trust configured with %s additional CA certificate(s)\n' "$index" >&2
