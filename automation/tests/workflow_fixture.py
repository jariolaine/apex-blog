"""Isolated filesystem + mock SQLcl fixture for real shell-workflow tests.

A SQLcl stand-in records invocation and simulates responses. These are not Oracle
integration tests: use the disposable TEST database commands before release.
"""

from datetime import datetime, timedelta
import json
import os
from pathlib import Path
import re
import shutil
import stat
import subprocess
import sys
import tempfile
import unittest
from zipfile import ZipFile

SOURCE = Path(__file__).resolve().parents[2]


class WorkflowFixture(unittest.TestCase):
    """Run production shell/Make entry points against private mock connections."""

    # TEST-database workflow tests use a checksum-valid candidate built locally
    # and never request an APEXLang export, so no separate DEV snapshot is needed.
    needs_dev_snapshot = True

    def setUp(self):
        self.td = tempfile.TemporaryDirectory(prefix='apex-blog-test-')
        self.addCleanup(self.td.cleanup)
        self.root = Path(self.td.name)
        self.repo = self.root / 'repo'
        self.repo.mkdir()
        for file in ['README.md', 'LICENSE.txt', 'VERSION.txt', 'Makefile']:
            shutil.copy2(SOURCE / file, self.repo / file)
        for folder in ['applications', 'Database', 'Stack/terraform', 'less']:
            shutil.copytree(SOURCE / folder, self.repo / folder)
        # Mock releases must be internally consistent even when the working
        # checkout is mid-release preparation. Normalize *only* fixture copies;
        # the real release checks must still reject drift in checked-in sources.
        version = (self.repo / 'VERSION.txt').read_text(encoding='utf-8').strip()
        for alias in ('blog-admin', 'blog'):
            app = self.repo / 'applications' / alias / 'application.apx'
            content, count = re.subn(r'(?m)^    version: .+$',
                                      f'    version: {version}', app.read_text(), count=1)
            assert count == 1, f'Missing application version in {app}'
            app.write_text(content)
        # The application version alone is not enough: release readiness also
        # checks the *current* installer and post-upgrade version statements.
        # Do not rewrite historical upgrade scripts or unrelated SQL literals.
        current_metadata = (
            ('applications/blog/supporting-objects/install-scripts/metadata.sql',
             r"(?m)^([ \t]*blog_install\.settings_merge\('G_APP_VERSION'[^;\r\n]*?,)'Release [^'\r\n]+'(?=\);[ \t]*$)"),
            ('applications/blog/supporting-objects/upgrade-scripts/postupgrade.sql',
             r"(?mi)^([ \t]*set[ \t]+attribute_value[ \t]*=[ \t]*)'Release [^'\r\n]+'(?=[ \t]*$)"),
        )
        for relative_path, pattern in current_metadata:
            path = self.repo / relative_path
            content, count = re.subn(
                pattern, lambda match: f"{match.group(1)}'{version}'",
                path.read_text(encoding='utf-8'),
            )
            assert count == 1, f'Missing current release statement in {path}'
            path.write_text(content, encoding='utf-8')
        # Copy runtime automation only. Tests, credentials, Docker assets and
        # old logs are not build inputs for the isolated workflow fixture.
        shutil.copytree(
            SOURCE / 'automation', self.repo / 'automation',
            ignore=shutil.ignore_patterns(
                'variables.local.sh', 'docker', 'log', 'tests', '__pycache__', '*.pyc'
            ),
        )
        # ZIP snapshots may lose Unix execute bits. The fixture must remain
        # runnable even when the test suite is extracted without Git metadata.
        for script in (self.repo / 'automation').glob('*.sh'):
            script.chmod(script.stat().st_mode | stat.S_IXUSR)
        # Mock the quality gate in isolated automation unit tests: exercising
        # the real gate here would recursively launch this unittest suite.
        # No production script supports a preflight bypass flag.
        gate = self.repo / 'automation/ci/preflight.sh'
        gate.parent.mkdir(parents=True, exist_ok=True)
        gate.write_text(
            '#!/usr/bin/env bash\n'
            'printf "preflight\\n" >> "$MOCK_PREFLIGHT_LOG"\n'
            '[[ "${MOCK_PREFLIGHT_FAIL:-0}" != "1" ]]\n',
            encoding='utf-8',
        )
        gate.chmod(0o755)
        # Tests need the APEXLang source IDs (402/401), regardless of the
        # developer's machine-specific configuration or repository defaults.
        (self.repo / 'automation/variables.local.sh').write_text(
            'devAppIds=(402 401)\n', encoding='utf-8'
        )
        self.bin = self.root / 'bin'
        self.bin.mkdir()
        self.mock = self.bin / 'sql'
        shutil.copy2(SOURCE/'automation/tests/mock_sqlcl.py', self.mock)
        self.mock.chmod(0o755)
        self.template = self.root / 'db-snapshot'
        if self.needs_dev_snapshot:
            shutil.copytree(self.repo/'applications', self.template)
        self.calls = self.root / 'calls.jsonl'
        self.env = dict(os.environ,
                        SQLCL_BIN=str(self.mock),
                        MOCK_SQLCL_LOG=str(self.calls),
                        MOCK_APEX_TEMPLATE=str(self.template),
                        MOCK_PREFLIGHT_LOG=str(self.root / 'preflight.log'),
                        APEX_BLOG_DEV_CONNECTION='DEV_TEST_SAVED',
                        APEX_BLOG_UAT_CONNECTION='QA_TEST_SAVED',
                        APEX_BLOG_PRD_CONNECTION='PROD_TEST_SAVED',
                        APEX_BLOG_TST_CONNECTION='DISPOSABLE_TEST_SAVED')

    def script(self, name, *args, ok=True):
        p = subprocess.run(['bash', str(self.repo/'automation'/name), *args],
                           env=self.env, cwd=self.root, text=True,
                           stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                           timeout=60)
        if ok and p.returncode != 0:
            self.fail(f'{name} failed {p.returncode}:\n{p.stdout}\n{p.stderr}')
        if not ok and p.returncode == 0:
            self.fail(f'{name} unexpectedly succeeded')
        return p

    def make(self, *args, ok=True):
        result = subprocess.run(
            ['make', '--no-print-directory', '-C', str(self.repo), *args],
            env=self.env, cwd=self.root, text=True,
            stdout=subprocess.PIPE, stderr=subprocess.PIPE,
            timeout=60,
        )
        if ok and result.returncode != 0:
            self.fail(f'make {args} failed {result.returncode}:\n{result.stdout}\n{result.stderr}')
        if not ok and result.returncode == 0:
            self.fail(f'make {args} unexpectedly succeeded')
        return result

    def candidate(self):
        version = (self.repo / 'VERSION.txt').read_text().strip()
        return self.repo / 'build/releases' / version.removeprefix('Release ')

    def stub_release_candidate(self):
        """Create a checksum-valid lightweight candidate for TEST orchestration tests.

        No DEV export/SQLcl or APEXLang parity checks are needed to exercise
        the test-install -> test-deinstall Make dependency and TEST SQL ordering.
        """
        release = self.candidate()
        release.mkdir(parents=True, exist_ok=True)
        for name in ('VERSION.txt', 'README.md', 'LICENSE.txt'):
            shutil.copy2(self.repo / name, release / name)
        sql_names = ('blog-administration-latest.sql', 'blog-public-pages-latest.sql')
        for name in sql_names:
            (release / name).write_text(f'prompt Mock release SQL {name}\n')
        with ZipFile(release / 'apex-blog-latest.zip', 'w') as archive:
            for name in sql_names:
                archive.write(release / name, arcname=name)
        with ZipFile(release / 'apex-blog-stack-latest.zip', 'w') as archive:
            archive.writestr('readme.txt', 'Mock stack archive\n')
        manifest = self.repo / 'automation/lib/release_manifest.py'
        subprocess.run([
            sys.executable, str(manifest), 'create', '--dir', str(release),
            '--repo', str(self.repo), '--sql-names', *sql_names,
            '--zip-name', 'apex-blog-latest.zip', '--stack-name', 'apex-blog-stack-latest.zip',
            '--dev-ids', '402', '401',
        ], check=True, capture_output=True, text=True, timeout=20)
        return release

    def drift_app_version(self, app: Path):
        """Change the fixture's current release date, never an old hardcoded version."""
        version = (self.repo / 'VERSION.txt').read_text(encoding='utf-8').strip()
        prefix, date = version.rsplit('.', 1)
        next_date = (datetime.strptime(date, '%Y%m%d') + timedelta(days=1)).strftime('%Y%m%d')
        mismatched = f'{prefix}.{next_date}'
        content = app.read_text(encoding='utf-8')
        old = f'version: {version}'
        self.assertIn(old, content, f'Expected current release version in {app}')
        app.write_text(content.replace(old, f'version: {mismatched}', 1), encoding='utf-8')

    def older_version(self):
        version = (self.repo / 'VERSION.txt').read_text(encoding='utf-8').strip()
        prefix, date = version.rsplit('.', 1)
        previous_date = (datetime.strptime(date, '%Y%m%d') - timedelta(days=1)).strftime('%Y%m%d')
        return f'{prefix}.{previous_date}'

    def previous_zip(self, path, version=None):
        """Write a minimal prior-release ZIP for mocked install tests."""
        with ZipFile(path, 'w') as archive:
            if version is not None:
                archive.writestr('VERSION.txt', version + '\n')
            archive.writestr('blog-administration-latest.sql', 'prompt previous admin\n')
            archive.writestr('blog-public-pages-latest.sql', 'prompt previous public\n')

    def mock_curl_download(self, version):
        """Make a local ZIP look like a GitHub download, without using the network."""
        archive = self.root / 'github-previous.zip'
        self.previous_zip(archive, version)
        curl = self.bin / 'curl'
        curl.write_text(
            '#!/usr/bin/env bash\n'
            'set -Eeuo pipefail\n'
            'printf "%s\\n" "$@" > "$MOCK_CURL_ARGS"\n'
            '[[ "${MOCK_CURL_FAIL:-0}" != "1" ]] || exit 22\n'
            'dest=""\n'
            'while (( $# )); do\n'
            '  case "$1" in\n'
            '    --output) dest="$2"; shift 2 ;;\n'
            '    *) shift ;;\n'
            '  esac\n'
            'done\n'
            '[[ -n "$dest" ]] || exit 2\n'
            'cp -- "$MOCK_CURL_ZIP" "$dest"\n',
            encoding='utf-8',
        )
        curl.chmod(0o755)
        self.env['PATH'] = f"{self.bin}{os.pathsep}{self.env.get('PATH', '')}"
        self.env['MOCK_CURL_ZIP'] = str(archive)
        self.env['MOCK_CURL_ARGS'] = str(self.root / 'curl-args.txt')

    def calls_data(self):
        if not self.calls.exists():
            return []
        return [json.loads(line) for line in self.calls.read_text().splitlines()]
