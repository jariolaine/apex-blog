"""Offline regressions for the developer-facing automation shortcuts."""

import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


SOURCE = Path(__file__).resolve().parents[2]


class MakeShortcutTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="apex-blog-shortcuts-")
        self.addCleanup(self.temp.cleanup)
        self.repo = Path(self.temp.name)
        shutil.copy2(SOURCE / "Makefile", self.repo / "Makefile")
        (self.repo / "automation/ci").mkdir(parents=True)
        self.calls = self.repo / "calls.log"
        self.env = dict(os.environ, AUTOMATION_CALLS=str(self.calls))
        self.stub("automation/ci/bootstrap.sh", "ci", failure="FAIL_CI")
        self.stub("automation/setup_build_api.sh", "build-api", failure="FAIL_BUILD_API")
        self.stub("automation/ci/preflight.sh", "preflight")
        self.stub("automation/check_source.sh", "check-source:$*", failure="FAIL_CHECK_SOURCE")
        self.stub("automation/verify_release.sh", "verify-release:$*", failure="FAIL_VERIFY_RELEASE")

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

    def test_setup_requires_explicit_dev_confirmation_before_any_work(self):
        result = self.run_make("setup")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("make setup CONFIRM=YES", result.stderr)
        self.assertEqual(self.lines(), [])

    def test_one_setup_command_is_sequential_even_with_parallel_make(self):
        result = self.run_make("-j2", "setup", "CONFIRM=YES")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.lines(), ["ci", "build-api"])
        self.assertIn("Setup complete", result.stdout)

    def test_failed_ci_setup_never_reaches_dev(self):
        env = dict(self.env, FAIL_CI="YES")
        result = self.run_make("setup", "CONFIRM=YES", env=env)
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.lines(), ["ci"])
        self.assertNotIn("Setup complete", result.stdout)

    def test_failed_dev_setup_is_reported(self):
        env = dict(self.env, FAIL_BUILD_API="YES")
        result = self.run_make("setup", "CONFIRM=YES", env=env)
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.lines(), ["ci", "build-api"])
        self.assertNotIn("Setup complete", result.stdout)

    def test_standalone_setup_targets_still_work(self):
        for target in ("setup-ci", "setup-build-api"):
            result = self.run_make(target)
            self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.lines(), ["ci", "build-api"])

    def test_check_is_alias_of_preflight(self):
        result = self.run_make("check")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.lines(), ["preflight"])

    def test_release_check_runs_source_before_candidate_validation(self):
        result = self.run_make("release-check", "RELEASE_DIR=build/releases/example")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(
            self.lines(),
            ["check-source:release", "verify-release:--release-dir build/releases/example"],
        )

    def test_release_check_stops_when_source_validation_fails(self):
        env = dict(self.env, FAIL_CHECK_SOURCE="YES")
        result = self.run_make("release-check", env=env)
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.lines(), ["check-source:release"])


class DoctorTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="apex-blog-doctor-")
        self.addCleanup(self.temp.cleanup)
        self.repo = Path(self.temp.name)
        (self.repo / "automation/ci").mkdir(parents=True)
        (self.repo / "automation/database").mkdir(parents=True)
        shutil.copy2(SOURCE / "automation/ci/doctor.sh", self.repo / "automation/ci/doctor.sh")
        (self.repo / "automation/variables.sh").write_text("# configuration\n")
        (self.repo / "automation/database/BUILD_API.sql").write_text("-- package source\n")
        (self.repo / "package-lock.json").write_text("{}\n")
        self.fake_bin = self.repo / "fake-bin"
        self.fake_bin.mkdir()
        self.log = self.repo / "tool-invocations.log"
        self.env = dict(
            os.environ,
            PATH=str(self.fake_bin) + ":" + os.environ["PATH"],
            DOCTOR_ACTION_LOG=str(self.log),
            APEX_BLOG_DEV_CONNECTION="secret-not-for-logs",
        )
        # The check only looks up executables, never invokes a SQL client or
        # Java/Node/Terraform, and never sources local connection overrides.
        for name in ("node", "npm", "java", "sql", "shellcheck", "terraform"):
            self.executable(self.fake_bin / name, 'echo invoked >> "$DOCTOR_ACTION_LOG"\n')
        for name in ("python", "pre-commit", "actionlint"):
            self.executable(self.repo / ".venv/bin" / name, "exit 71\n")
        subprocess.run(["git", "init", "-q", str(self.repo)], check=True, timeout=10)
        self.hook = self.repo / ".git/hooks/pre-commit"
        self.executable(self.hook, "exit 72\n")

    @staticmethod
    def executable(path, body):
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text("#!/usr/bin/env bash\n" + body, encoding="utf-8")
        path.chmod(0o755)

    def run_doctor(self, env=None):
        return subprocess.run(
            ["bash", "automation/ci/doctor.sh"],
            cwd=self.repo,
            env=env or self.env,
            capture_output=True,
            text=True,
            timeout=10,
        )

    def test_doctor_is_read_only_and_does_not_disclose_connection(self):
        (self.repo / "automation/variables.local.sh").write_text(
            f'echo executed > "{self.repo / "sourced-config"}"\n', encoding="utf-8"
        )
        result = self.run_doctor()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("no database access", result.stdout)
        self.assertIn("Local requirements present", result.stdout)
        self.assertNotIn("secret-not-for-logs", result.stdout + result.stderr)
        self.assertFalse((self.repo / "sourced-config").exists())
        self.assertFalse(self.log.exists())

    def test_missing_sqlcl_has_actionable_failure(self):
        result = self.run_doctor(dict(self.env, SQLCL_BIN="no-such-sqlcl-executable"))
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("install Oracle SQLcl or set SQLCL_BIN", result.stdout)
        self.assertIn("Doctor found", result.stderr)
        self.assertFalse(self.log.exists())

    def test_missing_hook_is_detected_without_installing_it(self):
        self.hook.unlink()
        result = self.run_doctor()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("run make setup-ci to install the Git hook", result.stdout)
        self.assertFalse(self.hook.exists())


if __name__ == "__main__":
    unittest.main()
