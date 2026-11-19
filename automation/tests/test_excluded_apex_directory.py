"""Guard the exclusion of locally downloaded Oracle APEX from quality gates."""

import importlib.util
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import tomllib
import unittest


ROOT = Path(__file__).resolve().parents[2]
EXCLUDED = 'automation/docker/apex'


class LocalApexExclusionTests(unittest.TestCase):
    def test_all_file_scanning_configs_ignore_local_apex(self):
        precommit = (ROOT / '.pre-commit-config.yaml').read_text(encoding='utf-8')
        self.assertIn(f'exclude: ^{EXCLUDED}/', precommit)

        markdown = json.loads((ROOT / '.markdownlint-cli2.jsonc').read_text())
        self.assertIn(f'{EXCLUDED}/**', markdown['ignores'])

        pyproject = tomllib.loads((ROOT / 'pyproject.toml').read_text())
        self.assertIn(EXCLUDED, pyproject['tool']['ruff']['extend-exclude'])
        self.assertIn(f'--ignore={EXCLUDED}',
                      pyproject['tool']['pytest']['ini_options']['addopts'])

        # The dedicated JavaScript, SQL and asset checks deliberately target
        # frontend/, applications/ and Database/ rather than all automation/.
        shell = (ROOT / 'automation/ci/check_shell.sh').read_text()
        self.assertIn(f"-path '{EXCLUDED}' -prune", shell)

    def test_shell_check_prunes_local_apex_before_syntax_and_shellcheck(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            ci = root / 'automation/ci'
            ci.mkdir(parents=True)
            shutil.copy2(ROOT / 'automation/ci/check_shell.sh', ci / 'check_shell.sh')
            (ci / 'valid.sh').write_text('#!/bin/bash\ntrue\n')
            apex = root / EXCLUDED
            apex.mkdir(parents=True)
            (apex / 'broken.sh').write_text('#!/bin/bash\nif then\n')

            tools = root / 'bin'
            tools.mkdir()
            fake = tools / 'shellcheck'
            fake.write_text('#!/bin/sh\nprintf "%s\\n" "$@" > "$CAPTURE"\n')
            fake.chmod(0o755)
            capture = root / 'shellcheck-files.txt'
            env = dict(os.environ, PATH=f"{tools}:{os.environ.get('PATH', '')}",
                       CAPTURE=str(capture))
            result = subprocess.run(['bash', str(ci / 'check_shell.sh')],
                                    cwd=root, env=env, text=True,
                                    capture_output=True, timeout=10)
            self.assertEqual(0, result.returncode, result.stderr)
            checked = capture.read_text()
            self.assertIn('automation/ci/valid.sh', checked)
            self.assertNotIn('automation/docker/apex', checked)

    @unittest.skipUnless(importlib.util.find_spec('pytest') is not None,
                         'pytest not installed')
    def test_pytest_discovery_does_not_collect_apex_tests(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            shutil.copy2(ROOT / 'pyproject.toml', root / 'pyproject.toml')
            tests = root / 'tests'
            tests.mkdir()
            (tests / 'test_visible.py').write_text('def test_visible(): pass\n')
            apex = root / EXCLUDED
            apex.mkdir(parents=True)
            (apex / 'test_hidden.py').write_text('def test_hidden(): assert False\n')
            result = subprocess.run([sys.executable, '-m', 'pytest',
                                     '--collect-only', '-q'], cwd=root,
                                    capture_output=True, text=True, timeout=30)
            self.assertEqual(0, result.returncode, result.stdout + result.stderr)
            self.assertIn('test_visible', result.stdout)
            self.assertNotIn('test_hidden', result.stdout)


if __name__ == '__main__':
    unittest.main()
