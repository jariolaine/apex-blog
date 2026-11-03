"""Contracts for APEX Blog release-candidate and disposable TEST Make workflows."""

import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


SOURCE = Path(__file__).resolve().parents[2]


class ReleaseCommandTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="apex-blog-shortcuts-")
        self.addCleanup(self.temp.cleanup)
        self.repo = Path(self.temp.name)
        shutil.copy2(SOURCE / "Makefile", self.repo / "Makefile")
        (self.repo / "automation/ci").mkdir(parents=True)
        self.calls = self.repo / "calls.log"
        self.env = dict(os.environ, AUTOMATION_CALLS=str(self.calls))
        self.stub("automation/ci/preflight.sh", "preflight", failure="FAIL_CHECK")
        self.stub("automation/check_source.sh", "check-source:$*", failure="FAIL_CHECK_SOURCE")
        self.stub("automation/verify_release.sh", "verify-release:$*", failure="FAIL_VERIFY_RELEASE")
        self.stub("automation/export_application.sh", "export:$*", failure="FAIL_BUILD")
        self.stub("automation/run_upgrade_test.sh", "upgrade:$*", failure="FAIL_UPGRADE")
        self.stub("automation/run_install_test.sh", "install:$*", failure="FAIL_INSTALL")
        self.stub("automation/run_deinstall_test.sh", "deinstall:$*", failure="FAIL_DEINSTALL")

    def stub(self, filename, label, failure=None):
        script = self.repo / filename
        script.parent.mkdir(parents=True, exist_ok=True)
        fail_check = f'if [[ "${{{failure}:-}}" == YES ]]; then exit 42; fi\n' if failure else ""
        script.write_text(
            "#!/usr/bin/env bash\n"
            f'printf "%s\\n" "{label}" >> "$AUTOMATION_CALLS"\n'
            + fail_check,
            encoding="utf-8",
        )
        script.chmod(0o755)

    def run_make(self, *args, env=None):
        return subprocess.run(
            ["make", "--no-print-directory", *args],
            cwd=self.repo,
            env=env or self.env,
            text=True,
            capture_output=True,
            timeout=15,
        )

    def lines(self):
        return self.calls.read_text().splitlines() if self.calls.exists() else []


    # Single-command release/TEST workflow contracts.

    def test_candidate_runs_quality_build_and_verify_sequentially(self):
        result = self.run_make('-j4', 'candidate')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.lines(), [
            'preflight', 'export:--build-only', 'check-source:release',
            'verify-release:',
        ])


    def test_candidate_stops_when_build_or_verification_fails(self):
        build = self.run_make('candidate', env=dict(self.env, FAIL_BUILD='YES'))
        self.assertNotEqual(build.returncode, 0)
        self.assertEqual(self.lines(), ['preflight', 'export:--build-only'])
        self.calls.unlink()
        verify = self.run_make('candidate', env=dict(self.env, FAIL_VERIFY_RELEASE='YES'))
        self.assertNotEqual(verify.returncode, 0)
        self.assertEqual(self.lines(), [
            'preflight', 'export:--build-only', 'check-source:release',
            'verify-release:',
        ])

    def test_test_release_requires_confirmation_and_explicit_previous_zip(self):
        without_confirmation = self.run_make('test-release')
        self.assertNotEqual(without_confirmation.returncode, 0)
        self.assertIn('CONFIRM=YES', without_confirmation.stderr)
        without_archive = self.run_make('test-release', 'CONFIRM=YES')
        self.assertNotEqual(without_archive.returncode, 0)
        self.assertIn('PREVIOUS_ZIP', without_archive.stderr)
        nonexistent = self.run_make('test-release', 'CONFIRM=YES', 'PREVIOUS_ZIP=missing.zip')
        self.assertNotEqual(nonexistent.returncode, 0)
        self.assertEqual(self.lines(), [])

    def test_test_release_runs_upgrade_fresh_install_deinstall_in_order(self):
        older = self.repo / 'older.zip'
        older.write_bytes(b'test Make orchestration only')
        result = self.run_make('-j4', 'test-release', 'CONFIRM=YES',
                               f'PREVIOUS_ZIP={older}', 'RELEASE_DIR=build/releases/old')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.lines(), [
            'verify-release:--release-dir build/releases/old',
            f'upgrade:--confirm-reset-test --previous-zip {older} --release-dir build/releases/old',
            'install:--confirm-reset-test --release-dir build/releases/old',
            'deinstall:--confirm-test-deinstall',
        ])

    def test_test_release_failure_stops_before_next_destructive_stage(self):
        older = self.repo / 'older.zip'
        older.write_bytes(b'test Make orchestration only')
        args = ('test-release', 'CONFIRM=YES', f'PREVIOUS_ZIP={older}')
        for setting, expected in (
            ('FAIL_VERIFY_RELEASE', ['verify-release:']),
            ('FAIL_UPGRADE', ['verify-release:', f'upgrade:--confirm-reset-test --previous-zip {older}']),
            ('FAIL_INSTALL', ['verify-release:', f'upgrade:--confirm-reset-test --previous-zip {older}',
                              'install:--confirm-reset-test']),
        ):
            with self.subTest(setting=setting):
                if self.calls.exists():
                    self.calls.unlink()
                result = self.run_make(*args, env=dict(self.env, **{setting: 'YES'}))
                self.assertNotEqual(result.returncode, 0)
                self.assertEqual(self.lines(), expected)


if __name__ == "__main__":
    unittest.main()
