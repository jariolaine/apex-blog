"""Validate local automation documentation links without Docker or network."""

from pathlib import Path
import re
import unittest
from urllib.parse import unquote, urlsplit


ROOT = Path(__file__).resolve().parents[2]
DOCS = (ROOT / 'automation/README.md', *sorted((ROOT / 'automation/docs').glob('*.md')))
LINK = re.compile(r'(?<!!)\[[^\]\n]+\]\(([^)\n]+)\)')
HEADING = re.compile(r'^#{1,6}\s+(.+?)\s*#*$', re.MULTILINE)


def markdown_anchors(path: Path) -> set[str]:
    """Collect standard GitHub-style heading anchors (with duplicate suffixes)."""
    anchors = set()
    counts = {}
    for match in HEADING.finditer(path.read_text(encoding='utf-8')):
        title = re.sub(r'<[^>]*>', '', match.group(1)).lower()
        title = re.sub(r'[^\w\s-]', '', title, flags=re.UNICODE)
        slug = re.sub(r'\s+', '-', title.strip())
        if not slug:
            continue
        count = counts.get(slug, 0)
        counts[slug] = count + 1
        anchors.add(slug if count == 0 else f'{slug}-{count}')
    return anchors


class DocumentationLinksTests(unittest.TestCase):
    def test_automation_markdown_links_exist(self):
        for doc in DOCS:
            with self.subTest(document=str(doc.relative_to(ROOT))):
                self.assertTrue(doc.is_file())
                for raw in LINK.findall(doc.read_text(encoding='utf-8')):
                    target = raw.strip().split(' "', 1)[0]
                    if target.startswith(('#', 'mailto:')) or '://' in target:
                        continue
                    parts = urlsplit(target)
                    if parts.scheme or not parts.path:
                        continue
                    resolved = (doc.parent / unquote(parts.path)).resolve()
                    self.assertTrue(resolved.is_file(),
                                    f'{doc.relative_to(ROOT)}: broken link {raw}')
                    if resolved.is_file() and parts.fragment and resolved.suffix == '.md':
                        self.assertIn(unquote(parts.fragment), markdown_anchors(resolved),
                                      f'{doc.relative_to(ROOT)}: broken anchor {raw}')

    def test_maintainer_commands_have_actual_entrypoints(self):
        self.assertTrue((ROOT / 'automation/tests').is_dir())
        self.assertTrue((ROOT / 'automation/mcp/tests').is_dir())
        self.assertTrue((ROOT / 'automation/docker/docker-compose.dev.yml').is_file())
        self.assertTrue((ROOT / 'automation/docker/docker-compose.mcp.yml').is_file())
        self.assertTrue((ROOT / 'automation/ci/bootstrap.sh').is_file())


if __name__ == '__main__':
    unittest.main()
