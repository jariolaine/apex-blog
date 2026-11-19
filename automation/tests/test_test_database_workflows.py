"""Mock-backed TEST install, upgrade, and deinstall orchestration contracts."""
from datetime import datetime, timedelta
from automation.tests.workflow_fixture import WorkflowFixture


class TestDatabaseWorkflows(WorkflowFixture):
    # Formal TEST release operations use GitHub as the upgrade baseline,
    # not a live DEV export.
    needs_dev_snapshot = False

    def test_test_connection_required_and_correct_target(self):
        self.stub_release_candidate()
        self.env['APEX_BLOG_TST_CONNECTION'] = 'PROD_TEST_SAVED'
        denied = self.script('run_install_test.sh', ok=False)
        self.assertIn('must be different from DEV, UAT and production', denied.stderr)
        self.env['APEX_BLOG_TST_CONNECTION'] = 'DISPOSABLE_TEST_SAVED'
        self.script('run_install_test.sh')
        commands = self.calls_data()
        tests = [c for c in commands if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertTrue(any('remove_application.sql' in c['sql'] for c in tests))
        self.assertEqual(sum('install_application.sql' in c['sql'] for c in tests), 2)
        self.env['APEX_BLOG_TST_CONNECTION'] = 'PROD_TEST_SAVED'
        self.script('run_install_test.sh', ok=False)


    def test_deinstall_runs_install_first_and_verifies_everything_is_removed(self):
        self.stub_release_candidate()
        self.env['MOCK_SCHEMA_EMPTY'] = '1'
        # Internal install and deinstall scripts remain testable independently;
        # their obsolete public Make wrappers are intentionally removed.
        self.script('run_install_test.sh')
        self.script('run_deinstall_test.sh')
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


    def test_deinstall_fails_if_any_user_objects_remain(self):
        self.stub_release_candidate()
        self.env.update(MOCK_SCHEMA_EMPTY='1', MOCK_DEINSTALL_LEFTOVER_OBJECTS='1')
        self.script('run_install_test.sh')
        p = self.script('run_deinstall_test.sh', ok=False)
        self.assertIn('1 user object', p.stderr)
        self.assertIn('TEST deinstallation left objects', p.stderr)

    def test_deinstall_fails_if_test_apex_application_remains(self):
        self.stub_release_candidate()
        self.env.update(MOCK_SCHEMA_EMPTY='1', MOCK_DEINSTALL_LEFTOVER_APPS='1')
        self.script('run_install_test.sh')
        p = self.script('run_deinstall_test.sh', ok=False)
        self.assertIn('1 application remains', p.stderr)
        self.assertIn('TEST deinstallation left objects', p.stderr)


    def test_upgrade_uses_published_github_release_and_candidate(self):
        self.stub_release_candidate()
        self.script('run_upgrade_test.sh')
        commands = self.calls_data()
        tests = [c for c in commands if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        installs = [c['sql'] for c in tests if 'install_application.sql' in c['sql']]
        self.assertEqual(len(installs), 4)
        expected = (self.repo / 'VERSION.txt').read_text().strip()
        self.assertTrue(all(self.older_version() in cmd for cmd in installs[:2]))
        self.assertTrue(all(expected in cmd for cmd in installs[2:]))
        self.assertEqual(sum('verify_installed_objects.sql' in c['sql'] for c in tests), 2)
        self.assertTrue(any('/releases/latest' in url for url in self.github_calls()))

    def test_upgrade_rejects_same_newer_and_invalid_github_release_before_reset(self):
        self.stub_release_candidate()
        current = (self.repo / 'VERSION.txt').read_text().strip()
        prefix, date = current.rsplit('.', 1)
        later_date = (datetime.strptime(date, '%Y%m%d') + timedelta(days=1)).strftime('%Y%m%d')
        later = f'{prefix}.{later_date}'
        for label, version in (('same', current), ('newer', later)):
            with self.subTest(label=label):
                self.github_release(version)
                out = self.script('run_upgrade_test.sh', ok=False)
                self.assertIn('Official GitHub', out.stderr)
                self.assertFalse(any(c['argv'][-1] == 'DISPOSABLE_TEST_SAVED'
                                     for c in self.calls_data()), label)
