"""Ephemeral DEV-to-TEST SQL pretest contracts (mock SQLcl, never a real DB)."""
from pathlib import Path
import re
from datetime import datetime, timedelta
import shlex

from automation.tests.workflow_fixture import WorkflowFixture


class PretestWorkflows(WorkflowFixture):
    def test_equal_version_upgrades_then_installs_and_deinstalls_without_artifacts(self):
        current = (self.repo / 'VERSION.txt').read_text().strip()
        self.github_release(current)  # APEX runtime upgrade, unchanged app version.
        self.make('pretest')
        calls = self.calls_data()
        dev = [call for call in calls if call['argv'][-1] == 'DEV_TEST_SAVED']
        test = [call for call in calls if call['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        exports = [call['sql'] for call in dev if 'apex export ' in call['sql']]
        self.assertEqual(len(exports), 2)
        self.assertTrue(all('-exptype APPLICATION_SOURCE' in sql for sql in exports))
        self.assertTrue(all('-expsupportingobjects Y' in sql for sql in exports))
        self.assertTrue(all('apex import ' not in call['sql'] for call in dev))
        self.assertEqual(sum('install_application.sql' in call['sql'] for call in test), 6)
        self.assertEqual(sum('verify_installed_objects.sql' in call['sql'] for call in test), 3)
        self.assertEqual(sum('verify_deinstalled_objects.sql' in call['sql'] for call in test), 1)
        self.assertFalse((self.repo / 'build').exists(), 'Pretest must never publish a candidate')
        for cmd in exports:
            line = next(line for line in cmd.splitlines() if line.startswith('apex export '))
            parts = shlex.split(line)
            exported_dir = Path(parts[parts.index('-dir') + 1])
            self.assertFalse(exported_dir.exists(), 'Exported SQL must be deleted on success')

    def test_pretest_uses_repo_checksum_policy_not_caller_environment(self):
        self.env['MOCK_GITHUB_NO_DIGEST'] = '1'
        self.env['APEX_BLOG_REQUIRE_GITHUB_SHA256'] = 'YES'
        # An exported environment variable does not override variables.sh.
        result = self.make('pretest', 'TEST=upgrade')
        self.assertIn('checksum=unverified', result.stderr)
        setting = self.repo / 'automation/variables.sh'
        data = setting.read_text()
        self.assertIn('requireGithubReleaseSha256="NO"', data)
        setting.write_text(data.replace('requireGithubReleaseSha256="NO"',
                                        'requireGithubReleaseSha256="YES"'))
        result = self.make('pretest', 'TEST=upgrade', ok=False)
        self.assertIn('lacks SHA-256', result.stderr)

    def test_install_only_does_not_need_previous_zip_or_network(self):
        self.env['MOCK_GITHUB_HTTP_FAIL'] = '1'
        self.env['MOCK_SCHEMA_EMPTY'] = '1'
        self.make('pretest', 'TEST=install')
        calls = self.calls_data()
        test = [call for call in calls if call['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertEqual(sum('install_application.sql' in call['sql'] for call in test), 2)
        self.assertEqual(sum('verify_deinstalled_objects.sql' in call['sql'] for call in test), 0)
        self.assertFalse((self.repo / 'build').exists())
        self.assertFalse(self.github_calls(), 'Install-only pretest must not contact GitHub')

    def test_newer_or_mismatched_github_release_blocks_before_test_reset(self):
        current = (self.repo / 'VERSION.txt').read_text().strip()
        prefix, date = current.rsplit('.', 1)
        newer_day = (datetime.strptime(date, '%Y%m%d') + timedelta(days=1)).strftime('%Y%m%d')
        newer = f'{prefix}.{newer_day}'
        for label in ('newer', 'mismatch'):
            with self.subTest(label=label):
                if label == 'newer':
                    self.github_release(newer)
                else:
                    self.github_release(self.older_version())
                    self.previous_zip(self.root / 'official-github-release.zip', newer)
                result = self.script('pretest.sh', ok=False)
                self.assertIn('Official GitHub', result.stderr)
                test = [call for call in self.calls_data()
                        if call['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
                self.assertFalse(any('remove_application.sql' in call['sql'] or
                                     'install_application.sql' in call['sql'] for call in test))

    def test_test_connection_cannot_point_to_dev_qa_or_production(self):
        for target in ('DEV_TEST_SAVED', 'QA_TEST_SAVED', 'PROD_TEST_SAVED'):
            with self.subTest(target=target):
                self.env['APEX_BLOG_TST_CONNECTION'] = target
                result = self.script('pretest.sh', '--test', 'install', ok=False)
                self.assertIn('must be different from DEV, UAT and production', result.stderr)
                self.assertFalse(self.calls_data())
        self.env['APEX_BLOG_TST_CONNECTION'] = 'DISPOSABLE_TEST_SAVED'

    def test_failed_dev_export_stops_before_any_test_mutation_and_cleans_sql(self):
        self.env['MOCK_FAIL_SQL_EXPORT_FOR'] = '401'  # Second app, after first export.
        result = self.script('pretest.sh', '--test', 'install', ok=False)
        self.assertIn('Pretest DEV SQL export failed: blog', result.stderr)
        calls = self.calls_data()
        self.assertEqual(sum('apex export ' in call['sql'] for call in calls), 2)
        self.assertFalse(any('remove_application.sql' in call['sql'] or
                             'install_application.sql' in call['sql'] for call in calls))
        first_export = next(call['sql'] for call in calls if 'apex export ' in call['sql'])
        match = re.search(r'-dir (\S+)', first_export)
        self.assertIsNotNone(match)
        self.assertFalse(Path(match.group(1).strip('"')).exists())

    def test_retired_previous_zip_override_is_rejected(self):
        for target in ('pretest', 'test-release', 'build'):
            with self.subTest(target=target):
                output = self.make(target, 'PREVIOUS_ZIP=/tmp/untrusted.zip', ok=False)
                self.assertIn('PREVIOUS_ZIP is obsolete', output.stderr)
                self.assertFalse(self.calls_data())

    def test_upgrade_only_preserves_current_test_installation(self):
        self.github_release((self.repo / 'VERSION.txt').read_text().strip())
        self.make('pretest', 'TEST=upgrade')
        test = [call for call in self.calls_data()
                if call['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertEqual(sum('install_application.sql' in call['sql'] for call in test), 4)
        self.assertEqual(sum('verify_deinstalled_objects.sql' in call['sql'] for call in test), 0)
        self.assertFalse((self.repo / 'build').exists())

    def test_deinstall_only_installs_then_cleans_test(self):
        self.env['MOCK_SCHEMA_EMPTY'] = '1'
        self.make('pretest', 'TEST=deinstall')
        test = [call for call in self.calls_data()
                if call['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertEqual(sum('install_application.sql' in call['sql'] for call in test), 2)
        self.assertEqual(sum('verify_deinstalled_objects.sql' in call['sql'] for call in test), 1)
        self.assertFalse((self.repo / 'build').exists())

    def test_invalid_selection_is_rejected_before_any_db_contact(self):
        for value in ('typo', 'all;echoBAD'):
            with self.subTest(selection=value):
                result = self.script('pretest.sh', '--test', value, ok=False)
                self.assertIn('--test must be', result.stderr)
                self.assertFalse(self.calls_data())
        result = self.make('pretest', 'TEST=typo', ok=False)
        self.assertIn('TEST must be install, upgrade, deinstall', result.stderr)
        self.assertFalse(self.calls_data())

    def test_formal_release_upgrade_still_rejects_equal_version(self):
        self.stub_release_candidate()
        self.github_release((self.repo / 'VERSION.txt').read_text().strip())
        result = self.script('run_upgrade_test.sh', ok=False)
        self.assertIn('Official GitHub', result.stderr)
        self.assertFalse(any('remove_application.sql' in call['sql']
                             for call in self.calls_data()))
