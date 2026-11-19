"""Validate distinct Dev and MCP SQLcl profile mounts without Docker."""

from pathlib import Path
import os
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
DOCKER = ROOT / "automation/docker"
PREPARE = DOCKER / "prepare_dev_sqlcl_profile.py"


class SQLclProfileIsolationTests(unittest.TestCase):
    def test_compose_sources_are_distinct_and_read_only(self):
        dev = (DOCKER / "docker-compose.dev.yml").read_text()
        mcp = (DOCKER / "docker-compose.mcp.yml").read_text()
        self.assertIn("${APEX_BLOG_DEV_SQLCL_PROFILE_DIR:-./placeholders/empty-sqlcl-profile}", dev)
        self.assertTrue((DOCKER / "placeholders/empty-sqlcl-profile/.gitkeep").is_file())
        self.assertIn("${APEX_BLOG_MCP_SQLCL_PROFILE_DIR:?", mcp)
        self.assertNotIn("APEX_BLOG_MCP_SQLCL_PROFILE_DIR", dev)
        self.assertNotIn("APEX_BLOG_DEV_SQLCL_PROFILE_DIR", mcp)
        for compose in (dev, mcp):
            self.assertIn("target: /run/sqlcl-profile", compose)
            self.assertIn("read_only: true", compose)
            self.assertIn("create_host_path: false", compose)
        self.assertNotIn("/run/sqlcl-profile",
                         mcp.split("  setup:", 1)[1].split("\n  mcp:", 1)[0])

    def run_prepare(self, source: Path, home: Path):
        env = dict(os.environ, HOME=str(home))
        return subprocess.run([sys.executable, str(PREPARE), str(source)],
                              env=env, capture_output=True, text=True, timeout=10)

    def test_unconfigured_dev_profile_preserves_existing_home(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            source = root / "placeholder"
            source.mkdir()
            (source / ".gitkeep").touch()
            home = root / "home"
            (home / ".dbtools").mkdir(parents=True)
            (home / ".dbtools" / "my-connection.json").write_text("keep")
            result = self.run_prepare(source, home)
            self.assertEqual(0, result.returncode, result.stderr)
            self.assertEqual("keep", (home / ".dbtools/my-connection.json").read_text())

    def test_configured_dev_source_replaces_stale_profiles_privately(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            source = root / "profile"
            (source / "connections").mkdir(parents=True)
            (source / "connections" / "blog_dev.json").write_text("dev")
            home = root / "home"
            (home / ".dbtools").mkdir(parents=True)
            (home / ".dbtools" / "old-prod.json").write_text("old")
            result = self.run_prepare(source, home)
            self.assertEqual(0, result.returncode, result.stderr)
            self.assertFalse((home / ".dbtools/old-prod.json").exists())
            copied = home / ".dbtools/connections/blog_dev.json"
            self.assertEqual("dev", copied.read_text())
            self.assertEqual(0o600, copied.stat().st_mode & 0o777)
            self.assertEqual(0o700, (home / ".dbtools").stat().st_mode & 0o777)
            self.assertEqual("dev", (source / "connections/blog_dev.json").read_text())

    def test_symlinks_are_rejected_without_touching_home(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            source = root / "profile"
            source.mkdir()
            (source / "unsafe").symlink_to(root / "other")
            home = root / "home"
            (home / ".dbtools").mkdir(parents=True)
            (home / ".dbtools" / "safe").write_text("keep")
            result = self.run_prepare(source, home)
            self.assertNotEqual(0, result.returncode)
            self.assertEqual("keep", (home / ".dbtools/safe").read_text())


if __name__ == "__main__":
    unittest.main()
