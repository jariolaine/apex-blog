"""Unit tests for the locally-maintained APEXlang content parity check."""

from pathlib import Path
import subprocess
import sys
import tempfile
import unittest


CHECKER = Path(__file__).resolve().parents[1] / 'lib/check_preserved_parity.py'


class ProtectedParityTests(unittest.TestCase):
    def setUp(self):
        self.td = tempfile.TemporaryDirectory(prefix='apex-parity-')
        self.addCleanup(self.td.cleanup)
        self.root = Path(self.td.name)
        self.local = self.root / 'local'
        self.dev = self.root / 'dev'
        for parent in (self.local, self.dev):
            (parent / 'supporting-objects').mkdir(parents=True)
            (parent / 'shared-components/static-files/icons').mkdir(parents=True)
            (parent / 'supporting-objects/install.sql').write_bytes(b'prompt test\n')
            (parent / 'shared-components/static-files/icons/logo.png').write_bytes(b'\x89PNG\r\n')

    def check(self):
        return subprocess.run(
            [sys.executable, str(CHECKER), str(self.local), str(self.dev)],
            capture_output=True, text=True,
        )


    def test_binary_static_changes_are_rejected(self):
        (self.dev / 'shared-components/static-files/icons/logo.png').write_bytes(b'\x89PNG\r\nDIFFERENT')
        result = self.check()
        self.assertEqual(result.returncode, 1)
        self.assertIn('Static application files', result.stderr)
        self.assertIn('logo.png (content differs)', result.stderr)


    def test_supporting_sql_drift_is_still_detected(self):
        (self.local/'supporting-objects/install.sql').write_text('prompt modified\n')
        result = self.check()
        self.assertEqual(result.returncode, 1)
        self.assertIn('Supporting Objects SQL', result.stderr)

    def test_symlinks_are_rejected(self):
        (self.local/'shared-components/static-files/icons/shortcut').symlink_to('logo.png')
        result = self.check()
        self.assertEqual(result.returncode, 2)
        self.assertIn('Symlink is not permitted', result.stderr)


if __name__ == '__main__':
    unittest.main()
