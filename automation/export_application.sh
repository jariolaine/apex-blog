#!/usr/bin/env bash
# Export APEXlang source (not split SQL) and SQL-format packaged release files.
# See AGENT.md for workflow, safety and synchronization guidance.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"

mode=all
overwrite=false
mode_option_seen=false
for opt in "$@"; do
    case "$opt" in
        --source-only|--build-only)
            $mode_option_seen && die 'Only one export mode is accepted'
            mode_option_seen=true
            if [[ "$opt" == --source-only ]]; then mode=source; else mode=build; fi ;;
        --overwrite) $overwrite && die 'Duplicate --overwrite'; overwrite=true ;;
        *) die 'Usage: export_application.sh [--source-only|--build-only] [--overwrite (requires --build-only)]' ;;
    esac
done
if $overwrite && [[ "$mode" != build ]]; then
    die '--overwrite requires --build-only; never overwrite a candidate while refreshing APEXLang source'
fi
require_tool "$sqlcl_bin"
require_tool rsync
require_tool python3
if [[ "$mode" != source ]]; then
    # Reject incomplete Git-owned uninstall SQL before contacting DEV or building.
    python3 "$SCRIPT_DIR/lib/check_deinstall.py" \
        "$SCRIPT_DIR/schema/install.list" "$scriptSourceDir" "$deinstallSqlScript" \
        || die 'Release deinstall SQL is inconsistent with schema sources'
    require_tool zip
    release_version="$(read_release_version)"
    slug="${release_version#Release }"
    target="$buildDir/releases/$slug"
    # Readers hold shared locks through TEST/QA/production imports. If anyone
    # is deploying this candidate, refuse the rebuild instead of racing it.
    acquire_release_lock "$target" exclusive
    if [[ -L "$target" || ( -e "$target" && ! -d "$target" ) ]]; then
        die "Unsafe release candidate target (not a real directory): $target"
    fi
    if [[ -e "$target" ]]; then
        $overwrite || die "Release candidate already exists; it will not be overwritten: $target (use make build OVERWRITE=YES)"
        # Never replace a random user-created directory under build/releases/.
        [[ -f "$target/manifest.json" && ! -L "$target/manifest.json" && -f "$target/VERSION.txt" && ! -L "$target/VERSION.txt" ]] \
            || die "Refusing to overwrite unrecognized release directory: $target"
        [[ "$(<"$target/VERSION.txt")" == "$release_version" ]] \
            || die "Refusing to overwrite candidate with a different VERSION.txt: $target"
    fi
fi

mkdir -p -- "$buildDir"
run_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-export.XXXXXXXX")"
trap 'rm -rf -- "$run_dir"' EXIT
mkdir -p -- "$run_dir/apexlang" "$run_dir/sql" "$run_dir/logs" "$run_dir/out"

check_environment "$devDbConnName" "$devWorkspace" "$devDbSchema" "$run_dir/logs/check-dev.log"
if [[ "$mode" != source ]]; then
    check_dev_release_version "$devDbConnName" "$devWorkspace" \
        "${devAppIds[0]}" "${devAppIds[1]}" "$run_dir/logs"
fi

for i in "${!devAppIds[@]}"; do
    id="${devAppIds[$i]}"
    alias="${appAliases[$i]}"
    app_dir="$run_dir/apexlang/$alias"
    repo_dir="$apexSourceDir/$alias"
    [[ -f "$repo_dir/application.apx" ]] || die "Missing APEXlang source: $repo_dir"

    # SQLcl merges an existing default deployment configuration on export.
    # This retains the repository's pinned DEV application ID and other overrides.
    mkdir -p -- "$app_dir/deployments"
    if [[ -f "$repo_dir/deployments/default.json" ]]; then
        cp -- "$repo_dir/deployments/default.json" "$app_dir/deployments/default.json"
    fi
    cat >"$run_dir/export-${id}.sqlcl" <<SQL
apex export -applicationid $id -exptype APEXLANG -expsupportingobjects Y -dir "$run_dir/apexlang"
SQL
    log "Exporting APEXlang application $id ($alias)"
    run_sqlcl "$devDbConnName" "$run_dir/logs/export-apexlang-$id.log" "$run_dir/export-$id.sqlcl" \
        || die "APEXlang export failed: $alias"
    # SQLcl names the child folder after the APEX alias. Some releases retain
    # its uppercase spelling; normalize it to this repository's lowercase name.
    if [[ ! -f "$app_dir/application.apx" ]]; then
        for exported_dir in "$run_dir/apexlang/"*; do
            [[ -d "$exported_dir" && -f "$exported_dir/application.apx" ]] || continue
            candidate_alias="${exported_dir##*/}"
            if [[ "${candidate_alias,,}" == "${alias,,}" && "$exported_dir" != "$app_dir" ]]; then
                rsync -r --checksum "$exported_dir/" "$app_dir/"
                rm -rf -- "$exported_dir"
                break
            fi
        done
    fi
    require_file "$app_dir/application.apx"
    # Keep deployment overrides owned by the repository even if SQLcl created
    # a different alias-cased folder and therefore could not merge them.
    if [[ -f "$repo_dir/deployments/default.json" ]]; then
        cp -- "$repo_dir/deployments/default.json" "$app_dir/deployments/default.json"
    fi
    require_file "$app_dir/.apex/apexlang.json"
    require_file "$app_dir/supporting-objects/supporting-objects.apx"

    # SQLcl validation, not just shell checks. Errors may not always return
    # nonzero from a SQLcl command, so also check its positive success marker.
    cat >"$run_dir/validate-${id}.sqlcl" <<SQL
apex validate -input "$app_dir"
SQL
    log "Validating exported APEXlang: $alias"
    run_sqlcl_nolog "$run_dir/logs/validate-$id.log" "$run_dir/validate-$id.sqlcl" \
        || die "APEXlang validation failed: $alias"
    grep -qi 'Validation successful' "$run_dir/logs/validate-$id.log" \
        || die "SQLcl did not confirm validation success: $alias (see log)"

    if [[ "$mode" != source ]]; then
        # Supporting Objects SQL (Git schema/deinstall + BUILD_API metadata) and
        # application static assets are owned by Git, not by an APEXlang export. Detect *any* DEV drift (including
        # binary files and missing/extra files) before building a release.
        python3 "$SCRIPT_DIR/lib/check_preserved_parity.py" "$repo_dir" "$app_dir" \
            || die "Locally maintained Supporting Objects / static files differ for $alias. Aborting release."
        if [[ "$mode" == build ]]; then
            diff -qr --exclude=deployments "$repo_dir" "$app_dir" >"$run_dir/logs/source-diff-$id.log" \
                || {
                    head -n 35 "$run_dir/logs/source-diff-$id.log" >&2
                    die "APEXlang source $alias differs from DEV. Export source or import local edits first."
                }
        fi
        cat >"$run_dir/export-sql-${id}.sqlcl" <<SQL
apex export -applicationid $id -exptype SQL -expsupportingobjects Y -exppubreports -skipExportDate -dir "$run_dir/sql"
SQL
        log "Exporting packaged SQL application $id with Supporting Objects"
        run_sqlcl "$devDbConnName" "$run_dir/logs/export-sql-$id.log" "$run_dir/export-sql-${id}.sqlcl" \
            || die "Packaged SQL export failed: $alias"
        require_file "$run_dir/sql/f${id}.sql"
        cp -- "$run_dir/sql/f${id}.sql" "$run_dir/out/${releaseSqlNames[$i]}"
    fi
done

if [[ "$mode" != build ]]; then
    # Assemble complete APEXlang trees in temporary space. Preserve tracked
    # Supporting Objects SQL and local static assets (CSS, JS, images, etc.).
    # This avoids overwriting files authored in Git with older DEV copies.
    for i in "${!devAppIds[@]}"; do
        alias="${appAliases[$i]}"
        candidate="$run_dir/merged/$alias"
        mkdir -p -- "$candidate"
        cp -R -- "$apexSourceDir/$alias/." "$candidate/"
        rsync -r --checksum --delete \
            --exclude='/deployments/' --exclude='*.sql' \
            --exclude='/shared-components/static-files/' \
            "$run_dir/apexlang/$alias/" "$candidate/"
        # Keep all existing SQL content, but pick up new SQL exported by DEV.
        rsync -r --checksum --ignore-existing \
            --include='*/' --include='*.sql' --exclude='*' \
            "$run_dir/apexlang/$alias/" "$candidate/"
        # Same semantics for application static files: the repository is the
        # source of truth for existing bytes, including minified CSS/JS and PNGs.
        # Newly exported assets are added; missing assets are NOT deleted.
        exported_static="$run_dir/apexlang/$alias/shared-components/static-files"
        if [[ -d "$exported_static" ]]; then
            mkdir -p -- "$candidate/shared-components/static-files"
            rsync -r --checksum --ignore-existing \
                "$exported_static/" "$candidate/shared-components/static-files/"
        fi
        printf 'apex validate -input "%s"\n' "$candidate" >"$run_dir/validate-merged-${i}.sqlcl"
        run_sqlcl_nolog "$run_dir/logs/validate-merged-${i}.log" "$run_dir/validate-merged-${i}.sqlcl" \
            || die "Validation failed for merged local source: $alias"
        grep -qi 'Validation successful' "$run_dir/logs/validate-merged-${i}.log" \
            || die "Merged APEXlang source not validated: $alias"
    done
fi

# Strict release readiness is separate from work-in-progress source validation:
# fail before modifying local APEXLang or publishing any candidate.
if [[ "$mode" != source ]]; then
    if [[ "$mode" == build ]]; then
        consistency_apps="$apexSourceDir"
    else
        consistency_apps="$run_dir/merged"
    fi
    python3 "$SCRIPT_DIR/lib/check_source_consistency.py" \
        --repo "$repoHome" --apps-dir "$consistency_apps" \
        --dev-ids "${devAppIds[@]}" --mode release \
        || die 'Release source consistency failed; run prepare-release, supporting and source as appropriate'
fi

if [[ "$mode" != source ]]; then
    for f in README.md LICENSE.txt VERSION.txt; do
        require_file "$repoHome/$f"
        cp -- "$repoHome/$f" "$run_dir/out/$f"
    done
    (
        cd "$run_dir/out"
        zip -q -j "$releaseZipName" \
            README.md LICENSE.txt VERSION.txt "${releaseSqlNames[@]}"
    )
    [[ -d "$stackSrc" ]] || die "Stack source directory not found: $stackSrc"
    mkdir -p "$run_dir/Stack"
    # Never distribute local Terraform state, provider caches or credentials.
    rsync -r --exclude='/.terraform/' --exclude='*.tfstate' \
        --exclude='*.tfstate.*' --exclude='*.tfvars' --exclude='*.tfvars.json' --exclude='.env*' \
        "$stackSrc/" "$run_dir/Stack/"
    cp -- "$repoHome/VERSION.txt" "$run_dir/Stack/VERSION.txt"
    (
        cd "$run_dir/Stack"
        zip -q -r "$run_dir/out/$stackZipName" .
    )
fi

# Publish once every requested output has been generated AND validated.
if [[ "$mode" != build ]]; then
    for alias in "${appAliases[@]}"; do
        log "Synchronizing APEXlang source: applications/$alias"
        rsync -r --checksum --delete "$run_dir/merged/$alias/" "$apexSourceDir/$alias/"
    done
fi

if [[ "$mode" != source ]]; then
    # Bind packaged SQL, sources and version metadata in one checksummed
    # manifest. An explicit --overwrite only replaces this version's local
    # candidate after the complete replacement is staged and verified.
    python3 "$SCRIPT_DIR/lib/release_manifest.py" create \
        --dir "$run_dir/out" --repo "$repoHome" \
        --sql-names "${releaseSqlNames[@]}" --dev-ids "${devAppIds[@]}" \
        --zip-name "$releaseZipName" --stack-name "$stackZipName" \
        || die 'Cannot create release manifest'
    mkdir -p -- "$buildDir/releases"
    stage=''
    backup=''
    replaced_old=false
    published_new=false
    publish_completed=false
    finish_candidate() {
        local rc=$?
        trap - EXIT
        # On failure restore the old candidate before discarding the backup.
        # No other cooperating process can use target while our exclusive
        # flock is held. Keep a backup on disk if restoration itself fails.
        if [[ "$publish_completed" != true ]]; then
            # The existence of the backup itself is authoritative; a signal
            # may arrive between a successful mv and updating a shell flag.
            if [[ -n "$backup" && -d "$backup" && ! -L "$backup" ]]; then
                # Never delete an unrelated directory that appeared while
                # publishing; only remove our own staged replacement.
                if [[ -d "$target" && ! -L "$target" &&
                      ( "$published_new" == true || ( -n "$stage" && ! -e "$stage" ) ) ]]; then
                    rm -rf -- "$target" || log "Cannot remove failed candidate: $target"
                fi
                if [[ ! -e "$target" && ! -L "$target" ]]; then
                    mv -T -- "$backup" "$target" \
                        && log "Restored previous release candidate: $target" \
                        || log "RESTORE FAILED: previous candidate retained at $backup"
                else
                    log "RESTORE BLOCKED: previous candidate retained at $backup"
                fi
            elif [[ "$published_new" == true || ( -n "$stage" && ! -e "$stage" ) ]]; then
                # Initial candidate published but not verified; no old one.
                if [[ -d "$target" && ! -L "$target" ]]; then
                    rm -rf -- "$target" || log "Cannot remove failed candidate: $target"
                fi
            fi
        fi
        [[ -z "$stage" || ! -d "$stage" || -L "$stage" ]] || rm -rf -- "$stage"
        rm -rf -- "$run_dir"
        return "$rc"
    }
    trap finish_candidate EXIT
    trap 'exit 130' INT
    trap 'exit 143' TERM
    stage="$(mktemp -d "$buildDir/releases/.candidate.XXXXXXXX")"
    cp -R -- "$run_dir/out/." "$stage/"
    python3 "$SCRIPT_DIR/lib/release_manifest.py" verify \
        --dir "$stage" --staging || die 'Staged release candidate failed verification'

    if [[ -d "$target" ]]; then
        # Rename the old candidate out of the way; never delete it until the
        # replacement has passed its final verification. Both remain within
        # the same filesystem for atomic directory renames.
        backup="$(mktemp -d "$buildDir/releases/.backup.XXXXXXXX")"
        rmdir -- "$backup"
        mv -T -- "$target" "$backup"
        replaced_old=true
    fi
    # New candidates are also published via a staged rename. The build lock
    # excludes other builds and all deployments using this repository.
    [[ ! -e "$target" && ! -L "$target" ]] \
        || die "Release candidate appeared while publishing: $target"
    mv -nT -- "$stage" "$target"
    [[ ! -d "$stage" ]] || die "Release candidate appeared while publishing: $target"
    stage=''
    published_new=true
    python3 "$SCRIPT_DIR/lib/release_manifest.py" verify --dir "$target" \
        || die 'Published release failed verification'
    publish_completed=true
    if $replaced_old; then
        rm -rf -- "$backup" || log "Old backup could not be removed: $backup"
        log "Local release candidate safely replaced: $target (retest before promotion)"
    else
        log "Immutable release candidate created: $target"
    fi
fi
log "Completed mode: $mode"
