#!/usr/bin/env bash
# Synchronize DEV APEX app versions and BLOG_SETTINGS with VERSION.txt.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"
(( $# == 0 )) || die 'Usage: prepare_release.sh'
require_tool "$sqlcl_bin"
version="$(read_release_version)"
[[ "${devAppIds[0]}" =~ ^[0-9]+$ && "${devAppIds[1]}" =~ ^[0-9]+$ ]] || die 'Invalid DEV application IDs'
run_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-version.XXXXXXXX")"
trap 'rm -rf -- "$run_dir"' EXIT
check_environment "$devDbConnName" "$devWorkspace" "$devDbSchema" "$run_dir/check-dev.log"
cat >"$run_dir/prepare.sqlcl" <<SQL
set serveroutput on size unlimited
begin
  apex_util.set_workspace(p_workspace => '$devWorkspace');
  apex_application_admin.set_application_version(
    p_application_id => ${devAppIds[0]}, p_version => '$version');
  apex_application_admin.set_application_version(
    p_application_id => ${devAppIds[1]}, p_version => '$version');
  update blog_settings set attribute_value = '$version'
   where attribute_name = 'G_APP_VERSION';
  if sql%rowcount <> 1 then
    raise_application_error(-20076, 'Missing G_APP_VERSION in DEV BLOG_SETTINGS');
  end if;
  commit;
  dbms_output.put_line('APEX_BLOG_RELEASE_PREPARED');
end;
/
SQL
log "Preparing DEV release version: $version"
run_sqlcl "$devDbConnName" "$run_dir/prepare.log" "$run_dir/prepare.sqlcl" \
    || die 'DEV release preparation failed; inspect version state before retrying'
grep -q '^APEX_BLOG_RELEASE_PREPARED' "$run_dir/prepare.log" \
    || die 'Release preparation success marker missing'
check_dev_release_version "$devDbConnName" "$devWorkspace" \
    "${devAppIds[0]}" "${devAppIds[1]}" "$run_dir"
log 'DEV versions prepared and verified'
