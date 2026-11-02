"""Preflight sequencing tests with a fake Make program; no SQLcl needed."""
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

SOURCE = Path(__file__).resolve().parents[2]


class CIGateTests(unittest.TestCase):
    def setUp(self):
        self.td = tempfile.TemporaryDirectory(prefix="apex-blog-preflight-")
        self.addCleanup(self.td.cleanup)
        self.root = Path(self.td.name)
        (self.root / "automation/ci").mkdir(parents=True)
        shutil.copy2(SOURCE / "automation/ci/preflight.sh",
                     self.root / "automation/ci/preflight.sh")
        (self.root / "bin").mkdir()
        mock_make = self.root / "bin/make"
        mock_make.write_text(
            '#!/usr/bin/env bash\n'
            'printf "%s\\n" "$*" >> "$MOCK_MAKE_LOG"\n'
            '[[ "$*" != *"${MOCK_FAIL_STAGE:-__never__}"* ]]\n',
            encoding="utf-8",
        )
        mock_make.chmod(0o755)
        self.log = self.root / "make-calls.txt"
        self.env = dict(os.environ, PATH=str(self.root / "bin") + ":" + os.environ["PATH"],
                        MOCK_MAKE_LOG=str(self.log))

    def run_gate(self):
        return subprocess.run(
            ["bash", str(self.root / "automation/ci/preflight.sh")],
            cwd=self.root, env=self.env, capture_output=True, text=True,
        )

    def test_runs_static_checks_full_tests_once_and_apexlang_validation(self):
        result = self.run_gate()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.log.read_text().splitlines(), [
            "--no-print-directory lint", "--no-print-directory check-schema",
            "--no-print-directory check-source", "--no-print-directory test",
            "--no-print-directory validate",
        ])

    def test_failed_lint_stops_before_tests_or_validation(self):
        self.env["MOCK_FAIL_STAGE"] = "lint"
        result = self.run_gate()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.log.read_text().splitlines(), ["--no-print-directory lint"])

    def test_failed_schema_check_stops_before_source_tests_or_validation(self):
        self.env["MOCK_FAIL_STAGE"] = "check-schema"
        result = self.run_gate()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.log.read_text().splitlines(), [
            "--no-print-directory lint", "--no-print-directory check-schema",
        ])

    def test_failed_source_check_stops_before_tests_or_validation(self):
        self.env["MOCK_FAIL_STAGE"] = "check-source"
        result = self.run_gate()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.log.read_text().splitlines(), [
            "--no-print-directory lint", "--no-print-directory check-schema",
            "--no-print-directory check-source",
        ])

    def test_failed_tests_stop_before_apexlang_validation(self):
        self.env["MOCK_FAIL_STAGE"] = "test"
        result = self.run_gate()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.log.read_text().splitlines(), [
            "--no-print-directory lint", "--no-print-directory check-schema",
            "--no-print-directory check-source", "--no-print-directory test",
        ])


if __name__ == "__main__":
    unittest.main()
