"""Mock-backed tests for the independent QA/UAT -> production hotfix path."""
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

SOURCE = Path(__file__).resolve().parents[2]


class HotfixTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='apex-blog-hotfix-test-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name) / 'repo'
        (self.root / 'automation/lib').mkdir(parents=True)
        shutil.copy2(SOURCE / 'Makefile', self.root / 'Makefile')
        for name in ('variables.sh', 'hotfix.sh'):
            shutil.copy2(SOURCE / 'automation' / name, self.root / 'automation' / name)
        shutil.copy2(SOURCE / 'automation/lib/common.sh', self.root / 'automation/lib/common.sh')
        self.mock = Path(self.temp.name) / 'mock_sqlcl.py'
        shutil.copy2(SOURCE / 'automation/tests/mock_sqlcl.py', self.mock)
        self.mock.chmod(0o755)
        self.calls_file = Path(self.temp.name) / 'calls.jsonl'
        self.env = dict(os.environ,
                        SQLCL_BIN=str(self.mock),
                        MOCK_SQLCL_LOG=str(self.calls_file),
                        APEX_BLOG_UAT_CONNECTION='QA_HOTFIX_TEST',
                        APEX_BLOG_PRD_CONNECTION='PRODUCTION_HOTFIX_TEST')

    def run_hotfix(self, action, *options, ok=True):
        result = subprocess.run(
            ['bash', str(self.root / 'automation/hotfix.sh'), action, *options],
            env=self.env, cwd=self.root, text=True, capture_output=True,
            timeout=30,
        )
        if ok:
            self.assertEqual(result.returncode, 0, result.stderr)
        else:
            self.assertNotEqual(result.returncode, 0, result.stderr)
        return result

    def calls(self):
        return [json.loads(line) for line in self.calls_file.read_text().splitlines()]


    def test_import_both_apps_without_preflight_execution(self):
        self.run_hotfix('export')
        self.run_hotfix('production')
        calls = self.calls()
        self.assertEqual(len(calls), 5)
        self.assertIn('APEX_BLOG_ENV_OK', calls[2]['sql'])
        imports = calls[3:]
        self.assertEqual([c['argv'][-1] for c in imports],
                         ['PRODUCTION_HOTFIX_TEST', 'PRODUCTION_HOTFIX_TEST'])
        for i, (call, app_id) in enumerate(zip(imports, (102, 101))):
            self.assertIn(f'apex_application_install.set_application_id({app_id})', call['sql'])
            self.assertIn('apex_application_install.set_workspace(', call['sql'])
            self.assertIn('apex_application_install.set_schema(', call['sql'])
            self.assertIn('set_auto_install_sup_obj(true)', call['sql'])
            self.assertIn(f'/f{app_id}.sql', call['sql'])
            self.assertNotIn('APEX_BLOG_ENV_OK', call['sql'])
            self.assertNotIn('apex export', call['sql'])
            self.assertNotIn('BUILD_API', call['sql'])

    def test_skip_supporting_objects_imports_both_applications(self):
        self.run_hotfix('export')
        self.run_hotfix('production', '--skip-supporting-objects')
        imports = self.calls()[3:]
        self.assertEqual(len(imports), 2)
        for call, app_id in zip(imports, (102, 101)):
            self.assertIn('set_auto_install_sup_obj(false)', call['sql'])
            self.assertNotIn('set_auto_install_sup_obj(true)', call['sql'])
            self.assertIn(f'set_application_id({app_id})', call['sql'])
        # The opt-out affects only import; exports always contain definitions.
        for call in self.calls()[:2]:
            self.assertIn('-expsupportingobjects Y', call['sql'])

    def test_hotfix_verifies_prod_target_before_import(self):
        self.run_hotfix('export')
        self.env['MOCK_WRONG_ENV'] = '1'
        result = self.run_hotfix('production', ok=False)
        self.assertIn('Cannot verify database environment', result.stderr)
        prod_calls = self.calls()[2:]
        self.assertEqual(len(prod_calls), 1)
        self.assertIn('APEX_BLOG_ENV_OK', prod_calls[0]['sql'])
        self.assertNotIn('set_application_id(', prod_calls[0]['sql'])

    def test_hotfix_rejects_shared_production_connection(self):
        self.run_hotfix('export')
        self.env['APEX_BLOG_PRD_CONNECTION'] = 'QA_HOTFIX_TEST'
        result = self.run_hotfix('production', ok=False)
        self.assertIn('distinct from DEV, TEST and QA/UAT', result.stderr)
        self.assertEqual(len(self.calls()), 2)


if __name__ == '__main__':
    unittest.main()
