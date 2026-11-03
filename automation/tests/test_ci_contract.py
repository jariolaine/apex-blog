"""The only CI-specific safety contract retained in this application repo.

Generic bootstrap, linters and GitHub Actions behavior is validated by running
those actual tools in `make check`, not by maintaining fake-tool unit tests.
"""
from pathlib import Path
import unittest

SOURCE = Path(__file__).resolve().parents[2]


class PublicCIContractTests(unittest.TestCase):
    def test_public_ci_cannot_deploy(self):
        workflow = (SOURCE / '.github/workflows/ci.yml').read_text(encoding='utf-8')
        self.assertRegex(workflow, r'(?m)^permissions:\s*\n\s+contents:\s*read\s*$')
        self.assertIn('pull_request:', workflow)
        self.assertIn('make ci', workflow)
        for deployment in (
            'make qa', 'make production', 'make hotfix-production',
            'import_apps_to_qa.sh', 'import_apps_to_pro.sh', 'hotfix.sh production',
        ):
            with self.subTest(deployment=deployment):
                self.assertNotIn(deployment, workflow)
