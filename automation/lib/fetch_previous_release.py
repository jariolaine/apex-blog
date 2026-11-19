#!/usr/bin/env python3
"""Fetch the authoritative published GitHub release for disposable TEST upgrades.

The official APEX Blog GitHub repository, not an arbitrary ZIP or URL supplied
by a caller, defines the previous release. The tag must be reachable from
master. Published SHA-256 checksums are always verified if available;
requiring their presence is controlled by automation/variables.sh. All files
remain in the caller's disposable work directory.
"""

import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path
from urllib.parse import quote, unquote, urlsplit
from zipfile import BadZipFile, ZipFile

from extract_previous_release import checked_entry, version_key

OWNER = 'jariolaine'
REPOSITORY = 'apex-blog'
ASSET_NAME = 'apex-blog-latest.zip'
API_ROOT = f'https://api.github.com/repos/{OWNER}/{REPOSITORY}'
MAX_ZIP_BYTES = 250 * 1024 * 1024
MAX_CHECKSUM_BYTES = 128 * 1024
TAG_VERSION = re.compile(r'^(?:v|Release[ _-]?)?([0-9]+(?:\.[0-9]+)+\.[0-9]{8})$')
SHA = re.compile(r'^[0-9a-f]{40}$')
DIGEST = re.compile(r'^sha256:([0-9a-f]{64})$')


class ReleaseError(ValueError):
    """Invalid or inaccessible official release; do not mutate TEST."""


def curl(url: str, output: Path | None = None) -> bytes:
    command = [
        'curl', '--fail', '--silent', '--show-error', '--location', '--retry', '3',
        '--connect-timeout', '15', '--max-time', '180',
        '--proto', '=https', '--proto-redir', '=https',
        '--header', 'Accept: application/vnd.github+json',
    ]
    if output is not None:
        command.extend(['--output', str(output)])
    command.append(url)
    try:
        result = subprocess.run(command, check=False, capture_output=True, timeout=205)
    except (OSError, subprocess.TimeoutExpired) as exc:
        raise ReleaseError(f'GitHub request could not be completed: {exc}') from exc
    if result.returncode:
        error = result.stderr.decode('utf-8', 'replace').strip()
        raise ReleaseError(f'GitHub release request failed ({result.returncode}): {error[:500]}')
    return result.stdout


def json_api(path: str) -> dict:
    try:
        response = json.loads(curl(f'{API_ROOT}/{path}'))
    except ReleaseError:
        raise
    except (ValueError, UnicodeDecodeError) as exc:
        raise ReleaseError('GitHub returned invalid release metadata') from exc
    if not isinstance(response, dict):
        raise ReleaseError('GitHub metadata is not an object')
    return response


def release_asset(release: dict, name: str) -> dict | None:
    assets = release.get('assets')
    if not isinstance(assets, list):
        raise ReleaseError('GitHub release has no asset list')
    matches = [asset for asset in assets
               if isinstance(asset, dict) and asset.get('name') == name]
    if len(matches) > 1:
        raise ReleaseError(f'Duplicate GitHub release asset: {name}')
    return matches[0] if matches else None


def asset_url(asset: dict, tag: str, name: str) -> str:
    # Do not allow a metadata response to redirect this workflow to an
    # unrelated host/repository/path, even for a checksum sidecar.
    raw = asset.get('browser_download_url')
    if not isinstance(raw, str):
        raise ReleaseError(f'No GitHub download URL for {name}')
    url = urlsplit(raw)
    pieces = [unquote(part) for part in url.path.split('/') if part]
    expected = [OWNER, REPOSITORY, 'releases', 'download', tag, name]
    if (url.scheme != 'https' or url.netloc != 'github.com' or
            pieces != expected or url.query or url.fragment or
            asset.get('state') != 'uploaded'):
        raise ReleaseError(f'Untrusted GitHub download URL for {name}')
    return raw


def sha256_required() -> bool:
    # The normal Make/shell entry points read this from variables.sh and pass
    # it internally; deliberately no Make, MCP or resolver CLI option exists.
    choice = os.environ.get('APEX_BLOG_REQUIRE_GITHUB_SHA256', 'NO')
    if choice not in ('YES', 'NO'):
        raise ReleaseError('requireGithubReleaseSha256 in variables.sh must be YES or NO')
    return choice == 'YES'


def asset_digest(release: dict, asset: dict, tag: str, required: bool) -> str | None:
    supplied = asset.get('digest')
    if supplied is not None:
        if not isinstance(supplied, str) or not DIGEST.fullmatch(supplied.lower()):
            raise ReleaseError('Malformed GitHub SHA-256 asset digest')
        return DIGEST.fullmatch(supplied.lower()).group(1)
    # Some historical GitHub releases predate asset digests. An attached
    # SHA256SUMS published with that same GitHub Release is the fallback.
    sums = release_asset(release, 'SHA256SUMS')
    if sums is None:
        if required:
            raise ReleaseError('Published GitHub release lacks SHA-256 digest and SHA256SUMS asset '
                               '(requireGithubReleaseSha256=YES)')
        print('[apex-blog] WARNING: Official GitHub release has no published SHA-256 '
              '(requireGithubReleaseSha256=NO); archive integrity cannot be '
              'independently verified against a published checksum', file=sys.stderr)
        return None
    content = curl(asset_url(sums, tag, 'SHA256SUMS'))
    if len(content) > MAX_CHECKSUM_BYTES:
        raise ReleaseError('GitHub SHA256SUMS asset is unexpectedly large')
    try:
        lines = content.decode('utf-8').splitlines()
    except UnicodeDecodeError as exc:
        raise ReleaseError('GitHub SHA256SUMS is not UTF-8') from exc
    matches = []
    for line in lines:
        item = re.fullmatch(r'([a-fA-F0-9]{64})\s+\*?apex-blog-latest\.zip', line.strip())
        if item:
            matches.append(item.group(1).lower())
    if len(matches) != 1:
        raise ReleaseError('SHA256SUMS does not uniquely identify apex-blog-latest.zip')
    return matches[0]


def tagged_version(tag: str) -> str:
    match = TAG_VERSION.fullmatch(tag)
    if not match:
        raise ReleaseError(f'GitHub release tag does not identify an application version: {tag!r}')
    candidate = f'Release {match.group(1)}'
    version_key(candidate.encode(), 'GitHub tag')
    return candidate


def verified_release() -> tuple[str, str, str | None, str]:
    release = json_api('releases/latest')
    if release.get('draft') is not False or release.get('prerelease') is not False:
        raise ReleaseError('GitHub latest must be a published, stable release')
    tag = release.get('tag_name')
    if not isinstance(tag, str) or not tag or len(tag) > 120:
        raise ReleaseError('GitHub release has no valid tag')
    version = tagged_version(tag)
    # Resolve annotated *and* lightweight tags to their commit. A release's
    # target_commitish field is not proof that an existing tag is on master.
    commit = json_api(f'commits/{quote(tag, safe="")}').get('sha')
    if not isinstance(commit, str) or not SHA.fullmatch(commit.lower()):
        raise ReleaseError('Could not resolve the published tag to a Git commit')
    commit = commit.lower()
    comparison = json_api(f'compare/{commit}...master')
    if (comparison.get('status') not in ('ahead', 'identical') or
            comparison.get('behind_by') != 0 or
            not isinstance(comparison.get('merge_base_commit'), dict) or
            comparison['merge_base_commit'].get('sha', '').lower() != commit or
            not isinstance(comparison.get('base_commit'), dict) or
            comparison['base_commit'].get('sha', '').lower() != commit):
        raise ReleaseError(f'GitHub release tag {tag!r} is not an ancestor of master')
    asset = release_asset(release, ASSET_NAME)
    if not asset:
        raise ReleaseError(f'Published GitHub release {tag} lacks {ASSET_NAME}')
    size = asset.get('size')
    if not isinstance(size, int) or not 0 < size <= MAX_ZIP_BYTES:
        raise ReleaseError('GitHub release ZIP size is invalid or too large')
    digest = asset_digest(release, asset, tag, sha256_required())
    return tag, version, digest, asset_url(asset, tag, ASSET_NAME)


def fetch(candidate_file: Path, output: Path, allow_equal: bool) -> None:
    candidate = version_key(candidate_file.read_bytes(), 'candidate VERSION.txt')
    tag, version, digest, url = verified_release()
    previous = version_key(version.encode(), 'GitHub release tag')
    if previous > candidate or (previous == candidate and not allow_equal):
        raise ReleaseError('GitHub release must be older than the candidate'
                           + (' or equal for DEV pretest' if allow_equal else ''))
    if output.exists() and (not output.is_dir() or any(output.iterdir())):
        raise ReleaseError('Previous release output directory must be empty')
    output.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='.github-release-', dir=output.parent) as directory:
        temporary = Path(directory)
        archive_file = temporary / ASSET_NAME
        curl(url, archive_file)
        if not archive_file.is_file() or archive_file.stat().st_size > MAX_ZIP_BYTES:
            raise ReleaseError('GitHub release ZIP missing or unexpectedly large')
        with archive_file.open('rb') as stream:
            sha = hashlib.file_digest(stream, 'sha256').hexdigest()
        if digest is not None and sha != digest:
            raise ReleaseError('GitHub release ZIP SHA-256 checksum mismatch')
        with ZipFile(archive_file) as archive:
            sql_names = ('blog-administration-latest.sql', 'blog-public-pages-latest.sql')
            sql_entries = [checked_entry(archive, name, 100 * 1024 * 1024)
                           for name in sql_names]
            versions = [item for item in archive.infolist() if item.filename == 'VERSION.txt']
            if versions:
                entry = checked_entry(archive, 'VERSION.txt', 256)
                zip_version = archive.read(entry)
                if version_key(zip_version, 'GitHub ZIP VERSION.txt') != previous:
                    raise ReleaseError('GitHub release ZIP version disagrees with published tag')
            # Older published assets may omit VERSION.txt. Only the verified
            # official GitHub tag may supply it, never a local filename.
            for entry in sql_entries:
                data = archive.read(entry)
                if not data:
                    raise ReleaseError(f'Empty release SQL file: {entry.filename}')
                (temporary / entry.filename).write_bytes(data)
            (temporary / 'VERSION.txt').write_text(version + '\n', encoding='utf-8')
        output.mkdir(parents=True, exist_ok=True)
        for name in (*sql_names, 'VERSION.txt'):
            (temporary / name).replace(output / name)
    status = 'verified' if digest is not None else 'unverified (no published checksum)'
    print(f'[apex-blog] Official GitHub release: tag={tag}, commit on master, '
          f'version={version}, downloaded_sha256={sha}, checksum={status}', file=sys.stderr)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--candidate-version-file', required=True, type=Path)
    parser.add_argument('--output-dir', required=True, type=Path)
    parser.add_argument('--allow-equal-version', action='store_true',
                        help='Only DEV pretest: permit same app version after an APEX upgrade')
    args = parser.parse_args()
    try:
        fetch(args.candidate_version_file, args.output_dir, args.allow_equal_version)
    except (ReleaseError, ValueError, OSError, BadZipFile, subprocess.SubprocessError) as exc:
        parser.exit(1, f'[apex-blog] Official GitHub previous release unavailable: {exc}\n')


if __name__ == '__main__':
    main()
