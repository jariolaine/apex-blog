#!/usr/bin/env bash
# Explicitly compile the repository BUILD_API in DEV (never in QA/PROD).
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"
[[ "${1:-}" == '--confirm-dev-ddl' && "$#" == 1 ]] \
    || die 'Usage: setup_build_api.sh --confirm-dev-ddl'
require_tool "$sqlcl_bin"
require_file "$SCRIPT_DIR/database/BUILD_API.sql"
run_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-build-api.XXXXXXXX")"
trap 'rm -rf -- "$run_dir"' EXIT
check_environment "$devDbConnName" "$devWorkspace" "$devDbSchema" "$run_dir/check-dev.log"
cat >"$run_dir/compile.sqlcl" <<SQL
set serveroutput on size unlimited
@$(sqlcl_arg "$SCRIPT_DIR/database/BUILD_API.sql")
declare
  l_valid number;
begin
  select count(*) into l_valid from user_objects
   where object_name = 'BUILD_API'
     and object_type in ('PACKAGE', 'PACKAGE BODY')
     and status = 'VALID';
  if l_valid <> 2 then
    for e in (select type, line, position, text from user_errors
               where name = 'BUILD_API' order by sequence) loop
      dbms_output.put_line(e.type || ':' || e.line || ':' || e.position || ' ' || e.text);
    end loop;
    raise_application_error(-20075, 'BUILD_API compilation errors; see SQLcl log');
  end if;
  dbms_output.put_line('APEX_BLOG_BUILD_API_VALID');
end;
/
SQL
run_sqlcl "$devDbConnName" "$run_dir/compile.log" "$run_dir/compile.sqlcl" \
    || die 'DEV BUILD_API compilation failed'
grep -q '^APEX_BLOG_BUILD_API_VALID' "$run_dir/compile.log" \
    || die 'Missing BUILD_API compilation success marker'
log 'DEV BUILD_API compiled and verified'
