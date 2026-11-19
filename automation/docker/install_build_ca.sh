#!/bin/sh
# BuildKit secret only: optional extra PEM roots needed for HTTPS downloads
# DURING docker build. Public CA certificates enter the image trust stores;
# wallet/private keys must never be supplied here.
set -eu
source=/run/secrets/apex_blog_build_ca
[ -s "$source" ] || exit 0

out_dir=/usr/local/share/ca-certificates
mkdir -p "$out_dir"
count=0
inside=no
cr="$(printf '\r')"
while IFS= read -r line || [ -n "$line" ]; do
  # Accept PEM files with either Unix or Windows line endings.
  line="${line%"$cr"}"
  case "$line" in
    '-----BEGIN CERTIFICATE-----')
      [ "$inside" = no ] || { echo 'Nested PEM certificate' >&2; exit 2; }
      count=$((count + 1))
      dest="$out_dir/apex-blog-build-$(printf '%03d' "$count").crt"
      printf '%s\n' "$line" > "$dest"
      inside=yes
      ;;
    '-----END CERTIFICATE-----')
      [ "$inside" = yes ] || { echo 'Unexpected PEM certificate end' >&2; exit 2; }
      printf '%s\n' "$line" >> "$dest"
      inside=no
      ;;
    *)
      if [ "$inside" = yes ]; then printf '%s\n' "$line" >> "$dest"; fi
      ;;
  esac
done < "$source"
[ "$count" -gt 0 ] && [ "$inside" = no ] || {
  echo 'Build CA secret must contain one or more PEM certificates' >&2
  exit 2
}
command -v update-ca-certificates >/dev/null 2>&1 || {
  echo 'update-ca-certificates is unavailable in the base image' >&2
  exit 2
}
update-ca-certificates
printf '[apex-blog] Installed %s build-time CA certificate(s)\n' "$count" >&2
