#!/usr/bin/env bash
# Requires the caller to enable: set -Eeuo pipefail
source "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)/variables.sh"

log() { printf '[apex-blog] %s\n' "$*" >&2; }
die() { log "ERROR: $*"; exit 1; }
require_tool() { command -v "$1" >/dev/null 2>&1 || die "Missing command: $1"; }
require_file() { [[ -s "$1" && -f "$1" ]] || die "Missing or empty file: $1"; }

sqlcl_bin="${SQLCL_BIN:-sql}"

# Run an SQLcl command script with SQL/PLSQL failures raised to the shell.
# SQLcl command parsing errors do not always set an exit code; callers MUST
# also validate the expected outputs or a positive success marker.
run_sqlcl() {
    local conn="$1" log_file="$2" sql_file="$3" rc=0
    [[ -n "$conn" ]] || die 'No SQLcl saved connection configured'
    mkdir -p -- "$(dirname -- "$log_file")"
    {
        printf '%s\n' 'whenever sqlerror exit sql.sqlcode rollback' 'whenever oserror exit failure rollback'
        cat -- "$sql_file"
        printf '\nexit success\n'
    } | "$sqlcl_bin" -L -S -name "$conn" >"$log_file" 2>&1 || rc=$?
    if (( rc != 0 )); then
        log "SQLcl failed (exit $rc): $log_file"
        tail -n 35 "$log_file" >&2 || true
        return 1
    fi
}

run_sqlcl_nolog() {
    local log_file="$1" sql_file="$2" rc=0
    mkdir -p -- "$(dirname -- "$log_file")"
    {
        printf '%s\n' 'whenever sqlerror exit sql.sqlcode rollback' 'whenever oserror exit failure rollback'
        cat -- "$sql_file"
        printf '\nexit success\n'
    } | "$sqlcl_bin" /nolog >"$log_file" 2>&1 || rc=$?
    if (( rc != 0 )); then
        log "SQLcl failed (exit $rc): $log_file"
        tail -n 35 "$log_file" >&2 || true
        return 1
    fi
}

# VERSION.txt is the sole source of truth for build/release versions.
# Keep the YYYYMMDD suffix: existing migration conditions depend on it.
read_release_version() {
    local version_file="$repoHome/VERSION.txt" version
    local version_pattern='^Release [0-9]+(\.[0-9]+)+\.[0-9]{8}$'
    require_file "$version_file"
    version="$(<"$version_file")"
    [[ "$version" =~ $version_pattern ]] \
        || die "Invalid $version_file: expected 'Release 26.1.5.20261025' (and no extra lines)"
    printf '%s\n' "$version"
}

# Replace the sole trusted placeholder using an already validated version.
# Template stays in Git; SQLcl never controls this DDL text.
render_release_template() {
    local template="$1" output="$2" version="$3" contents
    local version_pattern='^Release [0-9]+(\.[0-9]+)+\.[0-9]{8}$'
    require_file "$template"
    [[ "$version" =~ $version_pattern ]] \
        || die 'Invalid release version for SQL template'
    contents="$(<"$template")"
    [[ "$contents" == *'#APP_VERSION#'* ]] || die "Missing #APP_VERSION# in $template"
    printf '%s\n' "${contents//\#APP_VERSION\#/$version}" >"$output"
}

# Prevent packaged SQL releases with a different APEX application version.
# Never modifies DEV. prepare_release.sh is the explicit mutation step.
check_dev_release_version() {
    local conn="$1" workspace="$2" admin_id="$3" public_id="$4" logs="$5" version sql_file
    version="$(read_release_version)"
    [[ "$workspace" =~ ^[A-Za-z][A-Za-z0-9_\$#]*$ ]] || die 'Invalid DEV workspace'
    [[ "$admin_id" =~ ^[0-9]+$ && "$public_id" =~ ^[0-9]+$ ]] || die 'Invalid DEV application ID'
    sql_file="$logs/check-release-version.sqlcl"
    cat >"$sql_file" <<SQL
set serveroutput on size unlimited
declare
  l_version blog_settings.attribute_value%type;
begin
  apex_util.set_workspace(p_workspace => '$workspace');
  select attribute_value into l_version from blog_settings
   where attribute_name = 'G_APP_VERSION';
  if l_version <> '$version' then
    raise_application_error(-20073, 'DEV BLOG_SETTINGS.G_APP_VERSION differs from VERSION.txt');
  end if;
  if nvl(apex_application_admin.get_application_version(p_application_id => $admin_id), '<missing>') <> '$version'
     or nvl(apex_application_admin.get_application_version(p_application_id => $public_id), '<missing>') <> '$version' then
    raise_application_error(-20074, 'DEV APEX application versions differ from VERSION.txt');
  end if;
  dbms_output.put_line('APEX_BLOG_VERSION_OK');
end;
/
SQL
    run_sqlcl "$conn" "$logs/check-release-version.log" "$sql_file" \
        || die 'Release versions differ; run make prepare-release after review'
    grep -q '^APEX_BLOG_VERSION_OK' "$logs/check-release-version.log" \
        || die 'SQLcl did not confirm DEV release versions'
}

# Strictly assert that the connected parsing schema belongs to this workspace.
# This is deliberately executed BEFORE any destructive import or export.
check_environment() {
    local conn="$1" ws="$2" schema="$3" log_file="$4" sql_file
    [[ "$ws" =~ ^[A-Za-z][A-Za-z0-9_\$#]*$ ]] || die "Invalid workspace name: $ws"
    [[ "$schema" =~ ^[A-Za-z][A-Za-z0-9_\$#]*$ ]] || die "Invalid schema name: $schema"
    sql_file="$(mktemp "${TMPDIR:-/tmp}/apex-check.XXXXXX")"
    cat >"$sql_file" <<SQL
set serveroutput on
declare
  l_count number;
begin
  if upper(sys_context('USERENV', 'SESSION_USER')) <> upper('$schema') then
    raise_application_error(-20050, 'Wrong connected schema; expected $schema');
  end if;
  select count(*) into l_count from apex_workspace_schemas
   where upper(workspace_name) = upper('$ws')
     and upper(first_schema_provisioned) = upper('$schema');
  if l_count < 1 then
    raise_application_error(-20051, 'Missing workspace $ws with primary schema $schema');
  end if;
  dbms_output.put_line('APEX_BLOG_ENV_OK');
end;
/
SQL
    if ! run_sqlcl "$conn" "$log_file" "$sql_file"; then
        rm -f -- "$sql_file"; die "Cannot verify database environment: $conn"
    fi
    rm -f -- "$sql_file"
    grep -q '^APEX_BLOG_ENV_OK' "$log_file" || die "Missing environment verification marker: $log_file"
}

# The default candidate is selected by VERSION.txt. Older candidates can be
# deployed explicitly using --release-dir without rebuilding or re-exporting.
current_release_dir() {
    local version
    version="$(read_release_version)"
    printf '%s/releases/%s\n' "$buildDir" "${version#Release }"
}

# Lock files are persistent: deleting them can break flock's inode-based
# exclusion while another process is using the candidate. The descriptor is
# intentionally held until the calling script exits (including SQLcl imports).
# Build obtains an exclusive non-waiting lock; TEST/QA/production and artifact
# verification take a shared lock. Lock names come only from candidate slugs.
acquire_release_lock() {
    local dir="$1" access="$2" slug lock_file
    slug="${dir%/}"
    slug="${slug##*/}"
    [[ "$slug" =~ ^[0-9]+(\.[0-9]+)+\.[0-9]{8}$ ]] \
        || die "Invalid release candidate directory name: $slug"
    require_tool flock
    [[ -z "${release_lock_fd:-}" ]] || die 'Release candidate lock already held by this process'
    mkdir -p -- "$buildDir/releases/.locks"
    lock_file="$buildDir/releases/.locks/$slug.lock"
    [[ ! -L "$lock_file" && ( ! -e "$lock_file" || -f "$lock_file" ) ]] \
        || die "Unsafe release lock file: $lock_file"
    exec {release_lock_fd}>>"$lock_file"
    case "$access" in
        exclusive)
            flock -n -x "$release_lock_fd" \
                || die "Release candidate is in use by another build or deployment: $dir" ;;
        shared)
            flock -s "$release_lock_fd" \
                || die "Could not lock release candidate for deployment/verification: $dir" ;;
        *) die "Unknown release lock access: $access" ;;
    esac
}

# Verify both checksums and the release manifest; QA also requires the exact
# source snapshot that was used to create this candidate. The lock stays held
# throughout any subsequent TEST/QA/production imports in this shell process.
verify_release() {
    local dir="$1" check_source="${2:-false}"
    require_tool python3
    acquire_release_lock "$dir" shared
    [[ -d "$dir" ]] || die "Release candidate not found: $dir"
    if [[ "$check_source" == true ]]; then
        python3 "$repoHome/automation/lib/release_manifest.py" verify \
            --dir "$dir" --repo "$repoHome" --check-source \
            || die "Release checksum or source mismatch: $dir"
    else
        python3 "$repoHome/automation/lib/release_manifest.py" verify \
            --dir "$dir" || die "Release checksum mismatch: $dir"
    fi
}

# Quote a string argument passed to an SQLcl @script call; configuration is
# repository-controlled. Reject double quotes/newlines in script paths.
sqlcl_arg() {
    local val="$1"
    [[ "$val" != *'"'* && "$val" != *$'\n'* && "$val" != *$'\r'* ]] || die 'Invalid SQLcl argument'
    printf '"%s"' "$val"
}

# Emit a SQLcl command that imports one full packaged SQL export. Used by QA,
# production, fresh-install tests and upgrade tests; no re-export from QA.
emit_install_app() {
    local workspace="$1" schema="$2" app_id="$3" file="$4" version="$5"
    require_file "$file"
    [[ "$version" =~ ^Release\ [0-9]+(\.[0-9]+)+\.[0-9]{8}$ ]] \
        || die "Invalid expected application release version: $version"
    printf '@%s %s %s %s %s %s\n' \
        "$(sqlcl_arg "$sqlScriptDir/install_application.sql")" \
        "$(sqlcl_arg "$workspace")" "$(sqlcl_arg "$schema")" \
        "$(sqlcl_arg "$app_id")" "$(sqlcl_arg "$file")" "$(sqlcl_arg "$version")"
}

emit_remove_app() {
    local workspace="$1" schema="$2" app_id="$3"
    printf '@%s %s %s %s\n' \
        "$(sqlcl_arg "$sqlScriptDir/remove_application.sql")" \
        "$(sqlcl_arg "$workspace")" "$(sqlcl_arg "$schema")" \
        "$(sqlcl_arg "$app_id")"
}

emit_deinstall_objects() {
    local file="$1"
    require_file "$file"
    printf '@%s %s\n' \
        "$(sqlcl_arg "$sqlScriptDir/deinstall_supporting_objects.sql")" \
        "$(sqlcl_arg "$file")"
}

# Run two application SQL exports sequentially through separate sessions.
install_two_apps() {
    local conn="$1" workspace="$2" schema="$3" id0="$4" id1="$5" dir="$6" logs="$7" label="$8" \
          i file script expected_version
    local ids=("$id0" "$id1")
    require_file "$dir/VERSION.txt"
    expected_version="$(<"$dir/VERSION.txt")"
    [[ "$expected_version" =~ ^Release\ [0-9]+(\.[0-9]+)+\.[0-9]{8}$ ]] \
        || die "Invalid release VERSION.txt in $dir"
    for i in 0 1; do
        file="$dir/${releaseSqlNames[$i]}"
        require_file "$file"
        script="$logs/${label}-install-$i.sqlcl"
        emit_install_app "$workspace" "$schema" "${ids[$i]}" "$file" "$expected_version" >"$script"
        log "Installing ${releaseSqlNames[$i]} as app ${ids[$i]} ($label)"
        run_sqlcl "$conn" "$logs/${label}-install-$i.log" "$script" \
            || die "Installation failed ($label, app ${ids[$i]})"
        grep -qx 'APEX_BLOG_INSTALL_OK' "$logs/${label}-install-$i.log" \
            || die "Cannot verify app ${ids[$i]} installation ($label); inspect SQLcl log"
    done
    # Check invalid Supporting Objects after BOTH imports, since they may have
    # cross-app dependencies. Keep diagnostics out of the candidate directory.
    script="$logs/${label}-verify-objects.sqlcl"
    printf '@%s\n' "$(sqlcl_arg "$sqlScriptDir/verify_installed_objects.sql")" >"$script"
    run_sqlcl "$conn" "$logs/${label}-verify-objects.log" "$script" \
        || die "Invalid BLOG_ database objects after installation ($label)"
    grep -qx 'APEX_BLOG_OBJECTS_VALID' "$logs/${label}-verify-objects.log" \
        || die "Cannot verify BLOG_ database objects after installation ($label)"
}

# Probe if database Supporting Objects have ever been installed in disposable
# TEST. A first-time clean installation must not run DROP statements on objects
# that do not exist yet. Returns 0 when objects exist, 1 when clean.
test_schema_has_objects() {
    local conn="$1" logs="$2" script
    script="$logs/probe.sqlcl"
    cat >"$script" <<'SQL'
set serveroutput on
begin
  for c in (select 1 from user_objects
             where object_name in ('BLOG_POSTS', 'BLOG_V_VERSION')
               and rownum = 1) loop
    dbms_output.put_line('APEX_BLOG_SCHEMA_PRESENT');
  end loop;
end;
/
SQL
    run_sqlcl "$conn" "$logs/probe.log" "$script" || die 'Cannot inspect TEST schema'
    grep -q 'APEX_BLOG_SCHEMA_PRESENT' "$logs/probe.log"
}
