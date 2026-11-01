"""No-database regression checks for the repository's quality entry points."""

import importlib.util
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


SOURCE = Path(__file__).resolve().parents[2]


class MakeLintTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix="apex-blog-make-lint-")
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        shutil.copy2(SOURCE / "Makefile", self.root / "Makefile")
        (self.root / "automation/ci").mkdir(parents=True)
        shutil.copy2(
            SOURCE / "automation/ci/run_pre_commit.sh",
            self.root / "automation/ci/run_pre_commit.sh",
        )
        (self.root / ".venv/bin").mkdir(parents=True)
        self.log = self.root / "precommit.log"
        self.env = dict(os.environ, PRECOMMIT_TEST_LOG=str(self.log))

    def install_fake_precommit(self, exit_code=0):
        runner = self.root / ".venv/bin/pre-commit"
        runner.write_text(
            "#!/usr/bin/env bash\n"
            'printf "%s\\n" "$*" >> "$PRECOMMIT_TEST_LOG"\n'
            f"exit {exit_code}\n",
            encoding="utf-8",
        )
        runner.chmod(0o755)

    def run_lint(self):
        return subprocess.run(
            ["make", "--no-print-directory", "lint"],
            cwd=self.root,
            env=self.env,
            text=True,
            capture_output=True,
            timeout=15,
        )

    def test_make_lint_runs_precommit_run_all_files(self):
        """Regression for missing `run` before `--all-files`."""
        self.install_fake_precommit()
        result = self.run_lint()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.log.read_text().splitlines(), ["run --all-files"])

    def test_make_lint_propagates_precommit_failure(self):
        self.install_fake_precommit(exit_code=3)
        result = self.run_lint()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.log.read_text().splitlines(), ["run --all-files"])

    def test_make_lint_without_setup_explains_next_step(self):
        result = self.run_lint()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("make setup-ci", result.stderr)


class CIContractTests(unittest.TestCase):
    def test_git_hooks_and_ci_share_repository_lint_command(self):
        workflow = (SOURCE / ".github/workflows/ci.yml").read_text()
        self.assertIn("make ci", workflow)
        self.assertIn("push:", workflow)
        self.assertIn("pull_request:", workflow)
        self.assertNotIn("make qa", workflow)
        self.assertNotIn("make production", workflow)
        hook_config = (SOURCE / ".pre-commit-config.yaml").read_text()
        self.assertIn("id: fast-tests", hook_config)
        self.assertIn("always_run: true", hook_config)

    def test_direct_dev_and_qa_commands_have_required_gate(self):
        for script in ("automation/import_apps_to_dev.sh", "automation/deploy.sh"):
            content = (SOURCE / script).read_text()
            self.assertIn('"$SCRIPT_DIR/ci/preflight.sh"', content, script)
        hotfix = (SOURCE / "automation/hotfix.sh").read_text()
        self.assertNotIn("ci/preflight.sh", hotfix)

    def test_no_fixed_node_engine_constraint(self):
        package = json.loads((SOURCE / "package.json").read_text())
        self.assertNotIn("engines", package)
        self.assertIn("eslint", package["devDependencies"])
        self.assertTrue((SOURCE / "automation/ci/README.md").is_file())


class SqlHygieneTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        spec = importlib.util.spec_from_file_location(
            "repo_check_sql", SOURCE / "automation/ci/check_sql.py"
        )
        cls.sqlcheck = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(cls.sqlcheck)

    def check_text(self, data):
        with tempfile.TemporaryDirectory(prefix="sql-hygiene-") as dirname:
            path = Path(dirname) / "sample.sql"
            path.write_bytes(data)
            return self.sqlcheck.check(path)

    def test_preserves_literal_spaces_and_blank_lines(self):
        self.assertEqual(self.check_text(b"select 'a  b' from dual;\n\n"), [])

    def test_reports_missing_final_newline(self):
        self.assertTrue(any("final newline" in msg for msg in self.check_text(b"select 1 from dual;")))

    def test_reports_merge_conflicts(self):
        errors = self.check_text(b"<<<<<<< ours\nselect 1 from dual;\n=======\n>>>>>>> theirs\n")
        self.assertTrue(any("merge conflict" in msg for msg in errors))

    def test_reports_nul_bytes(self):
        self.assertTrue(any("NUL byte" in msg for msg in self.check_text(b"select \x00 from dual;\n")))

    def test_reports_invalid_utf8(self):
        self.assertTrue(any("not UTF-8" in msg for msg in self.check_text(b"\xff\n")))


if __name__ == "__main__":
    unittest.main()
