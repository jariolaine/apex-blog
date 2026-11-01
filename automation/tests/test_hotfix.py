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

    def run_hotfix(self, action, ok=True):
        result = subprocess.run(
            ['bash', str(self.root / 'automation/hotfix.sh'), action],
            env=self.env, cwd=self.root, text=True, capture_output=True,
        )
        if ok:
            self.assertEqual(result.returncode, 0, result.stderr)
        else:
            self.assertNotEqual(result.returncode, 0, result.stderr)
        return result

    def calls(self):
        return [json.loads(line) for line in self.calls_file.read_text().splitlines()]

    def test_export_both_apps_without_dev_or_release_pipeline(self):
        self.run_hotfix('export')
        self.assertTrue((self.root / 'build/hotfix/f102.sql').is_file())
        self.assertTrue((self.root / 'build/hotfix/f101.sql').is_file())
        calls = self.calls()
        self.assertEqual(len(calls), 2)
        self.assertTrue(all(c['argv'][-1] == 'QA_HOTFIX_TEST' for c in calls))
        self.assertIn('-applicationid 102 -exptype SQL', calls[0]['sql'])
        self.assertIn('-applicationid 101 -exptype SQL', calls[1]['sql'])
        for call in calls:
            self.assertIn('-expsupportingobjects Y', call['sql'])
            self.assertNotIn('APEXLANG', call['sql'])
            self.assertNotIn('apex validate', call['sql'])
            self.assertNotIn('BUILD_API', call['sql'])

    def test_import_both_apps_without_preflight_execution(self):
        self.run_hotfix('export')
        self.run_hotfix('production')
        calls = self.calls()
        self.assertEqual(len(calls), 4)
        imports = calls[2:]
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

    def test_import_uses_production_application_ids(self):
        self.run_hotfix('export')
        (self.root / 'automation/variables.local.sh').write_text(
            'prdAppIds=(202 201)\n', encoding='utf-8'
        )
        self.run_hotfix('production')
        calls = self.calls()[2:]
        self.assertIn('set_application_id(202)', calls[0]['sql'])
        self.assertIn('f102.sql', calls[0]['sql'])
        self.assertIn('set_application_id(201)', calls[1]['sql'])
        self.assertIn('f101.sql', calls[1]['sql'])

    def test_missing_exports_do_not_start_production_import(self):
        self.run_hotfix('production', ok=False)
        self.assertFalse(self.calls_file.exists())


if __name__ == '__main__':
    unittest.main()
