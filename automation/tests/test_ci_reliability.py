"""Offline regression checks for CI hardening and Git executable permissions."""

import os
from pathlib import Path
import re
import shutil
import stat
import subprocess
import tempfile
import unittest

SOURCE = Path(__file__).resolve().parents[2]
WORKFLOW = SOURCE / ".github/workflows/ci.yml"


class CiReliabilityTests(unittest.TestCase):
    def test_ci_permissions_caching_and_superseded_runs(self):
        workflow = WORKFLOW.read_text(encoding="utf-8")
        self.assertRegex(workflow, r"(?m)^permissions:\n  contents: read$")
        self.assertIn("cancel-in-progress: true", workflow)
        self.assertIn("github.event.pull_request.number || github.ref", workflow)
        self.assertRegex(workflow, r"(?m)^\s*cache: npm$")
        self.assertRegex(workflow, r"(?m)^\s*cache: pip$")
        self.assertIn("cache-dependency-path: package-lock.json", workflow)
        self.assertIn("cache-dependency-path: automation/ci/requirements.txt", workflow)
        self.assertIn("make ci", workflow)
        self.assertNotIn("make production", workflow)
        self.assertNotIn("make hotfix-production", workflow)

    def test_actionlint_runs_before_ci_and_uploads_failed_logs(self):
        workflow = WORKFLOW.read_text(encoding="utf-8")
        self.assertLess(
            workflow.index("bash automation/ci/check_actionlint.sh"),
            workflow.index("make ci 2>&1"),
        )
        self.assertIn("set -o pipefail", workflow)
        self.assertIn("actions/upload-artifact@v4", workflow)
        self.assertIn("if: failure()", workflow)
        self.assertIn("quality.log", workflow)
        self.assertIn("terraform.log", workflow)
        # `set -e` is not reliable inside the piped Terraform group by itself.
        self.assertIn("init -backend=false -input=false &&", workflow)
        hooks = (SOURCE / ".pre-commit-config.yaml").read_text(encoding="utf-8")
        self.assertRegex(hooks, r"(?m)^\s*- id: actionlint$")
        self.assertIn("automation/ci/check_actionlint.sh", hooks)
        self.assertIn("automation/ci/install_actionlint.sh", (SOURCE / "automation/ci/bootstrap.sh").read_text())

    def test_executable_make_entrypoints(self):
        makefile = (SOURCE / "Makefile").read_text(encoding="utf-8")
        # Check the entry points actually executed by Make, not every file in automation/.
        called = set(re.findall(r"\./\$\(SCRIPTS\)/([a-zA-Z0-9_]+\.sh)", makefile))
        self.assertIn("export_application.sh", called)
        self.assertIn("hotfix.sh", called)
        for name in sorted(called):
            path = SOURCE / "automation" / name
            with self.subTest(path=path):
                self.assertTrue(path.is_file())
                self.assertTrue(
                    path.stat().st_mode & stat.S_IXUSR,
                    f"{path} is not executable; use chmod +x and commit Git mode 100755",
                )

    def test_actionlint_wrapper_fails_closed_without_setup(self):
        with tempfile.TemporaryDirectory(prefix="apex-blog-actionlint-test-") as temp:
            root = Path(temp)
            script = root / "automation/ci/check_actionlint.sh"
            script.parent.mkdir(parents=True)
            shutil.copy2(SOURCE / "automation/ci/check_actionlint.sh", script)
            missing = subprocess.run(
                ["bash", str(script)], cwd=root, capture_output=True, text=True,
                timeout=10,
            )
            self.assertNotEqual(missing.returncode, 0)
            self.assertIn("make setup-ci", missing.stderr)

            executable = root / ".venv/bin/actionlint"
            executable.parent.mkdir(parents=True)
            executable.write_text("#!/usr/bin/env bash\nprintf '%s\\n' \"$*\"\n", encoding="utf-8")
            executable.chmod(0o755)
            result = subprocess.run(
                ["bash", str(script), "-color"], cwd=root,
                capture_output=True, text=True, timeout=10,
            )
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(result.stdout.strip(), "-color")

    def test_installer_rejects_corrupted_archive(self):
        # No network access: fake curl downloads an invalid archive. It must
        # fail SHA verification before creating an executable.
        with tempfile.TemporaryDirectory(prefix="apex-blog-actionlint-bad-") as temp:
            root = Path(temp)
            script = root / "automation/ci/install_actionlint.sh"
            script.parent.mkdir(parents=True)
            shutil.copy2(SOURCE / "automation/ci/install_actionlint.sh", script)
            fake_bin = root / "bin"
            fake_bin.mkdir()
            fake_curl = fake_bin / "curl"
            fake_curl.write_text('''#!/usr/bin/env bash
while (( $# )); do
  if [[ "$1" == '--output' ]]; then
    printf 'untrusted archive' > "$2"
    exit 0
  fi
  shift
done
exit 99
''', encoding="utf-8")
            fake_curl.chmod(0o755)
            env = dict(os.environ, PATH=f"{fake_bin}:{os.environ['PATH']}")
            result = subprocess.run(
                ["bash", str(script)], cwd=root, env=env,
                capture_output=True, text=True, timeout=15,
            )
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("SHA-256 mismatch", result.stderr)
            self.assertFalse((root / ".venv/bin/actionlint").exists())


if __name__ == "__main__":
    unittest.main()
