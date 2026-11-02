"""Security contract for extracting SQL files from older release archives."""

from pathlib import Path
import stat
import subprocess
import sys
import tempfile
import unittest
from zipfile import ZipFile, ZipInfo

from automation.tests.workflow_fixture import SOURCE


class PreviousReleaseArchiveTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='apex-blog-prior-zip-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)

    def test_unsafe_previous_release_symlink_rejected(self):
        bad = self.root/'bad.zip'
        with ZipFile(bad, 'w') as z:
            info = ZipInfo('blog-administration-latest.sql')
            info.create_system = 3
            info.external_attr = (stat.S_IFLNK | 0o777) << 16
            z.writestr(info, '../../private')
            z.writestr('blog-public-pages-latest.sql', 'prompt old\n')
        out = self.root/'extract'
        cmd = [sys.executable, str(SOURCE/'automation/lib/extract_previous_release.py'),
               str(bad), str(out), 'blog-administration-latest.sql', 'blog-public-pages-latest.sql']
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=15)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Unsafe release entry', result.stderr)
        self.assertFalse(out.exists())
