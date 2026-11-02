"""Mock-backed regression tests for APEXlang scripts; no Oracle instance needed."""
from datetime import datetime, timedelta
import json
import fcntl
import re
import os
from pathlib import Path
import shutil
import stat
import subprocess
import sys
import tempfile
import unittest
from zipfile import ZipFile

SOURCE = Path(__file__).resolve().parents[2]


class AutomationTests(unittest.TestCase):
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
        # Automation now lives directly under automation/, not tools/script/.
        # Never copy machine-specific credentials, Docker assets or old logs.
        shutil.copytree(
            SOURCE / 'automation', self.repo / 'automation',
            ignore=shutil.ignore_patterns(
                'variables.local.sh', 'docker', 'log', '__pycache__', '*.pyc'
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
                           stdout=subprocess.PIPE, stderr=subprocess.PIPE)
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
        ], check=True, capture_output=True, text=True)
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
        return [json.loads(ln) for ln in self.calls.read_text().splitlines()]

    def test_dev_import_preflight_blocks_database_calls(self):
        self.env['MOCK_PREFLIGHT_FAIL'] = '1'
        self.script('import_apps_to_dev.sh', '--confirm-dev-import', ok=False)
        self.assertEqual((self.root / 'preflight.log').read_text().strip(), 'preflight')
        self.assertFalse(self.calls.exists())

    def test_direct_qa_deploy_preflight_blocks_database_calls(self):
        self.env['MOCK_PREFLIGHT_FAIL'] = '1'
        self.script('deploy.sh', 'qa', ok=False)
        self.assertEqual((self.root / 'preflight.log').read_text().strip(), 'preflight')
        self.assertFalse(self.calls.exists())

    def test_hotfix_path_does_not_call_normal_preflight(self):
        self.env['MOCK_PREFLIGHT_FAIL'] = '1'
        self.script('hotfix.sh', 'export')
        self.assertFalse((self.root / 'preflight.log').exists())

    def test_export_apexlang_and_full_sql_release(self):
        self.script('export_application.sh')
        calls = self.calls_data()
        export = '\n'.join(c['sql'] for c in calls)
        self.assertIn('-exptype APEXLANG', export)
        self.assertIn('-exptype SQL', export)
        self.assertNotIn(' -split', export)
        self.assertIn('-expsupportingobjects Y', export)
        self.assertIn('apex validate -input ', export)
        self.assertTrue((self.repo/'applications/blog-admin/.apex/apexlang.json').is_file())
        self.assertEqual(json.loads((self.repo/'applications/blog-admin/deployments/default.json').read_text()),
                         {'app': {'id': 402}})
        build = self.candidate()
        self.assertTrue((build/'SHA256SUMS').is_file())
        with ZipFile(build/'apex-blog-latest.zip') as z:
            self.assertIn('blog-administration-latest.sql', z.namelist())
            self.assertIn('blog-public-pages-latest.sql', z.namelist())
            self.assertIn('README.md', z.namelist())

    def test_uppercase_alias_export_is_normalized(self):
        self.env['MOCK_ALIAS_UPPER'] = '1'
        self.script('export_application.sh', '--source-only')
        self.assertTrue((self.repo/'applications/blog-admin/application.apx').is_file())
        self.assertTrue((self.repo/'applications/blog/application.apx').is_file())

    def test_source_only_preserves_existing_supporting_sql_and_deployment(self):
        original = self.repo/'applications/blog-admin/supporting-objects/install-scripts/metadata.sql'
        original.write_text('prompt manual local content\n')
        self.env['MOCK_CHANGE_PAGE'] = '1'
        self.script('export_application.sh', '--source-only')
        self.assertEqual(original.read_text(), 'prompt manual local content\n')
        self.assertIn('-- mock changed page', '\n'.join(
            p.read_text() for p in (self.repo/'applications/blog-admin/pages').glob('*.apx')))
        self.assertEqual(json.loads((self.repo/'applications/blog-admin/deployments/default.json').read_text()),
                         {'app': {'id': 402}})
        self.assertFalse((self.candidate()/'apex-blog-latest.zip').exists())

    def test_source_only_preserves_local_static_files_and_adds_new_dev_files(self):
        # Static CSS/JS/images belong to Git just like the Supporting Objects metadata.
        # A source export must not overwrite locally maintained asset bytes.
        public = self.repo/'applications/blog/shared-components/static-files'
        admin = self.repo/'applications/blog-admin/shared-components/static-files'
        css = public/'css/style.css'
        js = public/'js/blog.js'
        icon = public/'icons/app-icon-192.png'
        admin_css = admin/'css/admin.css'
        css.write_bytes(css.read_bytes() + b'\n/* locally authored CSS */\n')
        js.write_bytes(js.read_bytes() + b'\n// locally authored JS\n')
        icon.write_bytes((public/'icons/app-icon-512.png').read_bytes())
        admin_css.write_bytes(admin_css.read_bytes() + b'\n/* local admin CSS */\n')
        expected = {p: p.read_bytes() for p in (css, js, icon, admin_css)}
        self.env['MOCK_CHANGE_STATIC'] = '1'
        self.env['MOCK_ADD_STATIC'] = '1'
        self.env['MOCK_CHANGE_PAGE'] = '1'
        self.script('export_application.sh', '--source-only')
        for path, data in expected.items():
            self.assertEqual(path.read_bytes(), data, str(path))
        self.assertEqual((public/'css/new-from-dev.css').read_text(), '/* New from DEV */\n')
        self.assertEqual((admin/'css/new-from-dev.css').read_text(), '/* New from DEV */\n')
        self.assertIn('css/new-from-dev.css',
                      (self.repo/'applications/blog/shared-components/static-files.apx').read_text())
        self.assertFalse((self.candidate()/'apex-blog-latest.zip').exists())

    def test_build_rejects_static_drift_before_publishing(self):
        css = self.repo/'applications/blog/shared-components/static-files/css/style.css'
        original = css.read_bytes()
        css.write_bytes(original + b'\n/* repository edit not imported to DEV */\n')
        app = self.repo/'applications/blog/application.apx'
        original_app = app.read_bytes()
        out = self.script('export_application.sh', ok=False)
        self.assertIn('Static application files', out.stderr)
        self.assertIn('css/style.css', out.stderr)
        self.assertEqual(css.read_bytes(), original + b'\n/* repository edit not imported to DEV */\n')
        self.assertEqual(app.read_bytes(), original_app)
        self.assertFalse((self.candidate()/'SHA256SUMS').exists())

    def test_build_rejects_binary_static_drift(self):
        icon = self.repo/'applications/blog/shared-components/static-files/icons/app-icon-192.png'
        icon.write_bytes((self.repo/'applications/blog/shared-components/static-files/icons/app-icon-512.png').read_bytes())
        out = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('Static application files', out.stderr)
        self.assertIn('app-icon-192.png', out.stderr)
        self.assertFalse((self.candidate()/'SHA256SUMS').exists())

    def test_build_works_when_static_files_match_dev(self):
        # A source refresh preserves local edits. Importing them to DEV is an
        # explicit step; simulate that step by updating the mock DB snapshot.
        css = self.repo/'applications/blog/shared-components/static-files/css/style.css'
        css.write_bytes(css.read_bytes() + b'\n/* custom CSS */\n')
        self.script('export_application.sh', '--source-only')
        shutil.copytree(self.repo/'applications/blog', self.template/'blog', dirs_exist_ok=True)
        self.script('export_application.sh', '--build-only')
        self.assertTrue((self.candidate()/'SHA256SUMS').is_file())

    def test_release_rejects_supporting_sql_drift_without_publishing(self):
        local = self.repo/'applications/blog/supporting-objects/install-scripts/metadata.sql'
        local.write_text(local.read_text()+'\n-- different from DEV\n')
        p = self.script('export_application.sh', ok=False)
        self.assertIn('Supporting Objects', p.stderr)
        self.assertFalse((self.candidate()/'SHA256SUMS').exists())

    def test_build_only_requires_apexlang_match(self):
        local = self.repo/'applications/blog-admin/application.apx'
        local.write_text(local.read_text()+'\n-- local change\n')
        p = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('differs from DEV', p.stderr)
        self.assertFalse((self.candidate()/'SHA256SUMS').exists())

    def test_validation_failure_never_publishes(self):
        self.env['MOCK_FAIL_VALIDATE'] = '1'
        p = self.script('export_application.sh', ok=False)
        self.assertIn('validation success', p.stderr)
        self.assertFalse((self.candidate()/'SHA256SUMS').exists())

    def test_qa_and_production_use_same_sql_release_and_distinct_connections(self):
        self.script('export_application.sh')
        self.script('import_apps_to_qa.sh')
        self.script('import_apps_to_pro.sh', ok=False)
        self.script('import_apps_to_pro.sh', '--confirm-production')
        commands = self.calls_data()
        qa = [c for c in commands if c['argv'][-1] == 'QA_TEST_SAVED']
        prod = [c for c in commands if c['argv'][-1] == 'PROD_TEST_SAVED']
        self.assertEqual(sum('install_application.sql' in c['sql'] for c in qa), 2)
        self.assertEqual(sum('install_application.sql' in c['sql'] for c in prod), 2)
        self.assertEqual(sum('verify_installed_objects.sql' in c['sql'] for c in qa), 1)
        self.assertEqual(sum('verify_installed_objects.sql' in c['sql'] for c in prod), 1)
        self.assertTrue(all('apex export' not in c['sql'] for c in qa+prod))
        self.assertTrue(all('blog-administration-latest.sql' in c['sql'] or
                            'blog-public-pages-latest.sql' in c['sql']
                            for c in qa+prod if 'install_application.sql' in c['sql']))

    def test_bad_release_checksum_blocks_qa_import(self):
        self.script('export_application.sh')
        with (self.candidate()/'blog-public-pages-latest.sql').open('a') as f:
            f.write('prompt unexpected edit\n')
        p = self.script('import_apps_to_qa.sh', ok=False)
        self.assertIn('checksum mismatch', p.stderr)

    def test_dev_import_requires_confirmation_and_validates_both(self):
        self.script('import_apps_to_dev.sh', ok=False)
        self.script('import_apps_to_dev.sh', '--confirm-dev-import')
        commands = self.calls_data()
        imports = [c for c in commands if 'apex import -input ' in c['sql']]
        self.assertEqual(len(imports), 2)
        self.assertTrue(all('set_auto_install_sup_obj(false)' in c['sql'] for c in imports))
        self.assertTrue(all(c['argv'][-1] == 'DEV_TEST_SAVED' for c in imports))

    def test_test_connection_required_and_correct_target(self):
        self.script('export_application.sh')
        self.script('run_install_test.sh', ok=False)
        self.script('run_install_test.sh', '--confirm-reset-test')
        commands = self.calls_data()
        tests = [c for c in commands if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertTrue(any('remove_application.sql' in c['sql'] for c in tests))
        self.assertEqual(sum('install_application.sql' in c['sql'] for c in tests), 2)
        self.env['APEX_BLOG_TST_CONNECTION'] = 'PROD_TEST_SAVED'
        self.script('run_install_test.sh', '--confirm-reset-test', ok=False)

    def test_clean_test_schema_skips_deinstall_sql(self):
        self.script('export_application.sh')
        self.env['MOCK_SCHEMA_EMPTY'] = '1'
        self.script('run_install_test.sh', '--confirm-reset-test')
        tests = [c for c in self.calls_data()
                 if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        reset = [c['sql'] for c in tests if 'remove_application.sql' in c['sql']]
        self.assertEqual(len(reset), 1)
        self.assertNotIn('deinstall_supporting_objects.sql', reset[0])

    def test_deinstall_runs_install_first_and_verifies_everything_is_removed(self):
        self.stub_release_candidate()
        self.env['MOCK_SCHEMA_EMPTY'] = '1'
        # The same RELEASE_DIR must be used by the test-install prerequisite.
        self.make('test-deinstall', f'RELEASE_DIR={self.candidate()}')
        tests = [c for c in self.calls_data()
                 if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        commands = [c['sql'] for c in tests]
        installs = [i for i, sql in enumerate(commands)
                    if 'install_application.sql' in sql]
        deinstalls = [i for i, sql in enumerate(commands)
                      if 'deinstall_supporting_objects.sql' in sql]
        verification = [i for i, sql in enumerate(commands)
                        if 'verify_deinstalled_objects.sql' in sql]
        self.assertEqual(len(installs), 2)
        self.assertEqual(len(deinstalls), 1)  # initial clean TEST skips reset deinstall
        self.assertEqual(len(verification), 1)
        self.assertLess(max(installs), deinstalls[0])
        self.assertLess(deinstalls[0], verification[0])
        self.assertIn('remove_application.sql', commands[deinstalls[0]])
        self.assertIn('"102"', commands[deinstalls[0]])
        self.assertIn('"101"', commands[deinstalls[0]])
        self.assertIn('"BLOG_TST"', commands[verification[0]])
        self.assertIn('"102"', commands[verification[0]])
        self.assertIn('"101"', commands[verification[0]])
        self.assertTrue(all(c['argv'][-1] == 'DISPOSABLE_TEST_SAVED' for c in tests))

    def test_deinstall_requires_successful_install_before_cleanup(self):
        self.stub_release_candidate()
        self.env['MOCK_SCHEMA_EMPTY'] = '1'
        self.env['MOCK_INSTALL_WRONG_VERSION'] = '1'
        p = self.make('test-deinstall', ok=False)
        self.assertIn('Installation failed', p.stderr)
        commands = [c['sql'] for c in self.calls_data()
                    if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertFalse(any('verify_deinstalled_objects.sql' in s for s in commands))
        self.assertFalse(any('deinstall_supporting_objects.sql' in s for s in commands))

    def test_deinstall_rejects_unconfirmed_or_non_test_connection(self):
        p = self.script('run_deinstall_test.sh', ok=False)
        self.assertIn('--confirm-test-deinstall', p.stderr)
        self.assertFalse(self.calls.exists())
        self.env['APEX_BLOG_TST_CONNECTION'] = 'PROD_TEST_SAVED'
        p = self.script('run_deinstall_test.sh', '--confirm-test-deinstall', ok=False)
        self.assertIn('TEST saved connection must be different', p.stderr)
        self.assertFalse(self.calls.exists())

    def test_deinstall_stops_when_sql_cleanup_fails(self):
        self.stub_release_candidate()
        self.env.update(MOCK_SCHEMA_EMPTY='1', MOCK_DEINSTALL_SQL_ERROR='1')
        p = self.make('test-deinstall', ok=False)
        self.assertIn('TEST deinstallation failed', p.stderr)
        self.assertFalse(any('verify_deinstalled_objects.sql' in c['sql']
                             for c in self.calls_data()))

    def test_deinstall_fails_if_any_user_objects_remain(self):
        self.stub_release_candidate()
        self.env.update(MOCK_SCHEMA_EMPTY='1', MOCK_DEINSTALL_LEFTOVER_OBJECTS='1')
        p = self.make('test-deinstall', ok=False)
        self.assertIn('1 user object', p.stderr)
        self.assertIn('TEST deinstallation left objects', p.stderr)

    def test_deinstall_fails_if_test_apex_application_remains(self):
        self.stub_release_candidate()
        self.env.update(MOCK_SCHEMA_EMPTY='1', MOCK_DEINSTALL_LEFTOVER_APPS='1')
        p = self.make('test-deinstall', ok=False)
        self.assertIn('1 application remains', p.stderr)
        self.assertIn('TEST deinstallation left objects', p.stderr)

    def test_deinstall_requires_sqlcl_positive_verification_marker(self):
        self.stub_release_candidate()
        self.env.update(MOCK_SCHEMA_EMPTY='1', MOCK_DEINSTALL_MISSING_MARKER='1')
        p = self.make('test-deinstall', ok=False)
        self.assertIn('missing success marker', p.stderr)
        self.assertTrue(any('verify_deinstalled_objects.sql' in c['sql']
                            for c in self.calls_data()))

    def test_deinstall_verification_checks_every_user_object_not_just_blog(self):
        sql = (SOURCE / 'automation/sql/verify_deinstalled_objects.sql').read_text()
        self.assertIn('select count(*) into l_objects from user_objects', sql.lower())
        self.assertIn('from apex_applications', sql.lower())
        self.assertIn('raise_application_error', sql.lower())
        self.assertIn('APEX_BLOG_DEINSTALL_OK', sql)
        self.assertNotRegex(sql.lower(), r"object_name\s+like\s+'blog_")

    def test_supporting_objects_generation_preserves_git_owned_metadata(self):
        deinstall = self.repo / 'applications/blog-admin/supporting-objects/deinstall-script.sql'
        admin_metadata = self.repo/'applications/blog-admin/supporting-objects/install-scripts/metadata.sql'
        public_metadata = self.repo/'applications/blog/supporting-objects/install-scripts/metadata.sql'
        original = {path: path.read_bytes() for path in (deinstall, admin_metadata, public_metadata)}
        # An invalid saved connection or missing SQLcl must not affect offline assembly.
        self.env['SQLCL_BIN'] = 'sqlcl-is-not-installed-here'
        self.script('supporting_objects.sh')
        for path, content in original.items():
            self.assertEqual(path.read_bytes(), content, f'Git-owned SQL changed: {path}')
        target = self.repo/'applications/blog-admin/supporting-objects/install-scripts/database-objects.sql'
        generated = target.read_text()
        self.assertIn((self.repo/'Database/Packages/BLOG_ADMIN.pks').read_text(), generated)
        self.assertIn((self.repo/'Database/Packages/BLOG_ADMIN.pkb').read_text(), generated)
        self.assertIn((self.repo/'Database/Tables/foreign_keys.sql').read_text(), generated)
        self.assertIn((self.repo/'Database/Indexes/foreign_key_indexes.sql').read_text(), generated)
        self.assertEqual(generated.count('alter table blog_comments add constraint blog_comments_fk1'), 1)
        self.assertEqual(generated.count('create index blog_comments_ix1 on blog_comments'), 1)
        self.assertEqual((self.repo/'README.md').read_text(), (SOURCE/'README.md').read_text())
        self.assertEqual((self.repo/'LICENSE.txt').read_text(), (SOURCE/'LICENSE.txt').read_text())
        self.assertEqual((self.repo/'VERSION.txt').read_text(), (SOURCE/'VERSION.txt').read_text())
        self.assertFalse(self.calls.exists(), 'Offline supporting must not invoke SQLcl')
        release_version = (self.repo/'VERSION.txt').read_text().strip()
        self.assertIn(f"'{release_version}'", public_metadata.read_text())
        postupgrade = self.repo/'applications/blog/supporting-objects/upgrade-scripts/postupgrade.sql'
        self.assertIn(f"'{release_version}'", postupgrade.read_text())

    def test_release_build_rejects_deinstall_drift_before_dev_sqlcl(self):
        deinstall = self.repo / 'applications/blog-admin/supporting-objects/deinstall-script.sql'
        source = deinstall.read_text()
        self.assertIn('drop package blog_install;', source)
        deinstall.write_text(source.replace('drop package blog_install;\n', ''))
        result = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('Release deinstall SQL is inconsistent', result.stderr)
        self.assertFalse(self.calls.exists(), 'Invalid uninstall SQL must stop before contacting DEV')

    def test_deinstall_drift_stops_before_dev_sqlcl(self):
        deinstall = self.repo / 'applications/blog-admin/supporting-objects/deinstall-script.sql'
        source = deinstall.read_text()
        self.assertIn('drop table blog_settings;', source)
        deinstall.write_text(source.replace('drop table blog_settings;\n', ''))
        result = self.script('supporting_objects.sh', ok=False)
        self.assertIn('Checked-in deinstall script is inconsistent', result.stderr)
        self.assertFalse(self.calls.exists(), 'Deinstall drift must stop before contacting DEV')

    def test_manifest_error_stops_before_dev_sqlcl(self):
        manifest = self.repo / 'automation/schema/upgrade.list'
        manifest.write_text(manifest.read_text().replace('Packages/BLOG_UTIL.pkb\n', ''))
        result = self.script('supporting_objects.sh', ok=False)
        self.assertIn('Upgrade schema manifest validation failed', result.stderr)
        self.assertFalse(self.calls.exists(), 'Invalid manifest must not contact DEV')

    def test_version_change_is_deterministic_and_does_not_touch_docs(self):
        expected = 'Release 26.1.6.20261101'
        (self.repo/'VERSION.txt').write_text(expected+'\n')
        original_readme = (self.repo/'README.md').read_bytes()
        original_license = (self.repo/'LICENSE.txt').read_bytes()
        self.script('supporting_objects.sh')
        metadata = self.repo/'applications/blog/supporting-objects/install-scripts/metadata.sql'
        postupgrade = self.repo/'applications/blog/supporting-objects/upgrade-scripts/postupgrade.sql'
        self.assertIn(expected, metadata.read_text())
        self.assertIn(expected, postupgrade.read_text())
        self.assertEqual((self.repo/'README.md').read_bytes(), original_readme)
        self.assertEqual((self.repo/'LICENSE.txt').read_bytes(), original_license)
        self.assertEqual((self.repo/'VERSION.txt').read_text(), expected+'\n')
        first = (postupgrade.read_bytes(), metadata.read_bytes())
        self.script('supporting_objects.sh')
        self.assertEqual((postupgrade.read_bytes(), metadata.read_bytes()), first)
        self.assertFalse(self.calls.exists(), 'Offline supporting must not access DEV')

    def test_invalid_version_is_rejected_before_export(self):
        (self.repo/'VERSION.txt').write_text("Release 1.2.3.20261101' --\n")
        self.script('supporting_objects.sh', ok=False)
        self.assertFalse(self.calls.exists())
        self.script('export_application.sh', ok=False)
        self.assertFalse((self.candidate()/'SHA256SUMS').exists())

    def test_release_build_requires_dev_version_match(self):
        self.env['MOCK_WRONG_RELEASE_VERSION'] = '1'
        result = self.script('export_application.sh', ok=False)
        self.assertIn('Release versions differ', result.stderr)
        self.assertFalse((self.candidate()/'SHA256SUMS').exists())

    def test_prepare_release_requires_confirmation(self):
        self.script('prepare_release.sh', ok=False)
        self.script('prepare_release.sh', '--confirm-dev-update')
        calls = '\n'.join(c['sql'] for c in self.calls_data())
        self.assertIn('apex_application_admin.set_application_version(', calls)
        self.assertIn('update blog_settings set attribute_value', calls)
        self.assertIn('APEX_BLOG_VERSION_OK', calls)

    def test_release_rejects_invalid_metadata_before_contacting_dev(self):
        public = self.repo/'applications/blog/supporting-objects/install-scripts/metadata.sql'
        original = public.read_text()
        public.write_text(original.replace(
            'blog_util.int_to_vc2(apex_application_install.get_application_id)', '401', 1
        ))
        result = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('Release metadata is inconsistent', result.stderr)
        self.assertFalse(self.calls.exists(), 'Metadata validation must run before DEV SQLcl')

    def test_supporting_failure_does_not_partially_write_sql(self):
        sql = self.repo/'applications/blog-admin/supporting-objects/install-scripts/database-objects.sql'
        original = sql.read_bytes()
        public = self.repo/'applications/blog/supporting-objects/install-scripts/metadata.sql'
        public.write_text(public.read_text().replace("'G_APP_VERSION'", "'UNKNOWN_VERSION'"))
        result = self.script('supporting_objects.sh', ok=False)
        self.assertIn('Git-owned metadata validation failed', result.stderr)
        self.assertEqual(sql.read_bytes(), original)
        self.assertFalse(self.calls.exists())

    def test_upgrade_uses_previous_and_candidate(self):
        self.script('export_application.sh')
        previous = self.root/'previous.zip'
        self.previous_zip(previous, self.older_version())
        # Explicit PREVIOUS_ZIP must bypass the GitHub download altogether.
        self.mock_curl_download(self.older_version())
        self.env['MOCK_CURL_FAIL'] = '1'
        self.script('run_upgrade_test.sh', '--confirm-reset-test', '--previous-zip', str(previous))
        self.assertFalse((self.root / 'curl-args.txt').exists())
        commands = self.calls_data()
        tests = [c for c in commands if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        installs = [c['sql'] for c in tests if 'install_application.sql' in c['sql']]
        self.assertEqual(len(installs), 4)
        expected = (self.repo / 'VERSION.txt').read_text().strip()
        self.assertTrue(all(self.older_version() in cmd for cmd in installs[:2]))
        self.assertTrue(all(expected in cmd for cmd in installs[2:]))
        self.assertEqual(sum('verify_installed_objects.sql' in c['sql'] for c in tests), 2)

    def test_upgrade_downloads_latest_when_previous_zip_not_provided(self):
        self.script('export_application.sh')
        self.mock_curl_download(self.older_version())
        self.script('run_upgrade_test.sh', '--confirm-reset-test')
        args = (self.root / 'curl-args.txt').read_text().splitlines()
        self.assertIn('https://github.com/jariolaine/apex-blog/releases/latest/download/apex-blog-latest.zip', args)
        tests = [c for c in self.calls_data()
                 if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        installs = [c['sql'] for c in tests if 'install_application.sql' in c['sql']]
        self.assertEqual(len(installs), 4)
        self.assertTrue(all(self.older_version() in cmd for cmd in installs[:2]))

    def test_upgrade_download_failure_does_not_reset_test(self):
        self.script('export_application.sh')
        self.mock_curl_download(self.older_version())
        self.env['MOCK_CURL_FAIL'] = '1'
        out = self.script('run_upgrade_test.sh', '--confirm-reset-test', ok=False)
        self.assertIn('Could not download previous release', out.stderr)
        self.assertFalse(any(c['argv'][-1] == 'DISPOSABLE_TEST_SAVED'
                             for c in self.calls_data()))

    def test_upgrade_rejects_latest_when_it_is_not_older(self):
        self.script('export_application.sh')
        current = (self.repo / 'VERSION.txt').read_text().strip()
        self.mock_curl_download(current)
        out = self.script('run_upgrade_test.sh', '--confirm-reset-test', ok=False)
        self.assertIn('Previous release ZIP must identify a release older', out.stderr)
        self.assertIn('PREVIOUS_ZIP', out.stderr)
        self.assertFalse(any(c['argv'][-1] == 'DISPOSABLE_TEST_SAVED'
                             for c in self.calls_data()))

    def test_upgrade_rejects_same_newer_and_unidentified_release_before_reset(self):
        self.script('export_application.sh')
        current = (self.repo / 'VERSION.txt').read_text().strip()
        prefix, date = current.rsplit('.', 1)
        later_date = (datetime.strptime(date, '%Y%m%d') + timedelta(days=1)).strftime('%Y%m%d')
        later = f'{prefix}.{later_date}'
        for label, version in (('same', current), ('newer', later),
                               ('missing', None), ('malformed', 'Release wrong')):
            previous = self.root / f'{label}.zip'
            self.previous_zip(previous, version)
            out = self.script('run_upgrade_test.sh', '--confirm-reset-test',
                              '--previous-zip', str(previous), ok=False)
            self.assertIn('Previous release ZIP', out.stderr)
            self.assertFalse(any(c['argv'][-1] == 'DISPOSABLE_TEST_SAVED'
                                 for c in self.calls_data()), label)

    def test_installer_checks_expected_version_and_preserves_apex_remote_servers(self):
        installer = (self.repo / 'automation/sql/install_application.sql').read_text()
        self.assertIn('apex_application_admin.get_application_version', installer)
        self.assertIn("l_actual_version <> '^expectedVersion.'", installer)
        self.assertIn('raise_application_error(-20056', installer)
        self.assertNotIn('set_remote_server', installer.lower())
        self.script('export_application.sh')
        self.script('run_install_test.sh', '--confirm-reset-test')
        installs = [c['sql'] for c in self.calls_data()
                    if 'install_application.sql' in c['sql']]
        self.assertEqual(len(installs), 2)
        current = (self.repo / 'VERSION.txt').read_text().strip()
        self.assertTrue(all(current in sql for sql in installs))

    def test_wrong_installed_app_version_blocks_install(self):
        self.script('export_application.sh')
        self.env['MOCK_INSTALL_WRONG_VERSION'] = '1'
        result = self.script('run_install_test.sh', '--confirm-reset-test', ok=False)
        self.assertIn('Installation failed', result.stderr)
        tests = [c for c in self.calls_data()
                 if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertEqual(sum('install_application.sql' in c['sql'] for c in tests), 1)
        self.assertFalse(any('verify_installed_objects.sql' in c['sql'] for c in tests))

    def test_missing_install_success_marker_blocks_install(self):
        self.script('export_application.sh')
        self.env['MOCK_INSTALL_MISSING_MARKER'] = '1'
        out = self.script('run_install_test.sh', '--confirm-reset-test', ok=False)
        self.assertIn('Cannot verify app', out.stderr)

    def test_invalid_blog_objects_block_complete_install(self):
        checker = (self.repo / 'automation/sql/verify_installed_objects.sql').read_text()
        self.assertIn('from user_objects', checker)
        self.assertIn("substr(object_name, 1, 5) = 'BLOG_'", checker)
        self.assertIn('raise_application_error(-20057', checker)
        self.script('export_application.sh')
        self.env['MOCK_INVALID_BLOG_OBJECTS'] = '1'
        result = self.script('run_install_test.sh', '--confirm-reset-test', ok=False)
        self.assertIn('Invalid BLOG_ database objects', result.stderr)
        calls = [c for c in self.calls_data()
                 if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertEqual(sum('install_application.sql' in c['sql'] for c in calls), 2)
        self.assertEqual(sum('verify_installed_objects.sql' in c['sql'] for c in calls), 1)

    def test_missing_object_verification_marker_blocks_install(self):
        self.script('export_application.sh')
        self.env['MOCK_OBJECTS_MISSING_MARKER'] = '1'
        out = self.script('run_install_test.sh', '--confirm-reset-test', ok=False)
        self.assertIn('Cannot verify BLOG_ database objects', out.stderr)

    def test_assembler_keeps_sql_whitespace_and_package_order(self):
        root = self.root/'ddl'; (root/'Packages').mkdir(parents=True)
        (root/'Tables').mkdir()
        (root/'Tables/A.sql').write_text("select 'a  b' from dual;\n")
        (root/'Packages/API.pks').write_text('create or replace package api as end;\n/\n')
        (root/'Packages/API.pkb').write_text(
            'create or replace editionable package body api as end;\n/\n')
        listing = self.root/'names.txt'
        listing.write_text('Tables/A.sql\nPackages/API.pks\nPackages/API.pkb\n')
        output = self.root/'install.sql'
        script = self.repo/'automation/lib/assemble_objects.py'
        subprocess.run([sys.executable, str(script), str(listing), str(root), str(output)], check=True)
        content = output.read_text()
        self.assertIn("'a  b'", content)
        self.assertLess(content.index('package api as'), content.index('package body api as'))
        self.assertEqual(content.count('package body api'), 1)

    def test_unsafe_previous_release_symlink_rejected(self):
        import stat
        bad = self.root/'bad.zip'
        from zipfile import ZipInfo
        with ZipFile(bad, 'w') as z:
            info = ZipInfo('blog-administration-latest.sql')
            info.create_system = 3
            info.external_attr = (stat.S_IFLNK | 0o777) << 16
            z.writestr(info, '../../private')
            z.writestr('blog-public-pages-latest.sql', 'prompt old\n')
        out = self.root/'extract'
        cmd = [sys.executable, str(self.repo/'automation/lib/extract_previous_release.py'),
               str(bad), str(out), 'blog-administration-latest.sql', 'blog-public-pages-latest.sql']
        result = subprocess.run(cmd, capture_output=True, text=True)
        self.assertNotEqual(result.returncode, 0)


    def test_versioned_manifest_records_both_apps_and_source_fingerprint(self):
        self.script('export_application.sh')
        candidate = self.candidate()
        manifest = json.loads((candidate / 'manifest.json').read_text())
        self.assertEqual(manifest['release'], (self.repo / 'VERSION.txt').read_text().strip())
        self.assertEqual([a['devId'] for a in manifest['applications']], [402, 401])
        self.assertEqual(len(manifest['sourceSha256']), 64)
        self.assertEqual(len(manifest['files']), 7)
        self.script('verify_release.sh')
        self.assertTrue((candidate / 'SHA256SUMS').is_file())

    def test_rebuild_same_version_refuses_to_overwrite_candidate(self):
        self.script('export_application.sh')
        manifest = (self.candidate() / 'manifest.json').read_bytes()
        out = self.script('export_application.sh', ok=False)
        self.assertIn('already exists', out.stderr)
        self.assertEqual(manifest, (self.candidate() / 'manifest.json').read_bytes())

    def test_make_build_does_not_modify_tracked_apexlang(self):
        app = self.repo / 'applications/blog-admin/application.apx'
        before = app.read_bytes()
        # A changed DEV page must cause a read-only build to fail rather than
        # silently refresh the local APEXLang source.
        self.env['MOCK_CHANGE_PAGE'] = '1'
        out = self.make('build', ok=False)
        self.assertIn('differs from DEV', out.stderr)
        self.assertEqual(app.read_bytes(), before)
        self.assertFalse(self.candidate().exists())
        self.env.pop('MOCK_CHANGE_PAGE')
        self.make('build')
        self.assertEqual(app.read_bytes(), before)
        self.script('verify_release.sh')

    def test_make_build_overwrite_replaces_only_current_candidate(self):
        self.make('build')
        current = self.candidate()
        old_manifest = (current / 'manifest.json').read_bytes()
        previous = current.parent / '26.1.5.20250101'
        previous.mkdir()
        (previous / 'keep.txt').write_text('keep previous version')
        log_file = current.parents[1] / 'deploy-logs' / current.name / 'qa' / 'note.txt'
        log_file.parent.mkdir(parents=True)
        log_file.write_text('keep deployment log')
        page = next((self.repo / 'applications/blog-admin/pages').glob('*.apx'))
        mirror = self.template / 'blog-admin/pages' / page.name
        for f in (page, mirror):
            f.write_bytes(f.read_bytes() + b'\n-- reviewed change\n')
        denied = self.make('build', ok=False)
        self.assertIn('already exists', denied.stderr)
        self.make('build', 'OVERWRITE=YES')
        self.assertNotEqual((current / 'manifest.json').read_bytes(), old_manifest)
        self.assertEqual((previous / 'keep.txt').read_text(), 'keep previous version')
        self.assertEqual(log_file.read_text(), 'keep deployment log')
        self.script('verify_release.sh')
        self.assertEqual(list(current.parent.glob('.backup.*')), [])
        self.assertEqual(list(current.parent.glob('.candidate.*')), [])
        # The rebuilt candidate has the current source fingerprint.
        self.script('import_apps_to_qa.sh')

    def test_overwrite_failure_restores_previous_verified_candidate(self):
        self.make('build')
        current = self.candidate()
        before = {f.name: f.read_bytes() for f in current.iterdir() if f.is_file()}
        mover = self.bin / 'mv'
        mover.write_text(
            '#!/usr/bin/env bash\n'
            'if [[ "${MOCK_FAIL_STAGE_PUBLISH:-}" == "1" && "$*" == *"/.candidate."* ]]; then\n'
            '  echo "mock publish failure" >&2; exit 77\n'
            'fi\n'
            'exec /usr/bin/mv "$@"\n', encoding='utf-8',
        )
        mover.chmod(0o755)
        self.env['PATH'] = f"{self.bin}{os.pathsep}{self.env.get('PATH', '')}"
        self.env['MOCK_FAIL_STAGE_PUBLISH'] = '1'
        out = self.make('build', 'OVERWRITE=YES', ok=False)
        self.assertIn('mock publish failure', out.stderr)
        self.assertIn('Restored previous release candidate', out.stderr)
        self.assertEqual(before, {f.name: f.read_bytes() for f in current.iterdir() if f.is_file()})
        self.assertEqual(list(current.parent.glob('.backup.*')), [])
        self.assertEqual(list(current.parent.glob('.candidate.*')), [])
        self.script('verify_release.sh')

    def test_failed_overwrite_during_exports_preserves_old_candidate(self):
        self.make('build')
        before = (self.candidate() / 'manifest.json').read_bytes()
        self.env['MOCK_FAIL_VALIDATE'] = '1'
        out = self.make('build', 'OVERWRITE=YES', ok=False)
        self.assertIn('validation success', out.stderr)
        self.assertEqual((self.candidate() / 'manifest.json').read_bytes(), before)
        self.script('verify_release.sh')

    def test_overwrite_rejects_symlinks_and_unknown_directories(self):
        external = self.root / 'outside'
        external.mkdir()
        (external / 'dont-delete.txt').write_text('important')
        self.candidate().parent.mkdir(parents=True, exist_ok=True)
        self.candidate().symlink_to(external, target_is_directory=True)
        out = self.make('build', 'OVERWRITE=YES', ok=False)
        self.assertIn('Unsafe release candidate target', out.stderr)
        self.assertEqual((external / 'dont-delete.txt').read_text(), 'important')
        self.candidate().unlink()
        self.candidate().mkdir()
        (self.candidate() / 'notes.txt').write_text('not a candidate')
        out = self.make('build', 'OVERWRITE=YES', ok=False)
        self.assertIn('unrecognized release directory', out.stderr)
        self.assertEqual((self.candidate() / 'notes.txt').read_text(), 'not a candidate')

    def test_overwrite_rejected_while_candidate_is_locked(self):
        self.make('build')
        lock_file = self.candidate().parent / '.locks' / (self.candidate().name + '.lock')
        before = (self.candidate() / 'manifest.json').read_bytes()
        with lock_file.open('a') as holder:
            fcntl.flock(holder.fileno(), fcntl.LOCK_SH | fcntl.LOCK_NB)
            out = self.make('build', 'OVERWRITE=YES', ok=False)
            self.assertIn('in use by another build or deployment', out.stderr)
            fcntl.flock(holder.fileno(), fcntl.LOCK_UN)
        self.assertEqual((self.candidate() / 'manifest.json').read_bytes(), before)

    def test_overwrite_flag_requires_explicit_build_mode(self):
        out = self.script('export_application.sh', '--source-only', '--overwrite', ok=False)
        self.assertIn('--overwrite requires --build-only', out.stderr)
        self.assertFalse(self.calls.exists())
        out = self.make('build', 'OVERWRITE=possibly', ok=False)
        self.assertIn('OVERWRITE must be YES', out.stderr)
        self.assertFalse(self.calls.exists())

    def test_qa_checks_source_fingerprint_against_candidate(self):
        self.script('export_application.sh')
        before = len(self.calls_data())
        ddl = self.repo / 'Database/Packages/BLOG_UTIL.pkb'
        ddl.write_bytes(ddl.read_bytes() + b'\n-- changed after build\n')
        out = self.script('import_apps_to_qa.sh', ok=False)
        self.assertIn('source fingerprint differs', out.stderr)
        self.assertFalse(any(c['argv'][-1] == 'QA_TEST_SAVED'
                             for c in self.calls_data()[before:]))

    def test_qa_source_fingerprint_includes_schema_manifests(self):
        self.script('export_application.sh')
        before = len(self.calls_data())
        manifest = self.repo / 'automation/schema/upgrade.list'
        manifest.write_text(manifest.read_text() + '\n# reviewed manifest change\n')
        out = self.script('import_apps_to_qa.sh', ok=False)
        self.assertIn('source fingerprint differs', out.stderr)
        self.assertFalse(any(c['argv'][-1] == 'QA_TEST_SAVED'
                             for c in self.calls_data()[before:]))

    def test_production_uses_original_candidate_after_source_changes(self):
        self.script('export_application.sh')
        candidate = self.candidate()
        self.script('import_apps_to_qa.sh')
        ddl = self.repo / 'Database/Packages/BLOG_UTIL.pkb'
        ddl.write_bytes(ddl.read_bytes() + b'\n-- WIP DEV modification\n')
        self.script('import_apps_to_pro.sh', '--confirm-production', '--release-dir', str(candidate))
        self.assertEqual(sum('install_application.sql' in c['sql']
                             for c in self.calls_data() if c['argv'][-1] == 'PROD_TEST_SAVED'), 2)
        self.assertFalse((candidate / 'deploy-logs').exists())

    def test_stack_package_excludes_local_terraform_state_and_secrets(self):
        tf = self.repo / 'Stack/terraform'
        (tf / '.terraform/cache').mkdir(parents=True)
        (tf / '.terraform/cache/large.bin').write_bytes(b'PRIVATE CACHE')
        (tf / 'terraform.tfstate').write_text('private state')
        (tf / 'terraform.tfvars').write_text('private values')
        (tf / 'terraform.auto.tfvars.json').write_text('{"secret": true}')
        (tf / '.env').write_text('PRIVATE=YES')
        self.script('export_application.sh')
        with ZipFile(self.candidate() / 'apex-blog-stack-latest.zip') as archive:
            names = archive.namelist()
            self.assertFalse(any('.terraform/' in n or n.endswith('.tfstate')
                                 or n.endswith('.tfvars') or n.endswith('.tfvars.json')
                                 or n.endswith('.env')
                                 for n in names), names)
            self.assertIn('VERSION.txt', names)

    def test_manifest_and_package_tampering_are_detected(self):
        self.script('export_application.sh')
        candidate = self.candidate()
        with (candidate / 'manifest.json').open('a') as stream:
            stream.write('\n')
        out = self.script('verify_release.sh', ok=False)
        self.assertIn('checksum mismatch', out.stderr.lower())

    def test_release_readiness_rejects_mismatched_application_version(self):
        self.drift_app_version(self.repo / 'applications/blog/application.apx')
        self.script('check_source.sh', 'source')  # WIP source can be edited.
        out = self.script('check_source.sh', 'release', ok=False)
        self.assertIn('application.apx version', out.stderr)

    def test_release_build_stops_before_publish_on_version_drift(self):
        for root in (self.repo / 'applications', self.template):
            for alias in ('blog-admin', 'blog'):
                self.drift_app_version(root / alias / 'application.apx')
        out = self.script('export_application.sh', ok=False)
        self.assertIn('Release source consistency failed', out.stderr)
        self.assertFalse(self.candidate().exists())

    def test_dev_sync_checks_deployment_id_before_connecting(self):
        deployment = self.repo / 'applications/blog/deployments/default.json'
        deployment.write_text('{"app": {"id": 999}}\n')
        out = self.script('import_apps_to_dev.sh', '--confirm-dev-import', ok=False)
        self.assertIn('Local APEXLang source consistency failed', out.stderr)
        self.assertFalse(self.calls.exists())

    def test_source_check_rejects_missing_static_and_supporting_files(self):
        static = self.repo / 'applications/blog/shared-components/static-files/css/style.css'
        static.unlink()
        supporting = self.repo / 'applications/blog/supporting-objects/upgrade-scripts/postupgrade.sql'
        supporting.unlink()
        out = self.script('check_source.sh', 'source', ok=False)
        self.assertIn('referenced static file missing', out.stderr)
        self.assertIn('referenced Supporting Objects SQL missing', out.stderr)

    def test_source_check_catches_app_id_drift(self):
        deployment = self.repo / 'applications/blog/deployments/default.json'
        deployment.write_text('{"app": {"id": 999}}\n')
        out = self.script('check_source.sh', 'source', ok=False)
        self.assertIn('deployment app ID 999 differs from DEV ID 401', out.stderr)

    def test_explicit_candidate_is_accepted_by_install_tests(self):
        self.script('export_application.sh')
        self.script('run_install_test.sh', '--confirm-reset-test',
                    '--release-dir', str(self.candidate()))
        tests = [c for c in self.calls_data()
                 if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertEqual(sum('install_application.sql' in c['sql'] for c in tests), 2)

    def test_candidate_directory_name_must_match_manifest(self):
        self.script('export_application.sh')
        fake = self.repo / 'build/releases/not-the-version'
        shutil.copytree(self.candidate(), fake)
        self.script('verify_release.sh', '--release-dir', str(fake), ok=False)


if __name__ == '__main__':
    unittest.main()
