"""Command contracts for release build and disposable TEST acceptance."""

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
        base_env = os.environ.copy()
        # Do not inherit OVERWRITE=YES from the outer Make invocation.
        for name in ('MAKEFLAGS', 'MAKEOVERRIDES', 'MFLAGS', 'GNUMAKEFLAGS',
                     'MAKELEVEL', 'OVERWRITE', 'RELEASE_DIR', 'PREVIOUS_ZIP'):
            base_env.pop(name, None)
        self.env = dict(base_env, AUTOMATION_CALLS=str(self.calls))
        self.stub("automation/ci/preflight.sh", "preflight", failure="FAIL_CHECK")
        self.stub("automation/supporting_objects.sh", "supporting", failure="FAIL_SUPPORTING")
        self.stub("automation/prepare_release.sh", "prepare", failure="FAIL_PREPARE")
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

    def test_build_runs_preparation_export_verification_and_test_in_order(self):
        for extra, explicit_overwrite in (((), False), (('OVERWRITE=YES',), True)):
            with self.subTest(overwrite=explicit_overwrite):
                if self.calls.exists():
                    self.calls.unlink()
                result = self.run_make('-j4', 'build', *extra)
                self.assertEqual(result.returncode, 0, result.stderr)
                events = self.lines()
                self.assertEqual([event.split(':', 1)[0] for event in events], [
                    'supporting', 'prepare', 'export', 'check-source',
                    'verify-release', 'verify-release', 'upgrade', 'install', 'deinstall',
                ])
                self.assertEqual('--overwrite' in events[2], explicit_overwrite)

    def test_build_stops_on_failed_stage(self):
        stages = ['supporting', 'prepare', 'export', 'check-source',
                  'verify-release', 'verify-release', 'upgrade', 'install', 'deinstall']
        failures = [
            ('FAIL_SUPPORTING', 1), ('FAIL_PREPARE', 2), ('FAIL_BUILD', 3),
            ('FAIL_CHECK_SOURCE', 4), ('FAIL_VERIFY_RELEASE', 5),
            ('FAIL_UPGRADE', 7), ('FAIL_INSTALL', 8), ('FAIL_DEINSTALL', 9),
        ]
        for setting, count in failures:
            with self.subTest(setting=setting):
                if self.calls.exists():
                    self.calls.unlink()
                result = self.run_make('build', env=dict(self.env, **{setting: 'YES'}))
                self.assertNotEqual(result.returncode, 0)
                self.assertEqual([event.split(':', 1)[0] for event in self.lines()],
                                 stages[:count])

    def test_test_release_runs_upgrade_fresh_install_deinstall_in_order(self):
        older = self.repo / 'older.zip'
        older.write_bytes(b'test Make orchestration only')
        for previous, upgrade_args in (
            ((), '--release-dir build/releases/old'),
            ((f'PREVIOUS_ZIP={older}',),
             f'--previous-zip {older} --release-dir build/releases/old'),
        ):
            with self.subTest(previous_zip=bool(previous)):
                if self.calls.exists():
                    self.calls.unlink()
                result = self.run_make('-j4', 'test-release', *previous,
                                       'RELEASE_DIR=build/releases/old')
                self.assertEqual(result.returncode, 0, result.stderr)
                self.assertEqual(self.lines(), [
                    'verify-release:--release-dir build/releases/old',
                    f'upgrade:{upgrade_args}',
                    'install:--release-dir build/releases/old',
                    'deinstall:',
                ])

    def test_test_release_failure_stops_before_next_destructive_stage(self):
        # Missing PREVIOUS_ZIP is valid: the upgrade script fetches GitHub latest.
        for setting, expected in (
            ('FAIL_VERIFY_RELEASE', ['verify-release:']),
            ('FAIL_UPGRADE', ['verify-release:', 'upgrade:']),
            ('FAIL_INSTALL', ['verify-release:', 'upgrade:', 'install:']),
        ):
            with self.subTest(setting=setting):
                if self.calls.exists():
                    self.calls.unlink()
                result = self.run_make('test-release', env=dict(self.env, **{setting: 'YES'}))
                self.assertNotEqual(result.returncode, 0)
                self.assertEqual(self.lines(), expected)


if __name__ == "__main__":
    unittest.main()
