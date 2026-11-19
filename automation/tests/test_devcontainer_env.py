"""Validate host-side .env loading for the single Dev Container."""

import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]


class DevContainerEnvTests(unittest.TestCase):
    def test_default_config_initializes_compose_from_root_env(self):
        script = ROOT / 'automation/docker/ensure_compose_env.sh'
        self.assertTrue(script.is_file())
        config = json.loads((ROOT / '.devcontainer/devcontainer.json').read_text())
        self.assertEqual(
            ['bash', '${localWorkspaceFolder}/automation/docker/ensure_compose_env.sh'],
            config['initializeCommand'])
        self.assertEqual('dev', config['service'])
        self.assertFalse((ROOT / '.devcontainer/with-external').exists())
        self.assertFalse((ROOT / '.devcontainer/with-external-build-ca').exists())

    def test_host_init_is_idempotent_and_does_not_overwrite_user_files(self):
        script = ROOT / 'automation/docker/ensure_compose_env.sh'
        with tempfile.TemporaryDirectory() as td:
            folder = Path(td)
            docker_dir = folder / 'automation/docker'
            docker_dir.mkdir(parents=True)
            runner = docker_dir / 'ensure_compose_env.sh'
            shutil.copyfile(script, runner)
            link = docker_dir / '.env'

            def invoke():
                return subprocess.run(['bash', str(runner)], capture_output=True,
                                      text=True, timeout=10)

            # A developer who needs no wallet/CA can open the default
            # container without first creating a repository-root .env.
            missing = invoke()
            self.assertEqual(0, missing.returncode, missing.stderr)
            self.assertFalse(link.exists())

            root_env = folder / '.env'
            root_env.write_text('APEX_BLOG_EXTERNAL_DIR=/my/host/wallets\n')
            created = invoke()
            self.assertEqual(0, created.returncode, created.stderr)
            self.assertTrue(link.is_symlink())
            self.assertEqual('../../.env', os.readlink(link))
            self.assertEqual(root_env.read_text(), link.read_text())
            self.assertEqual(0, invoke().returncode)

            link.unlink()
            link.write_text('unrelated settings\n')
            conflicting = invoke()
            self.assertNotEqual(0, conflicting.returncode)
            self.assertIn('refusing to overwrite', conflicting.stderr)
            self.assertEqual('unrelated settings\n', link.read_text())


if __name__ == '__main__':
    unittest.main()
