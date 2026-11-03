"""Source synchronization and Git-owned Supporting Objects contracts."""
from automation.tests.workflow_fixture import WorkflowFixture


class SourceWorkflows(WorkflowFixture):

    def test_dev_import_preflight_blocks_database_calls(self):
        self.env['MOCK_PREFLIGHT_FAIL'] = '1'
        self.script('import_apps_to_dev.sh', '--confirm-dev-import', ok=False)
        self.assertEqual((self.root / 'preflight.log').read_text().strip(), 'preflight')
        self.assertFalse(self.calls.exists())

    def test_dev_import_requires_confirmation_and_validates_both(self):
        self.script('import_apps_to_dev.sh', ok=False)
        self.script('import_apps_to_dev.sh', '--confirm-dev-import')
        commands = self.calls_data()
        imports = [c for c in commands if 'apex import -input ' in c['sql']]
        self.assertEqual(len(imports), 2)
        self.assertTrue(all('set_auto_install_sup_obj(false)' in c['sql'] for c in imports))
        self.assertTrue(all(c['argv'][-1] == 'DEV_TEST_SAVED' for c in imports))


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


    def test_supporting_failure_does_not_partially_write_sql(self):
        sql = self.repo/'applications/blog-admin/supporting-objects/install-scripts/database-objects.sql'
        original = sql.read_bytes()
        public = self.repo/'applications/blog/supporting-objects/install-scripts/metadata.sql'
        public.write_text(public.read_text().replace("'G_APP_VERSION'", "'UNKNOWN_VERSION'"))
        result = self.script('supporting_objects.sh', ok=False)
        self.assertIn('Git-owned metadata validation failed', result.stderr)
        self.assertEqual(sql.read_bytes(), original)
        self.assertFalse(self.calls.exists())
