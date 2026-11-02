"""Source synchronization and Git-owned Supporting Objects contracts."""
import json
import shutil

from automation.tests.workflow_fixture import WorkflowFixture, SOURCE


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

    def test_dev_sync_checks_deployment_id_before_connecting(self):
        deployment = self.repo / 'applications/blog/deployments/default.json'
        deployment.write_text('{"app": {"id": 999}}\n')
        out = self.script('import_apps_to_dev.sh', '--confirm-dev-import', ok=False)
        self.assertIn('Local APEXLang source consistency failed', out.stderr)
        self.assertFalse(self.calls.exists())

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

    def test_supporting_failure_does_not_partially_write_sql(self):
        sql = self.repo/'applications/blog-admin/supporting-objects/install-scripts/database-objects.sql'
        original = sql.read_bytes()
        public = self.repo/'applications/blog/supporting-objects/install-scripts/metadata.sql'
        public.write_text(public.read_text().replace("'G_APP_VERSION'", "'UNKNOWN_VERSION'"))
        result = self.script('supporting_objects.sh', ok=False)
        self.assertIn('Git-owned metadata validation failed', result.stderr)
        self.assertEqual(sql.read_bytes(), original)
        self.assertFalse(self.calls.exists())

    def test_source_check_rejects_missing_static_and_supporting_files(self):
        static = self.repo / 'applications/blog/shared-components/static-files/css/style.css'
        static.unlink()
        supporting = self.repo / 'applications/blog/supporting-objects/upgrade-scripts/postupgrade.sql'
        supporting.unlink()
        out = self.script('check_source.sh', 'source', ok=False)
        self.assertIn('referenced static file missing', out.stderr)
        self.assertIn('referenced Supporting Objects SQL missing', out.stderr)

    def test_release_readiness_rejects_mismatched_application_version(self):
        self.drift_app_version(self.repo / 'applications/blog/application.apx')
        self.script('check_source.sh', 'source')  # WIP source can be edited.
        out = self.script('check_source.sh', 'release', ok=False)
        self.assertIn('application.apx version', out.stderr)

    def test_prepare_release_requires_confirmation(self):
        self.script('prepare_release.sh', ok=False)
        self.script('prepare_release.sh', '--confirm-dev-update')
        calls = '\n'.join(c['sql'] for c in self.calls_data())
        self.assertIn('apex_application_admin.set_application_version(', calls)
        self.assertIn('update blog_settings set attribute_value', calls)
        self.assertIn('APEX_BLOG_VERSION_OK', calls)
