#!/usr/bin/env bash
# Export APEXlang source (not split SQL) and SQL-format packaged release files.
# See AGENT.md for workflow, safety and synchronization guidance.
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/lib/candidate_publish.sh"

# Direct callers must choose one operation; doing both implicitly could
# refresh tracked APEXLang and publish a release in the same invocation.
mode=''
overwrite=false
usage='Usage: export_application.sh (--source-only|--build-only) [--overwrite (requires --build-only)]'
for opt in "$@"; do
    case "$opt" in
        --source-only)
            [[ -z "$mode" ]] || die 'Only one export mode is accepted'
            mode=source ;;
        --build-only)
            [[ -z "$mode" ]] || die 'Only one export mode is accepted'
            mode=build ;;
        --overwrite) $overwrite && die 'Duplicate --overwrite'; overwrite=true ;;
        *) die "$usage" ;;
    esac
done
if $overwrite && [[ "$mode" != build ]]; then
    die '--overwrite requires --build-only; never overwrite a candidate while refreshing APEXLang source'
fi
[[ -n "$mode" ]] || die "$usage"
require_tool "$sqlcl_bin"
require_tool rsync
require_tool python3
if [[ "$mode" == build ]]; then
    # Reject incomplete Git-owned uninstall SQL before contacting DEV or building.
    python3 "$SCRIPT_DIR/lib/check_deinstall.py" \
        "$SCRIPT_DIR/schema/install.list" "$scriptSourceDir" "$deinstallSqlScript" \
        || die 'Release deinstall SQL is inconsistent with schema sources'
    python3 "$SCRIPT_DIR/lib/metadata_source.py" check --repo "$repoHome" \
        || die 'Release metadata is inconsistent with VERSION.txt or missing'
    require_tool zip
    release_version="$(read_release_version)"
    slug="${release_version#Release }"
    target="$buildDir/releases/$slug"
    # Acquire the release lock and validate overwrite eligibility before
    # contacting DEV or generating any release artifacts.
    candidate_publish_preflight "$target" "$overwrite" "$release_version"
fi

mkdir -p -- "$buildDir"
run_dir="$(mktemp -d "${TMPDIR:-/tmp}/apex-blog-export.XXXXXXXX")"
trap 'rm -rf -- "$run_dir"' EXIT
mkdir -p -- "$run_dir/apexlang" "$run_dir/sql" "$run_dir/logs" "$run_dir/out"

check_environment "$devDbConnName" "$devWorkspace" "$devDbSchema" "$run_dir/logs/check-dev.log"
if [[ "$mode" == build ]]; then
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

    if [[ "$mode" == build ]]; then
        # Supporting Objects SQL (Git-owned schema, deinstall and metadata) and
        # application static assets are owned by Git, not by an APEXlang export. Detect *any* DEV drift (including
        # binary files and missing/extra files) before building a release.
        python3 "$SCRIPT_DIR/lib/check_preserved_parity.py" "$repo_dir" "$app_dir" \
            || die "Locally maintained Supporting Objects / static files differ for $alias. Aborting release."
        diff -qr --exclude=deployments "$repo_dir" "$app_dir" >"$run_dir/logs/source-diff-$id.log" \
            || {
                head -n 35 "$run_dir/logs/source-diff-$id.log" >&2
                die "APEXlang source $alias differs from DEV. Export source or import local edits first."
            }
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

if [[ "$mode" == source ]]; then
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
# fail before publishing any candidate, without modifying local APEXLang.
if [[ "$mode" == build ]]; then
    python3 "$SCRIPT_DIR/lib/check_source_consistency.py" \
        --repo "$repoHome" --apps-dir "$apexSourceDir" \
        --dev-ids "${devAppIds[@]}" --mode release \
        || die 'Release source consistency failed; run prepare-release, supporting and source as appropriate'
fi

if [[ "$mode" == build ]]; then
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
if [[ "$mode" == source ]]; then
    for alias in "${appAliases[@]}"; do
        log "Synchronizing APEXlang source: applications/$alias"
        rsync -r --checksum --delete "$run_dir/merged/$alias/" "$apexSourceDir/$alias/"
    done
fi

if [[ "$mode" == build ]]; then
    candidate_publish_release "$target" "$run_dir/out" "$run_dir"
fi
log "Completed mode: $mode"
