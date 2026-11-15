"""Offline smoke tests for the container's first-start dependency bootstrap."""

import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


SOURCE_ROOT = Path(__file__).resolve().parents[2]


class MCPDependencyBootstrapTests(unittest.TestCase):
    def setUp(self):
        self.temp_dir = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp_dir.cleanup)
        self.root = Path(self.temp_dir.name)
        (self.root / 'automation/mcp').mkdir(parents=True)
        (self.root / 'automation/ci').mkdir()
        (self.root / '.venv').mkdir()
        (self.root / 'node_modules').mkdir()
        shutil.copy2(SOURCE_ROOT / 'automation/mcp/ensure_dependencies.sh',
                     self.root / 'automation/mcp/ensure_dependencies.sh')
        for name in ('requirements.txt', 'install_actionlint.sh'):
            (self.root / 'automation/ci' / name).write_text('test dependency input\n')
        (self.root / 'package.json').write_text('{}\n')
        (self.root / 'package-lock.json').write_text('{}\n')
        bootstrap = self.root / 'automation/ci/bootstrap.sh'
        bootstrap.write_text('''#!/usr/bin/env bash
set -Eeuo pipefail
[[ "$1" == '--no-hooks' ]]
mkdir -p .venv/bin node_modules/.bin
for file in .venv/bin/python .venv/bin/pre-commit .venv/bin/actionlint node_modules/.bin/eslint; do
  printf '#!/bin/sh\\nexit 0\\n' > "$file"
  chmod +x "$file"
done
printf 'run\\n' >> bootstrap-runs.txt
''')
        self.env = dict(os.environ)
        path = self.root / 'bin'
        path.mkdir()
        node = path / 'node'
        node.write_text('#!/bin/sh\necho v24-test\n')
        node.chmod(0o755)
        self.env['PATH'] = f'{path}:{self.env.get("PATH", "")}'

    def run_bootstrap(self):
        return subprocess.run(
            ['bash', 'automation/mcp/ensure_dependencies.sh'], cwd=self.root,
            env=self.env, check=True, capture_output=True, text=True,
            timeout=10,
        )

    def test_first_run_then_cache_and_lockfile_refresh(self):
        first = self.run_bootstrap()
        self.assertIn('Initializing', first.stderr)
        self.run_bootstrap()
        self.assertEqual((self.root / 'bootstrap-runs.txt').read_text(), 'run\n')
        (self.root / 'package-lock.json').write_text('{"updated": true}\n')
        self.run_bootstrap()
        self.assertEqual((self.root / 'bootstrap-runs.txt').read_text(), 'run\nrun\n')
        (self.root / 'node_modules/.bin/eslint').unlink()
        self.run_bootstrap()
        self.assertEqual((self.root / 'bootstrap-runs.txt').read_text(), 'run\nrun\nrun\n')

    def test_compose_initializer_targets_existing_service(self):
        compose = (SOURCE_ROOT / 'automation/docker/docker-compose.yml').read_text()
        overlay = (SOURCE_ROOT / 'automation/docker/docker-compose.mcp.yml').read_text()
        dockerfile = SOURCE_ROOT / 'automation/docker/Dockerfile.automation'
        self.assertTrue(dockerfile.is_file())
        self.assertIn('dockerfile: automation/docker/Dockerfile.automation', compose)
        self.assertIn('  automation:', compose)
        self.assertIn('  automation:', overlay)
        self.assertNotIn('  automation-mcp:', overlay)
        self.assertIn('condition: service_completed_successfully', overlay)
        self.assertIn('automation-mcp-volume-init:', overlay)
        self.assertIn('automation_venv:/volumes/venv', overlay)
        self.assertIn('automation_node_modules:/volumes/node_modules', overlay)
        self.assertIn('automation_jobs:/volumes/jobs', overlay)
        initializer = overlay.split('  automation-mcp-volume-init:', 1)[1].split(
            '\n  automation:', 1,
        )[0]
        self.assertNotIn('/workspace', initializer)
        self.assertNotIn('/run/sqlcl-profile', initializer)
        self.assertIn('CMD ["bash", "automation/mcp/start.sh"]', dockerfile.read_text())

    def test_missing_volume_fails_with_actionable_diagnostic(self):
        shutil.rmtree(self.root / '.venv')
        result = subprocess.run(
            ['bash', 'automation/mcp/ensure_dependencies.sh'], cwd=self.root,
            env=self.env, capture_output=True, text=True, timeout=10,
        )
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('volume initializer', result.stderr)


if __name__ == '__main__':
    unittest.main()
