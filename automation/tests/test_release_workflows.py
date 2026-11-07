"""Candidate build, overwrite, and release-integrity contracts."""
import fcntl
import json
import os
import shlex
import sys
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


    def test_validation_failure_never_publishes(self):
        self.env['MOCK_FAIL_VALIDATE'] = '1'
        p = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('validation success', p.stderr)
        self.assertFalse((self.candidate()/'SHA256SUMS').exists())
        self.env.pop('MOCK_FAIL_VALIDATE')
        self.env['MOCK_PREFLIGHT_FAIL'] = '1'
        p = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('full offline quality gate', p.stderr)
        self.assertTrue((self.root / 'preflight.log').is_file())
        self.assertFalse(self.candidate().exists(), 'Failed gate must not publish candidate')


    def test_candidate_overwrite_replaces_only_current_candidate(self):
        self.script('export_application.sh', '--build-only')
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
        denied = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('already exists', denied.stderr)
        self.script('export_application.sh', '--build-only', '--overwrite')
        self.assertNotEqual((current / 'manifest.json').read_bytes(), old_manifest)
        self.assertEqual((previous / 'keep.txt').read_text(), 'keep previous version')
        self.assertEqual(log_file.read_text(), 'keep deployment log')
        self.script('verify_release.sh')
        self.assertEqual(list(current.parent.glob('.backup.*')), [])
        self.assertEqual(list(current.parent.glob('.candidate.*')), [])
        # The rebuilt candidate has the current source fingerprint.
        self.script('import_apps_to_qa.sh')

    def test_overwrite_failure_restores_previous_verified_candidate(self):
        self.script('export_application.sh', '--build-only')
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
        out = self.script('export_application.sh', '--build-only', '--overwrite', ok=False)
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
        out = self.script('export_application.sh', '--build-only', ok=False)
        self.assertIn('mock first publication failure', out.stderr)
        self.assertFalse(self.candidate().exists())
        self.assertEqual(list(self.candidate().parent.glob('.candidate.*')), [])
        self.assertEqual(list(self.candidate().parent.glob('.backup.*')), [])

    def test_final_verification_failure_restores_previous_candidate(self):
        self.script('export_application.sh', '--build-only')
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
        out = self.script('export_application.sh', '--build-only', '--overwrite', ok=False)
        self.assertIn('mock final verification failure', out.stderr)
        self.assertIn('Restored previous release candidate', out.stderr)
        self.assertEqual(original, {f.name: f.read_bytes() for f in current.iterdir() if f.is_file()})
        self.assertEqual(list(current.parent.glob('.candidate.*')), [])
        self.assertEqual(list(current.parent.glob('.backup.*')), [])
        self.env['PATH'] = self.env['PATH'].removeprefix(f"{self.bin}{os.pathsep}")
        self.script('verify_release.sh')


    def test_overwrite_rejects_symlinks_and_unknown_directories(self):
        external = self.root / 'outside'
        external.mkdir()
        (external / 'dont-delete.txt').write_text('important')
        self.candidate().parent.mkdir(parents=True, exist_ok=True)
        self.candidate().symlink_to(external, target_is_directory=True)
        out = self.script('export_application.sh', '--build-only', '--overwrite', ok=False)
        self.assertIn('Unsafe release candidate target', out.stderr)
        self.assertEqual((external / 'dont-delete.txt').read_text(), 'important')
        self.candidate().unlink()
        self.candidate().mkdir()
        (self.candidate() / 'notes.txt').write_text('not a candidate')
        out = self.script('export_application.sh', '--build-only', '--overwrite', ok=False)
        self.assertIn('unrecognized release directory', out.stderr)
        self.assertEqual((self.candidate() / 'notes.txt').read_text(), 'not a candidate')

    def test_overwrite_rejected_while_candidate_is_locked(self):
        self.script('export_application.sh', '--build-only')
        lock_file = self.candidate().parent / '.locks' / (self.candidate().name + '.lock')
        before = (self.candidate() / 'manifest.json').read_bytes()
        sqlcl_calls = len(self.calls_data())
        with lock_file.open('a') as holder:
            fcntl.flock(holder.fileno(), fcntl.LOCK_SH | fcntl.LOCK_NB)
            out = self.script('export_application.sh', '--build-only', '--overwrite', ok=False)
            self.assertIn('in use by another build or deployment', out.stderr)
            self.assertEqual(len(self.calls_data()), sqlcl_calls, 'Lock must be checked before DEV export')
            fcntl.flock(holder.fileno(), fcntl.LOCK_UN)
        self.assertEqual((self.candidate() / 'manifest.json').read_bytes(), before)


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
