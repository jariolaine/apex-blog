"""QA/production gates and candidate integrity using the real deployment scripts."""

from automation.tests.workflow_fixture import WorkflowFixture


class DeployWorkflows(WorkflowFixture):
    # Deployments consume a verified release; they must never re-export DEV.
    needs_dev_snapshot = False

    def test_direct_qa_deploy_preflight_blocks_database_calls(self):
        self.env['MOCK_PREFLIGHT_FAIL'] = '1'
        self.script('deploy.sh', 'qa', ok=False)
        self.assertEqual((self.root / 'preflight.log').read_text().strip(), 'preflight')
        self.assertFalse(self.calls.exists())

    def test_qa_and_production_use_same_sql_release_and_distinct_connections(self):
        self.stub_release_candidate()
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
        self.stub_release_candidate()
        with (self.candidate()/'blog-public-pages-latest.sql').open('a') as f:
            f.write('prompt unexpected edit\n')
        p = self.script('import_apps_to_qa.sh', ok=False)
        self.assertIn('checksum mismatch', p.stderr)
        self.assertFalse(any(call['argv'][-1] == 'QA_TEST_SAVED'
                             for call in self.calls_data()))

    def test_production_uses_original_candidate_after_source_changes(self):
        self.stub_release_candidate()
        candidate = self.candidate()
        self.script('import_apps_to_qa.sh')
        ddl = self.repo / 'Database/Packages/BLOG_UTIL.pkb'
        ddl.write_bytes(ddl.read_bytes() + b'\n-- WIP DEV modification\n')
        self.script('import_apps_to_pro.sh', '--confirm-production', '--release-dir', str(candidate))
        self.assertEqual(sum('install_application.sql' in c['sql']
                             for c in self.calls_data() if c['argv'][-1] == 'PROD_TEST_SAVED'), 2)
        self.assertFalse((candidate / 'deploy-logs').exists())

    def test_qa_checks_source_fingerprint_against_candidate(self):
        self.stub_release_candidate()
        before = len(self.calls_data())
        ddl = self.repo / 'Database/Packages/BLOG_UTIL.pkb'
        ddl.write_bytes(ddl.read_bytes() + b'\n-- changed after build\n')
        out = self.script('import_apps_to_qa.sh', ok=False)
        self.assertIn('source fingerprint differs', out.stderr)
        self.assertFalse(any(c['argv'][-1] == 'QA_TEST_SAVED'
                             for c in self.calls_data()[before:]))

    def test_qa_source_fingerprint_includes_schema_manifests(self):
        self.stub_release_candidate()
        before = len(self.calls_data())
        manifest = self.repo / 'automation/schema/upgrade.list'
        manifest.write_text(manifest.read_text() + '\n# reviewed manifest change\n')
        out = self.script('import_apps_to_qa.sh', ok=False)
        self.assertIn('source fingerprint differs', out.stderr)
        self.assertFalse(any(c['argv'][-1] == 'QA_TEST_SAVED'
                             for c in self.calls_data()[before:]))
