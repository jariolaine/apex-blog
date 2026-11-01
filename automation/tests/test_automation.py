"""Mock-backed regression tests for APEXlang scripts; no Oracle instance needed."""
import json
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
        for file in ['README.md', 'LICENSE.txt', 'VERSION.txt']:
            shutil.copy2(SOURCE / file, self.repo / file)
        for folder in ['applications', 'Database', 'Stack/terraform']:
            shutil.copytree(SOURCE / folder, self.repo / folder)
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
        build = self.repo/'build'
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
        self.assertFalse((self.repo/'build/apex-blog-latest.zip').exists())

    def test_source_only_preserves_local_static_files_and_adds_new_dev_files(self):
        # Static CSS/JS/images belong to Git just like BUILD_API-generated SQL.
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
        self.assertFalse((self.repo/'build/apex-blog-latest.zip').exists())

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
        self.assertFalse((self.repo/'build/SHA256SUMS').exists())

    def test_build_rejects_binary_static_drift(self):
        icon = self.repo/'applications/blog/shared-components/static-files/icons/app-icon-192.png'
        icon.write_bytes((self.repo/'applications/blog/shared-components/static-files/icons/app-icon-512.png').read_bytes())
        out = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('Static application files', out.stderr)
        self.assertIn('app-icon-192.png', out.stderr)
        self.assertFalse((self.repo/'build/SHA256SUMS').exists())

    def test_build_works_when_static_files_match_dev(self):
        # A source refresh preserves local edits. Importing them to DEV is an
        # explicit step; simulate that step by updating the mock DB snapshot.
        css = self.repo/'applications/blog/shared-components/static-files/css/style.css'
        css.write_bytes(css.read_bytes() + b'\n/* custom CSS */\n')
        self.script('export_application.sh', '--source-only')
        shutil.copytree(self.repo/'applications/blog', self.template/'blog', dirs_exist_ok=True)
        self.script('export_application.sh', '--build-only')
        self.assertTrue((self.repo/'build/SHA256SUMS').is_file())

    def test_release_rejects_supporting_sql_drift_without_publishing(self):
        local = self.repo/'applications/blog/supporting-objects/install-scripts/metadata.sql'
        local.write_text(local.read_text()+'\n-- different from DEV\n')
        p = self.script('export_application.sh', ok=False)
        self.assertIn('Supporting Objects', p.stderr)
        self.assertFalse((self.repo/'build/SHA256SUMS').exists())

    def test_build_only_requires_apexlang_match(self):
        local = self.repo/'applications/blog-admin/application.apx'
        local.write_text(local.read_text()+'\n-- local change\n')
        p = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('differs from DEV', p.stderr)
        self.assertFalse((self.repo/'build/SHA256SUMS').exists())

    def test_validation_failure_never_publishes(self):
        self.env['MOCK_FAIL_VALIDATE'] = '1'
        p = self.script('export_application.sh', ok=False)
        self.assertIn('validation success', p.stderr)
        self.assertFalse((self.repo/'build/SHA256SUMS').exists())

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
        self.assertTrue(all('apex export' not in c['sql'] for c in qa+prod))
        self.assertTrue(all('blog-administration-latest.sql' in c['sql'] or
                            'blog-public-pages-latest.sql' in c['sql']
                            for c in qa+prod if 'install_application.sql' in c['sql']))

    def test_bad_release_checksum_blocks_qa_import(self):
        self.script('export_application.sh')
        with (self.repo/'build/blog-public-pages-latest.sql').open('a') as f:
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

    def test_supporting_objects_generation_preserves_sql_literals(self):
        self.script('supporting_objects.sh')
        target = self.repo/'applications/blog-admin/supporting-objects/install-scripts/database-objects.sql'
        self.assertIn("'a  b'", target.read_text())
        self.assertIn('package body', target.read_text().lower())
        self.assertEqual((self.repo/'README.md').read_text(), (SOURCE/'README.md').read_text())
        self.assertEqual((self.repo/'LICENSE.txt').read_text(), (SOURCE/'LICENSE.txt').read_text())
        self.assertEqual((self.repo/'VERSION.txt').read_text(), (SOURCE/'VERSION.txt').read_text())
        sql_calls = '\n'.join(c['sql'] for c in self.calls_data())
        release_version = (self.repo/'VERSION.txt').read_text().strip()
        self.assertIn(f"p_release_version => '{release_version}'", sql_calls)
        self.assertNotIn('build_api.export_license', sql_calls)
        self.assertNotIn('build_api.export_readme', sql_calls)
        self.assertNotIn('build_api.export_postupgrade', sql_calls)
        public_metadata = self.repo/'applications/blog/supporting-objects/install-scripts/metadata.sql'
        self.assertIn(f"'{release_version}'", public_metadata.read_text())
        postupgrade = self.repo/'applications/blog/supporting-objects/upgrade-scripts/postupgrade.sql'
        self.assertIn(f"'{release_version}'", postupgrade.read_text())

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
        first = postupgrade.read_bytes()
        self.script('supporting_objects.sh')
        self.assertEqual(postupgrade.read_bytes(), first)

    def test_invalid_version_is_rejected_before_export(self):
        (self.repo/'VERSION.txt').write_text("Release 1.2.3.20261101' --\n")
        self.script('supporting_objects.sh', ok=False)
        self.assertFalse(self.calls.exists())
        self.script('export_application.sh', ok=False)
        self.assertFalse((self.repo/'build/SHA256SUMS').exists())

    def test_release_build_requires_dev_version_match(self):
        self.env['MOCK_WRONG_RELEASE_VERSION'] = '1'
        result = self.script('export_application.sh', ok=False)
        self.assertIn('Release versions differ', result.stderr)
        self.assertFalse((self.repo/'build/SHA256SUMS').exists())

    def test_prepare_release_requires_confirmation(self):
        self.script('prepare_release.sh', ok=False)
        self.script('prepare_release.sh', '--confirm-dev-update')
        calls = '\n'.join(c['sql'] for c in self.calls_data())
        self.assertIn('apex_application_admin.set_application_version(', calls)
        self.assertIn('update blog_settings set attribute_value', calls)
        self.assertIn('APEX_BLOG_VERSION_OK', calls)

    def test_compile_build_api_requires_confirmation_and_validates(self):
        self.script('setup_build_api.sh', ok=False)
        self.script('setup_build_api.sh', '--confirm-dev-ddl')
        calls = '\n'.join(c['sql'] for c in self.calls_data())
        self.assertIn('BUILD_API.sql', calls)
        self.assertIn('user_errors', calls)
        self.env['MOCK_COMPILE_INVALID'] = '1'
        self.script('setup_build_api.sh', '--confirm-dev-ddl', ok=False)

    def test_plsql_export_cannot_change_dev_versions(self):
        plsql = (SOURCE/'automation/database/BUILD_API.sql').read_text()
        export_settings = plsql.split('  procedure export_settings(\n', 2)[2].split('  end export_settings;', 1)[0]
        self.assertNotIn('set_application_version(', export_settings.lower())
        self.assertNotIn('update blog_settings', export_settings.lower())
        self.assertIn('p_release_version', export_settings)
        # Dependency ordering now lives in WRITE_OBJECT_LIST (NOCYCLE).
        self.assertIn('and d.type = c.object_type', plsql)
        self.assertNotIn('t1.object_type = t2.referenced_type', plsql)

    def test_upgrade_uses_previous_and_candidate(self):
        self.script('export_application.sh')
        previous = self.root/'previous.zip'
        with ZipFile(previous, 'w') as z:
            z.writestr('blog-administration-latest.sql', 'prompt old admin\n')
            z.writestr('blog-public-pages-latest.sql', 'prompt old public\n')
        self.script('run_upgrade_test.sh', '--confirm-reset-test', '--previous-zip', str(previous))
        commands = self.calls_data()
        tests = [c for c in commands if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertEqual(sum('install_application.sql' in c['sql'] for c in tests), 4)

    def test_assembler_keeps_sql_whitespace_and_package_order(self):
        root = self.root/'ddl'; (root/'Packages').mkdir(parents=True)
        (root/'Tables').mkdir()
        (root/'Tables/A.sql').write_text("select 'a  b' from dual;\n")
        (root/'Packages/API.sql').write_text('create or replace package api as end;\n/\n'
            'create or replace editionable package body api as end;\n/\n')
        listing = self.root/'names.txt'
        listing.write_text('Tables/A\nPackages/API\n')
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


if __name__ == '__main__':
    unittest.main()
