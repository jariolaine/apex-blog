"""Candidate build, overwrite, and release-integrity contracts."""
import fcntl
import json
import os
import shlex
import sys
import shutil
from zipfile import ZipFile

from automation.tests.workflow_fixture import WorkflowFixture


class ReleaseWorkflows(WorkflowFixture):

    def test_explicit_source_then_build_exports_apexlang_and_sql_release(self):
        self.script('export_application.sh', '--source-only')
        self.assertFalse(self.candidate().exists(), 'Source refresh must not publish a release')
        source = self.repo / 'applications/blog-admin/application.apx'
        before_build = source.read_bytes()
        self.script('export_application.sh', '--build-only')
        self.assertEqual(source.read_bytes(), before_build, 'Build must not refresh tracked source')
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

    def test_build_rejects_static_drift_before_publishing(self):
        css = self.repo/'applications/blog/shared-components/static-files/css/style.css'
        original = css.read_bytes()
        css.write_bytes(original + b'\n/* repository edit not imported to DEV */\n')
        app = self.repo/'applications/blog/application.apx'
        original_app = app.read_bytes()
        out = self.script('export_application.sh', '--build-only', ok=False)
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
        p = self.script('export_application.sh', '--build-only', ok=False)
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
        p = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('validation success', p.stderr)
        self.assertFalse((self.candidate()/'SHA256SUMS').exists())

    def test_release_build_rejects_deinstall_drift_before_dev_sqlcl(self):
        deinstall = self.repo / 'applications/blog-admin/supporting-objects/deinstall-script.sql'
        source = deinstall.read_text()
        self.assertIn('drop package blog_install;', source)
        deinstall.write_text(source.replace('drop package blog_install;\n', ''))
        result = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('Release deinstall SQL is inconsistent', result.stderr)
        self.assertFalse(self.calls.exists(), 'Invalid uninstall SQL must stop before contacting DEV')

    def test_release_build_requires_dev_version_match(self):
        self.env['MOCK_WRONG_RELEASE_VERSION'] = '1'
        result = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('Release versions differ', result.stderr)
        self.assertFalse((self.candidate()/'SHA256SUMS').exists())

    def test_release_build_stops_before_publish_on_version_drift(self):
        for root in (self.repo / 'applications', self.template):
            for alias in ('blog-admin', 'blog'):
                self.drift_app_version(root / alias / 'application.apx')
        out = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('Release source consistency failed', out.stderr)
        self.assertFalse(self.candidate().exists())

    def test_release_rejects_invalid_metadata_before_contacting_dev(self):
        public = self.repo/'applications/blog/supporting-objects/install-scripts/metadata.sql'
        original = public.read_text()
        public.write_text(original.replace(
            'blog_util.int_to_vc2(apex_application_install.get_application_id)', '401', 1
        ))
        result = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('Release metadata is inconsistent', result.stderr)
        self.assertFalse(self.calls.exists(), 'Metadata validation must run before DEV SQLcl')

    def test_invalid_version_is_rejected_before_export(self):
        (self.repo/'VERSION.txt').write_text("Release 1.2.3.20261101' --\n")
        self.script('supporting_objects.sh', ok=False)
        self.assertFalse(self.calls.exists())
        self.script('export_application.sh', '--build-only', ok=False)
        self.assertFalse((self.candidate()/'SHA256SUMS').exists())

    def test_versioned_manifest_records_both_apps_and_source_fingerprint(self):
        self.script('export_application.sh', '--build-only')
        candidate = self.candidate()
        manifest = json.loads((candidate / 'manifest.json').read_text())
        self.assertEqual(manifest['release'], (self.repo / 'VERSION.txt').read_text().strip())
        self.assertEqual([a['devId'] for a in manifest['applications']], [402, 401])
        self.assertEqual(len(manifest['sourceSha256']), 64)
        self.assertEqual(len(manifest['files']), 7)
        self.script('verify_release.sh')
        self.assertTrue((candidate / 'SHA256SUMS').is_file())

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

    def test_failed_first_publication_removes_stage_and_unverified_candidate(self):
        # Failure after staging must not expose a partial first release.
        mover = self.bin / 'mv'
        mover.write_text(
            '#!/usr/bin/env bash\n'
            'if [[ "$*" == *"/.candidate."* ]]; then\n'
            '  echo "mock first publication failure" >&2; exit 77\n'
            'fi\n'
            'exec /usr/bin/mv "$@"\n', encoding='utf-8',
        )
        mover.chmod(0o755)
        self.env['PATH'] = f"{self.bin}{os.pathsep}{self.env.get('PATH', '')}"
        out = self.make('build', ok=False)
        self.assertIn('mock first publication failure', out.stderr)
        self.assertFalse(self.candidate().exists())
        self.assertEqual(list(self.candidate().parent.glob('.candidate.*')), [])
        self.assertEqual(list(self.candidate().parent.glob('.backup.*')), [])

    def test_final_verification_failure_restores_previous_candidate(self):
        self.make('build')
        current = self.candidate()
        original = {f.name: f.read_bytes() for f in current.iterdir() if f.is_file()}
        python = self.bin / 'python3'
        python.write_text(
            '#!/usr/bin/env bash\n'
            # Reject only published verification; allow manifest creation and
            # staging verification, to test rollback after a successful rename.
            'if [[ "$*" == *"release_manifest.py verify --dir "* '
            '&& "$*" != *"--staging"* ]]; then\n'
            '  echo "mock final verification failure" >&2; exit 88\n'
            'fi\n'
            f'exec {shlex.quote(sys.executable)} "$@"\n', encoding='utf-8',
        )
        python.chmod(0o755)
        self.env['PATH'] = f"{self.bin}{os.pathsep}{self.env.get('PATH', '')}"
        out = self.make('build', 'OVERWRITE=YES', ok=False)
        self.assertIn('mock final verification failure', out.stderr)
        self.assertIn('Restored previous release candidate', out.stderr)
        self.assertEqual(original, {f.name: f.read_bytes() for f in current.iterdir() if f.is_file()})
        self.assertEqual(list(current.parent.glob('.candidate.*')), [])
        self.assertEqual(list(current.parent.glob('.backup.*')), [])
        self.env['PATH'] = self.env['PATH'].removeprefix(f"{self.bin}{os.pathsep}")
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
        sqlcl_calls = len(self.calls_data())
        with lock_file.open('a') as holder:
            fcntl.flock(holder.fileno(), fcntl.LOCK_SH | fcntl.LOCK_NB)
            out = self.make('build', 'OVERWRITE=YES', ok=False)
            self.assertIn('in use by another build or deployment', out.stderr)
            self.assertEqual(len(self.calls_data()), sqlcl_calls, 'Lock must be checked before DEV export')
            fcntl.flock(holder.fileno(), fcntl.LOCK_UN)
        self.assertEqual((self.candidate() / 'manifest.json').read_bytes(), before)

    def test_direct_export_requires_exactly_one_mode_before_contacting_dev(self):
        source = self.repo / 'applications/blog-admin/application.apx'
        original = source.read_bytes()
        for args, error in (
            ((), 'Usage: export_application.sh'),
            (('--source-only', '--build-only'), 'Only one export mode'),
            (('--build-only', '--build-only'), 'Only one export mode'),
            (('--source-only', '--source-only'), 'Only one export mode'),
            (('--overwrite',), '--overwrite requires --build-only'),
            (('--unknown-option',), 'Usage: export_application.sh'),
        ):
            with self.subTest(args=args):
                result = self.script('export_application.sh', *args, ok=False)
                self.assertIn(error, result.stderr)
                self.assertFalse(self.calls.exists(), 'Invalid CLI must not invoke SQLcl')
                self.assertFalse(self.candidate().exists(), 'Invalid CLI must not publish')
                self.assertEqual(source.read_bytes(), original)

    def test_overwrite_flag_requires_explicit_build_mode(self):
        out = self.script('export_application.sh', '--source-only', '--overwrite', ok=False)
        self.assertIn('--overwrite requires --build-only', out.stderr)
        self.assertFalse(self.calls.exists())
        out = self.make('build', 'OVERWRITE=possibly', ok=False)
        self.assertIn('OVERWRITE must be YES', out.stderr)
        self.assertFalse(self.calls.exists())

    def test_stack_package_excludes_local_terraform_state_and_secrets(self):
        tf = self.repo / 'Stack/terraform'
        (tf / '.terraform/cache').mkdir(parents=True)
        (tf / '.terraform/cache/large.bin').write_bytes(b'PRIVATE CACHE')
        (tf / 'terraform.tfstate').write_text('private state')
        (tf / 'terraform.tfvars').write_text('private values')
        (tf / 'terraform.auto.tfvars.json').write_text('{"secret": true}')
        (tf / '.env').write_text('PRIVATE=YES')
        self.script('export_application.sh', '--build-only')
        with ZipFile(self.candidate() / 'apex-blog-stack-latest.zip') as archive:
            names = archive.namelist()
            self.assertFalse(any('.terraform/' in n or n.endswith('.tfstate')
                                 or n.endswith('.tfvars') or n.endswith('.tfvars.json')
                                 or n.endswith('.env')
                                 for n in names), names)
            self.assertIn('VERSION.txt', names)

    def test_manifest_and_package_tampering_are_detected(self):
        self.script('export_application.sh', '--build-only')
        candidate = self.candidate()
        with (candidate / 'manifest.json').open('a') as stream:
            stream.write('\n')
        out = self.script('verify_release.sh', ok=False)
        self.assertIn('checksum mismatch', out.stderr.lower())

    def test_candidate_directory_name_must_match_manifest(self):
        self.script('export_application.sh', '--build-only')
        fake = self.repo / 'build/releases/not-the-version'
        shutil.copytree(self.candidate(), fake)
        self.script('verify_release.sh', '--release-dir', str(fake), ok=False)
