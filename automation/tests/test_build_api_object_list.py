"""Static regression checks for BUILD_API list export SQL.

These are not a substitute for compiling BUILD_API in Oracle or running an
installation/upgrade test. They catch accidental reintroduction of an
unguarded CONNECT BY or the root-only omission problem.
"""
from pathlib import Path
import re
import unittest

PACKAGE = Path(__file__).resolve().parents[1] / 'database' / 'BUILD_API.sql'


class BuildApiObjectListTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.sql = PACKAGE.read_text(encoding='utf-8')

    def test_both_lists_share_one_query(self):
        self.assertEqual(len(re.findall(r'\bconnect\s+by\s+nocycle\b', self.sql, re.I)), 1)
        self.assertIn('write_object_list(p_upgrade => 0)', self.sql)
        self.assertIn('write_object_list(p_upgrade => 1)', self.sql)

    def test_disconnected_cycles_cannot_hide_objects(self):
        self.assertRegex(self.sql, r'(?im)from\s+candidates\s+c\s+(?:--[^\n]*\n\s*)*left\s+join\s+hierarchy_depths\s+h')
        self.assertRegex(self.sql, r'(?is)nvl\s*\(\s*h\.dependency_depth\s*,\s*0\s*\)')

    def test_dependencies_match_object_type(self):
        self.assertIn('d.type = c.object_type', self.sql)
        self.assertIn('parent_obj.object_type = d.referenced_type', self.sql)
        self.assertIn('prior object_type = referenced_type', self.sql)


if __name__ == '__main__':
    unittest.main()
