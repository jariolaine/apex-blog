"""Offline tests for version-flexible quality setup (no npm/PyPI access)."""
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

SOURCE = Path(__file__).resolve().parents[2]


class CiBootstrapTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="apex-blog-bootstrap-")
        self.addCleanup(self.temp.cleanup)
        self.repo = Path(self.temp.name) / "repo"
        (self.repo / "automation/ci").mkdir(parents=True)
        for filename in ("bootstrap.sh", "run_pre_commit.sh", "install_actionlint.sh", "check_actionlint.sh"):
            shutil.copy2(
                SOURCE / "automation/ci" / filename,
                self.repo / "automation/ci" / filename,
            )
        self.fake_bin = self.repo / "fake-bin"
        self.fake_bin.mkdir()
        self.log = self.repo / "calls.log"
        self.env = dict(
            os.environ,
            PATH=str(self.fake_bin) + ":" + os.environ["PATH"],
            TOOL_LOG=str(self.log),
        )
        self.env.pop("CI", None)

        # Simulate newer Node/Python; neither version should be rejected.
        py = self.fake_bin / "python3"
        py.write_text(r"""#!/usr/bin/env bash
[[ "$1" == "-m" && "$2" == "venv" && "$3" == ".venv" ]] || exit 87
mkdir -p .venv/bin
cat > .venv/bin/python <<'SH'
#!/usr/bin/env bash
if [[ "$1" == "--version" ]]; then echo 'Python 3.13.0'; exit 0; fi
printf 'pip %s\n' "$*" >> "$TOOL_LOG"
SH
cat > .venv/bin/pre-commit <<'SH'
#!/usr/bin/env bash
printf 'precommit %s\n' "$*" >> "$TOOL_LOG"
SH
cat > .venv/bin/actionlint <<'SH'
#!/usr/bin/env bash
printf 'actionlint %s\n' "$*" >> "$TOOL_LOG"
SH
chmod +x .venv/bin/python .venv/bin/pre-commit .venv/bin/actionlint
""", encoding="utf-8")
        npm = self.fake_bin / "npm"
        npm.write_text('#!/usr/bin/env bash\nprintf "npm %s\\n" "$*" >> "$TOOL_LOG"\n')
        node = self.fake_bin / "node"
        node.write_text('#!/usr/bin/env bash\necho v25.9.0\n')
        git = self.fake_bin / "git"
        git.write_text('#!/usr/bin/env bash\nexit 0\n')
        for executable in (py, npm, node, git):
            executable.chmod(0o755)

    def run_bash(self, script, *args, ok=True):
        result = subprocess.run(
            ["bash", f"automation/ci/{script}", *args],
            cwd=self.repo,
            env=self.env,
            capture_output=True,
            text=True,
            timeout=20,
        )
        if ok:
            self.assertEqual(result.returncode, 0, result.stderr)
        else:
            self.assertNotEqual(result.returncode, 0, result.stdout)
        return result

    def test_newer_node_and_python_local_setup(self):
        result = self.run_bash("bootstrap.sh")
        self.assertIn("Node v25.9.0", result.stderr)
        self.assertIn("Python 3.13.0", result.stderr)
        log = self.log.read_text()
        self.assertIn("npm install --ignore-scripts --no-audit --no-fund", log)
        self.assertIn("precommit install", log)
        self.run_bash("run_pre_commit.sh", "run", "--all-files")
        self.run_bash("check_actionlint.sh", "-color")
        self.assertIn("precommit run --all-files", self.log.read_text())
        self.assertIn("actionlint -color", self.log.read_text())

    def test_ci_uses_lockfile_without_installing_hook(self):
        (self.repo / "package-lock.json").write_text('{"lockfileVersion":3}\n')
        self.env["CI"] = "true"
        self.run_bash("bootstrap.sh", "--no-hooks")
        self.assertIn("npm ci --ignore-scripts --no-audit --no-fund", self.log.read_text())
        self.assertNotIn("precommit install", self.log.read_text())

    def test_ci_without_lockfile_uses_npm_install(self):
        self.env["CI"] = "true"
        result = self.run_bash("bootstrap.sh", "--no-hooks")
        self.assertIn("npm install --ignore-scripts --no-audit --no-fund", self.log.read_text())
        self.assertIn("No package-lock.json", result.stderr)

    def test_local_setup_updates_existing_lockfile(self):
        (self.repo / "package-lock.json").write_text('{"lockfileVersion":3}\n')
        self.run_bash("bootstrap.sh")
        self.assertIn("npm install", self.log.read_text())
        self.assertNotIn("npm ci", self.log.read_text())

    def test_missing_bootstrap_is_actionable(self):
        result = self.run_bash("run_pre_commit.sh", "run", "--all-files", ok=False)
        self.assertIn("make setup-ci", result.stderr)

    def test_unexpected_options_rejected(self):
        result = self.run_bash("bootstrap.sh", "--unsafe", ok=False)
        self.assertIn("Usage:", result.stderr)


if __name__ == "__main__":
    unittest.main()
