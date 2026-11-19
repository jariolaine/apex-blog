"""Offline, negative-path regressions for authoritative metadata SQL."""

import re
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path


SOURCE = Path(__file__).resolve().parents[2]
TOOL = SOURCE / "automation/lib/metadata_source.py"
PUBLIC = Path("applications/blog/supporting-objects/install-scripts/metadata.sql")
ADMIN = Path("applications/blog-admin/supporting-objects/install-scripts/metadata.sql")


class MetadataSourceTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="apex-blog-git-metadata-")
        self.addCleanup(self.temp.cleanup)
        self.repo = Path(self.temp.name) / "repo"
        self.repo.mkdir()
        shutil.copy2(SOURCE / "VERSION.txt", self.repo / "VERSION.txt")
        for name in (PUBLIC, ADMIN):
            (self.repo / name).parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(SOURCE / name, self.repo / name)
        self.out = Path(self.temp.name) / "output.sql"

    def call(self, action="check", ok=True):
        cmd = [sys.executable, str(TOOL), action, "--repo", str(self.repo)]
        if action == "render":
            cmd += ["--output", str(self.out)]
        proc = subprocess.run(cmd, capture_output=True, text=True, timeout=10)
        if ok:
            self.assertEqual(proc.returncode, 0, proc.stderr)
        else:
            self.assertNotEqual(proc.returncode, 0, proc.stdout)
        return proc

    def public(self):
        return self.repo / PUBLIC

    def admin(self):
        return self.repo / ADMIN


    def test_render_updates_only_version_without_touching_inputs(self):
        original_public = self.public().read_bytes()
        original_admin = self.admin().read_bytes()
        # The checked-in SQL may temporarily lag VERSION.txt during development.
        # Rendering must replace the version actually in the SQL source, without
        # modifying any other bytes or relying on the checkout being in sync.
        current = re.search(
            rb"(?m)^[ \t]*blog_install\.settings_merge\('G_APP_VERSION',"
            rb"[^\r\n]*,'(?P<version>Release [0-9.]+)'\);[ \t]*$",
            original_public,
        )
        self.assertIsNotNone(current, "Missing G_APP_VERSION statement in fixture")
        new_version = "Release 26.1.6.20261102"
        expected = (
            original_public[:current.start('version')]
            + new_version.encode()
            + original_public[current.end('version'):]
        )
        (self.repo / "VERSION.txt").write_text(new_version + "\n")
        self.call("check", ok=False)
        self.call("render")
        self.assertEqual(self.out.read_bytes(), expected)
        self.assertEqual(self.public().read_bytes(), original_public)
        self.assertEqual(self.admin().read_bytes(), original_admin)
        self.call("render")
        self.assertEqual(self.out.read_bytes(), expected)

    def test_rejects_duplicate_metadata_key(self):
        path = self.public()
        content = path.read_text()
        line = next(s for s in content.splitlines() if "'G_APP_VERSION'" in s)
        path.write_text(content.replace(line, line + "\n" + line))
        result = self.call("render", ok=False)
        self.assertIn("duplicate Public settings", result.stderr)
        self.assertFalse(self.out.exists())


    def test_rejects_invalid_version_and_does_not_write_output(self):
        (self.repo / "VERSION.txt").write_text("Release 26.1.6.20261102'; drop table blog_settings; --\n")
        result = self.call("render", ok=False)
        self.assertIn("VERSION.txt", result.stderr)
        self.assertFalse(self.out.exists())

    def test_rejects_missing_dynamic_public_application_id(self):
        path = self.public()
        path.write_text(path.read_text().replace(
            "blog_util.int_to_vc2(apex_application_install.get_application_id)", "401"
        ))
        result = self.call("render", ok=False)
        self.assertIn("G_PUB_APP_ID", result.stderr)
        self.assertFalse(self.out.exists())

    def test_rejects_missing_dynamic_admin_application_id(self):
        path = self.admin()
        path.write_text(path.read_text().replace(
            "blog_util.int_to_vc2(apex_application_install.get_application_id)", "402"
        ))
        result = self.call("render", ok=False)
        self.assertIn("G_ADMIN_APP_ID", result.stderr)
        self.assertFalse(self.out.exists())


if __name__ == "__main__":
    unittest.main()
