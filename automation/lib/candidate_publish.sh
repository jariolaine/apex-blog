#!/usr/bin/env bash
# Release-candidate publication, sourced by export_application.sh AFTER common.sh.
# Do not run in a subprocess: the exclusive flock and EXIT/signal traps must
# remain in the exporter's shell until publication and cleanup finish.
# The caller uses set -Eeuo pipefail and supplies Git-owned release artifacts.

# Lock the candidate BEFORE exporting from DEV. No non-cooperating process can
# be prevented from editing build/releases, but builds and deployments using
# this repository share the same persistent lock file.
candidate_publish_preflight() {
    local target="$1" overwrite="$2" release_version="$3"
    acquire_release_lock "$target" exclusive
    if [[ -L "$target" || ( -e "$target" && ! -d "$target" ) ]]; then
        die "Unsafe release candidate target (not a real directory): $target"
    fi
    if [[ -e "$target" ]]; then
        $overwrite || die "Release candidate already exists; it will not be overwritten: $target (use make build OVERWRITE=YES)"
        # Never replace an unrecognized directory under build/releases/.
        [[ -f "$target/manifest.json" && ! -L "$target/manifest.json" && -f "$target/VERSION.txt" && ! -L "$target/VERSION.txt" ]] \
            || die "Refusing to overwrite unrecognized release directory: $target"
        [[ "$(<"$target/VERSION.txt")" == "$release_version" ]] \
            || die "Refusing to overwrite candidate with a different VERSION.txt: $target"
    fi
}

# EXIT runs in the same shell as the publisher, including when interrupted
# between a directory rename and the flag update. Globals are intentional:
# Bash local variables in candidate_publish_release() are gone by shell EXIT.
candidate_publish_finish() {
    local rc=$?
    trap - EXIT
    if [[ "$candidate_publish_completed" != true ]]; then
        # The backup's existence is authoritative, even if a signal arrives
        # before the caller records that the previous candidate was moved.
        if [[ -n "$candidate_publish_backup" && -d "$candidate_publish_backup" && ! -L "$candidate_publish_backup" ]]; then
            # Never remove an unrelated directory that appeared in the target.
            if [[ -d "$candidate_publish_target" && ! -L "$candidate_publish_target" &&
                  ( "$candidate_publish_new" == true || ( -n "$candidate_publish_stage" && ! -e "$candidate_publish_stage" ) ) ]]; then
                rm -rf -- "$candidate_publish_target" || log "Cannot remove failed candidate: $candidate_publish_target"
            fi
            if [[ ! -e "$candidate_publish_target" && ! -L "$candidate_publish_target" ]]; then
                mv -T -- "$candidate_publish_backup" "$candidate_publish_target" \
                    && log "Restored previous release candidate: $candidate_publish_target" \
                    || log "RESTORE FAILED: previous candidate retained at $candidate_publish_backup"
            else
                log "RESTORE BLOCKED: previous candidate retained at $candidate_publish_backup"
            fi
        elif [[ "$candidate_publish_new" == true || ( -n "$candidate_publish_stage" && ! -e "$candidate_publish_stage" ) ]]; then
            # A new candidate was published but not verified; no old one.
            if [[ -d "$candidate_publish_target" && ! -L "$candidate_publish_target" ]]; then
                rm -rf -- "$candidate_publish_target" || log "Cannot remove failed candidate: $candidate_publish_target"
            fi
        fi
    fi
    [[ -z "$candidate_publish_stage" || ! -d "$candidate_publish_stage" || -L "$candidate_publish_stage" ]] \
        || rm -rf -- "$candidate_publish_stage"
    rm -rf -- "$candidate_publish_run_dir"
    return "$rc"
}

# Build the source-bound manifest, verify a complete staged candidate, then
# publish by same-filesystem renames and verify again. On any failure the EXIT
# handler restores the previous verified candidate while the lock is held.
candidate_publish_release() {
    local target="$1" output_dir="$2" run_dir="$3"

    python3 "$SCRIPT_DIR/lib/release_manifest.py" create \
        --dir "$output_dir" --repo "$repoHome" \
        --sql-names "${releaseSqlNames[@]}" --dev-ids "${devAppIds[@]}" \
        --zip-name "$releaseZipName" --stack-name "$stackZipName" \
        || die 'Cannot create release manifest'

    mkdir -p -- "$buildDir/releases"
    candidate_publish_target="$target"
    candidate_publish_run_dir="$run_dir"
    candidate_publish_stage=''
    candidate_publish_backup=''
    candidate_publish_replaced=false
    candidate_publish_new=false
    candidate_publish_completed=false
    # Replaces the exporter's simple run-dir cleanup only after all state has
    # been initialized; it also removes the run dir on normal successful exit.
    trap candidate_publish_finish EXIT
    trap 'exit 130' INT
    trap 'exit 143' TERM

    candidate_publish_stage="$(mktemp -d "$buildDir/releases/.candidate.XXXXXXXX")"
    cp -R -- "$output_dir/." "$candidate_publish_stage/"
    python3 "$SCRIPT_DIR/lib/release_manifest.py" verify \
        --dir "$candidate_publish_stage" --staging \
        || die 'Staged release candidate failed verification'

    if [[ -d "$target" ]]; then
        # Never delete the prior candidate until the replacement is verified.
        candidate_publish_backup="$(mktemp -d "$buildDir/releases/.backup.XXXXXXXX")"
        rmdir -- "$candidate_publish_backup"
        mv -T -- "$target" "$candidate_publish_backup"
        candidate_publish_replaced=true
    fi

    [[ ! -e "$target" && ! -L "$target" ]] \
        || die "Release candidate appeared while publishing: $target"
    mv -nT -- "$candidate_publish_stage" "$target"
    [[ ! -d "$candidate_publish_stage" ]] \
        || die "Release candidate appeared while publishing: $target"
    # Keep the vanished staging path recorded until the published flag is set:
    # EXIT can then identify our replacement in either instruction window.
    candidate_publish_new=true
    candidate_publish_stage=''
    python3 "$SCRIPT_DIR/lib/release_manifest.py" verify --dir "$target" \
        || die 'Published release failed verification'
    candidate_publish_completed=true
    if $candidate_publish_replaced; then
        rm -rf -- "$candidate_publish_backup" || log "Old backup could not be removed: $candidate_publish_backup"
        log "Local release candidate safely replaced: $target (retest before promotion)"
    else
        log "Immutable release candidate created: $target"
    fi
}
