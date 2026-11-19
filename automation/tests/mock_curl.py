#!/usr/bin/env python3
"""Private GitHub API / release-asset stand-in for mocked workflow tests."""
import hashlib
import json
import os
from pathlib import Path
import shutil
import sys
from urllib.parse import quote, unquote

args = sys.argv[1:]
url = args[-1]
output = Path(args[args.index('--output') + 1]) if '--output' in args else None
archive = Path(os.environ['MOCK_GITHUB_ARCHIVE'])
tag = os.environ['MOCK_GITHUB_TAG']
commit = 'b' * 40
url_asset = f'https://github.com/jariolaine/apex-blog/releases/download/{quote(tag, safe="")}/apex-blog-latest.zip'
with Path(os.environ['MOCK_CURL_LOG']).open('a') as stream:
    stream.write(url + '\n')

if os.environ.get('MOCK_GITHUB_HTTP_FAIL'):
    print('mock GitHub API failure', file=sys.stderr)
    sys.exit(22)

size = archive.stat().st_size
actual = hashlib.sha256(archive.read_bytes()).hexdigest()
digest = os.environ.get('MOCK_GITHUB_DIGEST_OVERRIDE', actual)
assets = [{
    'name': 'apex-blog-latest.zip',
    'state': 'uploaded',
    'size': size,
    'digest': None if os.environ.get('MOCK_GITHUB_NO_DIGEST') else 'sha256:' + digest,
    'browser_download_url': os.environ.get('MOCK_GITHUB_ASSET_URL', url_asset),
}]
if os.environ.get('MOCK_GITHUB_WITH_SUMS'):
    assets.append({
        'name': 'SHA256SUMS', 'state': 'uploaded', 'size': 100,
        'browser_download_url': f'https://github.com/jariolaine/apex-blog/releases/download/{quote(tag, safe="")}/SHA256SUMS',
    })

if url.endswith('/releases/latest'):
    data = {
        'tag_name': tag,
        'draft': os.environ.get('MOCK_GITHUB_DRAFT') == '1',
        'prerelease': os.environ.get('MOCK_GITHUB_PRERELEASE') == '1',
        'assets': [] if os.environ.get('MOCK_GITHUB_NO_ASSET') else assets,
    }
    print(json.dumps(data))
elif '/commits/' in url:
    if unquote(url.rsplit('/', 1)[-1]) != tag:
        sys.exit(22)
    print(json.dumps({'sha': commit}))
elif '/compare/' in url:
    print(json.dumps({
        'status': os.environ.get('MOCK_GITHUB_COMPARE_STATUS', 'ahead'),
        'behind_by': 1 if os.environ.get('MOCK_GITHUB_COMPARE_STATUS') == 'diverged' else 0,
        'base_commit': {'sha': commit},
        'merge_base_commit': {'sha': commit},
    }))
elif url == url_asset:
    if output is None:
        sys.exit(22)
    shutil.copyfile(archive, output)
elif url.endswith('/SHA256SUMS'):
    sys.stdout.write(f'{actual}  apex-blog-latest.zip\n')
else:
    print(f'Unexpected mock GitHub request: {url}', file=sys.stderr)
    sys.exit(22)
