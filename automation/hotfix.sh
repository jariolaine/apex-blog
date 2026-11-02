#!/usr/bin/env bash
# QA/UAT -> PROD hotfix: both apps, including Supporting Objects by default.
# Deliberately separate from DEV/TEST, APEXLang and release packaging.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"

case "${1:-}" in
    export)
        (( $# == 1 )) || die "Usage: hotfix.sh export"
        mkdir -p -- "$buildDir"
        staging="$(mktemp -d "$buildDir/.hotfix.XXXXXXXX")"
        trap 'rm -rf -- "$staging"' EXIT
        for i in "${!uatAppIds[@]}"; do
            id="${uatAppIds[$i]}"
            printf 'apex export -applicationid %s -exptype SQL -expsupportingobjects Y -exppubreports -dir %s\n' \
                "$id" "$(sqlcl_arg "$staging")" >"$staging/export-$i.sqlcl"
            log "Exporting QA/UAT ${appAliases[$i]} (application $id)"
            run_sqlcl "$uatDbConnName" "$staging/export-$i.log" "$staging/export-$i.sqlcl" \
                || die "QA/UAT export failed: ${appAliases[$i]}"
            require_file "$staging/f${id}.sql"
        done
        # Replace the previous hotfix only when BOTH exports have succeeded.
        rm -rf -- "$buildDir/hotfix"
        mv -- "$staging" "$buildDir/hotfix"
        trap - EXIT
        log "Both QA/UAT application exports are in $buildDir/hotfix"
        ;;
    production)
        # By default run the exported Supporting Objects install/upgrade scripts.
        # The only opt-out is explicit, and is valid only for production import.
        install_supporting_objects=true
        if (( $# != 1 )); then
            (( $# == 2 )) && [[ "$2" == '--skip-supporting-objects' ]] \
                || die 'Usage: hotfix.sh production [--skip-supporting-objects]'
            install_supporting_objects=false
        fi
        for id in "${uatAppIds[@]}"; do
            require_file "$buildDir/hotfix/f${id}.sql"
        done
        log "Production hotfix: automatic Supporting Objects installation = $install_supporting_objects"
        for i in "${!uatAppIds[@]}"; do
            file="$buildDir/hotfix/f${uatAppIds[$i]}.sql"
            require_file "$file"
            cat >"$buildDir/hotfix/import-$i.sqlcl" <<SQL
begin
  apex_application_install.set_workspace('$prdWorkspace');
  apex_application_install.set_schema('$prdDbSchema');
  apex_application_install.set_application_id(${prdAppIds[$i]});
  apex_application_install.generate_offset;
  apex_application_install.set_auto_install_sup_obj($install_supporting_objects);
end;
/
@$(sqlcl_arg "$file")
SQL
            log "Importing QA/UAT ${appAliases[$i]} as production application ${prdAppIds[$i]}"
            run_sqlcl "$prdDbConnName" "$buildDir/hotfix/production-$i.log" \
                "$buildDir/hotfix/import-$i.sqlcl" \
                || die "Production import failed: ${appAliases[$i]}"
        done
        log 'Both QA/UAT applications imported into production'
        ;;
    *)
        printf 'Usage: %s export\n       %s production [--skip-supporting-objects]\n' "$0" "$0" >&2
        exit 2
        ;;
esac
