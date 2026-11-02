"""Mock-backed TEST install, upgrade, and deinstall orchestration contracts."""
from datetime import datetime, timedelta

from automation.tests.workflow_fixture import WorkflowFixture, SOURCE


class TestDatabaseWorkflows(WorkflowFixture):
    # TEST operations accept a checked, local release ZIP; they must never
    # depend on a live DEV export.
    needs_dev_snapshot = False

    def test_test_connection_required_and_correct_target(self):
        self.stub_release_candidate()
        self.script('run_install_test.sh', ok=False)
        self.script('run_install_test.sh', '--confirm-reset-test')
        commands = self.calls_data()
        tests = [c for c in commands if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertTrue(any('remove_application.sql' in c['sql'] for c in tests))
        self.assertEqual(sum('install_application.sql' in c['sql'] for c in tests), 2)
        self.env['APEX_BLOG_TST_CONNECTION'] = 'PROD_TEST_SAVED'
        self.script('run_install_test.sh', '--confirm-reset-test', ok=False)

    def test_clean_test_schema_skips_deinstall_sql(self):
        self.stub_release_candidate()
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

    def test_upgrade_uses_previous_and_candidate(self):
        self.stub_release_candidate()
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
        self.stub_release_candidate()
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
        self.stub_release_candidate()
        self.mock_curl_download(self.older_version())
        self.env['MOCK_CURL_FAIL'] = '1'
        out = self.script('run_upgrade_test.sh', '--confirm-reset-test', ok=False)
        self.assertIn('Could not download previous release', out.stderr)
        self.assertFalse(any(c['argv'][-1] == 'DISPOSABLE_TEST_SAVED'
                             for c in self.calls_data()))

    def test_upgrade_rejects_latest_when_it_is_not_older(self):
        self.stub_release_candidate()
        current = (self.repo / 'VERSION.txt').read_text().strip()
        self.mock_curl_download(current)
        out = self.script('run_upgrade_test.sh', '--confirm-reset-test', ok=False)
        self.assertIn('Previous release ZIP must identify a release older', out.stderr)
        self.assertIn('PREVIOUS_ZIP', out.stderr)
        self.assertFalse(any(c['argv'][-1] == 'DISPOSABLE_TEST_SAVED'
                             for c in self.calls_data()))

    def test_upgrade_rejects_same_newer_and_unidentified_release_before_reset(self):
        self.stub_release_candidate()
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
        self.stub_release_candidate()
        self.script('run_install_test.sh', '--confirm-reset-test')
        installs = [c['sql'] for c in self.calls_data()
                    if 'install_application.sql' in c['sql']]
        self.assertEqual(len(installs), 2)
        current = (self.repo / 'VERSION.txt').read_text().strip()
        self.assertTrue(all(current in sql for sql in installs))

    def test_wrong_installed_app_version_blocks_install(self):
        self.stub_release_candidate()
        self.env['MOCK_INSTALL_WRONG_VERSION'] = '1'
        result = self.script('run_install_test.sh', '--confirm-reset-test', ok=False)
        self.assertIn('Installation failed', result.stderr)
        tests = [c for c in self.calls_data()
                 if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertEqual(sum('install_application.sql' in c['sql'] for c in tests), 1)
        self.assertFalse(any('verify_installed_objects.sql' in c['sql'] for c in tests))

    def test_missing_install_success_marker_blocks_install(self):
        self.stub_release_candidate()
        self.env['MOCK_INSTALL_MISSING_MARKER'] = '1'
        out = self.script('run_install_test.sh', '--confirm-reset-test', ok=False)
        self.assertIn('Cannot verify app', out.stderr)

    def test_invalid_blog_objects_block_complete_install(self):
        checker = (self.repo / 'automation/sql/verify_installed_objects.sql').read_text()
        self.assertIn('from user_objects', checker)
        self.assertIn("substr(object_name, 1, 5) = 'BLOG_'", checker)
        self.assertIn('raise_application_error(-20057', checker)
        self.stub_release_candidate()
        self.env['MOCK_INVALID_BLOG_OBJECTS'] = '1'
        result = self.script('run_install_test.sh', '--confirm-reset-test', ok=False)
        self.assertIn('Invalid BLOG_ database objects', result.stderr)
        calls = [c for c in self.calls_data()
                 if c['argv'][-1] == 'DISPOSABLE_TEST_SAVED']
        self.assertEqual(sum('install_application.sql' in c['sql'] for c in calls), 2)
        self.assertEqual(sum('verify_installed_objects.sql' in c['sql'] for c in calls), 1)

    def test_missing_object_verification_marker_blocks_install(self):
        self.stub_release_candidate()
        self.env['MOCK_OBJECTS_MISSING_MARKER'] = '1'
        out = self.script('run_install_test.sh', '--confirm-reset-test', ok=False)
        self.assertIn('Cannot verify BLOG_ database objects', out.stderr)
