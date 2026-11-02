"""Offline regression checks for Git-owned schema inventories and SQL assembly.

Does not prove compilation or installation in Oracle; use make test-install and
make test-upgrade against the disposable TEST schema for that.
"""
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
ASSEMBLER = ROOT / 'automation/lib/assemble_objects.py'
SCHEMA = ROOT / 'automation/schema'
DATABASE = ROOT / 'Database'


class RepositorySchemaTests(unittest.TestCase):
    def assemble(self, manifest: str, *args: str) -> subprocess.CompletedProcess:
        return subprocess.run(
            [sys.executable, str(ASSEMBLER), str(SCHEMA / manifest),
             str(DATABASE), *map(str, args)],
            text=True, capture_output=True,
        )

    def test_manifests_validate_offline(self):
        install = self.assemble('install.list', '--check-only', '--check-inventory')
        upgrade = self.assemble('upgrade.list', '--check-only')
        self.assertEqual(install.returncode, 0, install.stderr)
        self.assertEqual(upgrade.returncode, 0, upgrade.stderr)

    def test_install_uses_exact_repository_sql_once_in_manifest_order(self):
        with tempfile.TemporaryDirectory() as directory:
            dest = Path(directory) / 'install.sql'
            result = self.assemble('install.list', str(dest), '--check-inventory')
            self.assertEqual(result.returncode, 0, result.stderr)
            entries = (SCHEMA / 'install.list').read_text().splitlines()
            expected = ''.join(
                (content if content.endswith('\n') else content + '\n')
                for path in entries if path and not path.startswith(('#', '--'))
                for content in [(DATABASE / path).read_text(encoding='utf-8-sig')]
            )
            sql = dest.read_text(encoding='utf-8')
            self.assertEqual(sql, expected)
            fks = (DATABASE / 'Tables/foreign_keys.sql').read_text()
            indexes = (DATABASE / 'Indexes/foreign_key_indexes.sql').read_text()
            self.assertEqual(sql.count(fks), 1)
            self.assertEqual(sql.count(indexes), 1)
            self.assertLess(sql.index(fks), sql.index(indexes))
            self.assertLess(sql.index('create or replace package "BLOG_ADMIN"'),
                            sql.index('create or replace package body "BLOG_ADMIN"'))

    def test_upgrade_contains_both_package_parts_but_not_install_only_files(self):
        with tempfile.TemporaryDirectory() as directory:
            dest = Path(directory) / 'upgrade.sql'
            result = self.assemble('upgrade.list', str(dest))
            self.assertEqual(result.returncode, 0, result.stderr)
            sql = dest.read_text()
            self.assertEqual(sql.count('create or replace package "BLOG_ADMIN"'), 1)
            self.assertEqual(sql.count('create or replace package body "BLOG_ADMIN"'), 1)
            self.assertIn('create or replace force view blog_v_version', sql)
            self.assertNotIn('alter table blog_comments add constraint blog_comments_fk1', sql)
            self.assertNotIn('create index blog_comments_ix1 on blog_comments', sql)

    def test_build_api_retired_and_git_sources_are_authoritative(self):
        helper = (ROOT / 'automation/supporting_objects.sh').read_text()
        self.assertFalse((ROOT / 'automation/database').exists())
        self.assertFalse((ROOT / 'automation/setup_build_api.sh').exists())
        self.assertNotIn('run_sqlcl', helper)
        self.assertNotIn('check_environment', helper)
        self.assertIn('lib/metadata_source.py', helper)
        self.assertIn('schema/install.list', helper)
        self.assertIn('schema/upgrade.list', helper)
        self.assertIn('lib/check_deinstall.py', helper)
        self.assertIn('lib/metadata_source.py', (ROOT / 'Makefile').read_text())
        self.assertNotIn('setup-build-api', (ROOT / 'Makefile').read_text())


class DeinstallSourceTests(unittest.TestCase):
    """Deinstall SQL stays in Git; the checker must reject inventory drift."""

    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='apex-blog-deinstall-source-')
        self.addCleanup(self.temp.cleanup)
        self.script = Path(self.temp.name) / 'deinstall-script.sql'
        self.script.write_bytes(
            (ROOT / 'applications/blog-admin/supporting-objects/deinstall-script.sql').read_bytes()
        )

    def validate(self) -> subprocess.CompletedProcess:
        return subprocess.run(
            [sys.executable, str(ROOT / 'automation/lib/check_deinstall.py'),
             str(SCHEMA / 'install.list'), str(DATABASE), str(self.script)],
            text=True, capture_output=True,
        )

    def replace(self, before: str, after: str = '') -> None:
        original = self.script.read_text()
        self.assertIn(before, original)
        self.script.write_text(original.replace(before, after))

    def test_checked_in_deinstall_matches_manifest_and_fk_sources(self):
        result = self.validate()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('deinstall SQL matches', result.stdout)

    def test_new_manifest_table_requires_an_explicit_drop(self):
        database = Path(self.temp.name) / 'Database'
        shutil.copytree(DATABASE, database)
        (database / 'Tables/BLOG_NEW_TABLE.sql').write_text(
            'create table blog_new_table (id number);\n', encoding='utf-8'
        )
        manifest = Path(self.temp.name) / 'install.list'
        manifest.write_text(
            (SCHEMA / 'install.list').read_text() + 'Tables/BLOG_NEW_TABLE.sql\n',
            encoding='utf-8',
        )
        result = subprocess.run(
            [sys.executable, str(ROOT / 'automation/lib/check_deinstall.py'),
             str(manifest), str(database), str(self.script)],
            text=True, capture_output=True,
        )
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Missing object drops', result.stderr)
        self.assertIn('BLOG_NEW_TABLE', result.stderr)

    def test_missing_package_drop_fails(self):
        self.replace('drop package blog_admin;\n')
        result = self.validate()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Missing object drops', result.stderr)
        self.assertIn('BLOG_ADMIN', result.stderr)

    def test_missing_separate_public_view_drop_fails(self):
        self.replace('drop view blog_v_version;\n')
        result = self.validate()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('BLOG_V_VERSION', result.stderr)

    def test_missing_foreign_key_drop_fails(self):
        self.replace('alter table blog_comments drop constraint blog_comments_fk1;\n')
        result = self.validate()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Missing foreign-key drops', result.stderr)
        self.assertIn('BLOG_COMMENTS_FK1', result.stderr)

    def test_missing_oracle_text_preference_cleanup_fails(self):
        self.replace("ctx_ddl.drop_preference( 'BLOG_POSTS_UDS' );", "null; -- preference accidentally removed")
        result = self.validate()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Missing Oracle Text preference drops', result.stderr)
        self.assertIn('BLOG_POSTS_UDS', result.stderr)

    def test_unexpected_or_duplicate_drop_fails(self):
        self.script.write_text(self.script.read_text() + 'drop table not_a_blog_table;\n')
        result = self.validate()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Unexpected/duplicate object drops', result.stderr)
        self.assertIn('NOT_A_BLOG_TABLE', result.stderr)

        self.script.write_text(self.script.read_text() + 'drop package blog_admin;\n')
        result = self.validate()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('BLOG_ADMIN', result.stderr)

    def test_unsupported_drop_is_rejected(self):
        self.script.write_text(self.script.read_text() + 'drop user temp_user;\n')
        result = self.validate()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Unsupported DROP statement', result.stderr)


class ManifestInputTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='apex-blog-manifest-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.db = self.root / 'Database'
        for folder in ('Packages', 'Tables', 'Views'):
            (self.db / folder).mkdir(parents=True)
        (self.db / 'Packages/APP.pks').write_text('create or replace package app as end;\n/\n')
        (self.db / 'Packages/APP.pkb').write_text('create or replace package body app as end;\n/\n')
        (self.db / 'Tables/A.sql').write_text("select 'a  b' from dual;\n")
        (self.db / 'Views/BLOG_V_VERSION.sql').write_text('create view x as select 1 x from dual;\n')
        self.list_file = self.root / 'install.list'
        self.list_file.write_text('Tables/A.sql\nPackages/APP.pks\nPackages/APP.pkb\n')

    def assemble(self, *args: str) -> subprocess.CompletedProcess:
        return subprocess.run(
            [sys.executable, str(ASSEMBLER), str(self.list_file), str(self.db), *args],
            text=True, capture_output=True,
        )

    def test_preserves_literals_and_does_not_reorder_explicit_entries(self):
        dest = self.root / 'generated.sql'
        result = self.assemble(str(dest), '--check-inventory')
        self.assertEqual(result.returncode, 0, result.stderr)
        text = dest.read_text()
        self.assertIn("'a  b'", text)
        self.assertLess(text.index('package app as'), text.index('package body app as'))
        self.assertEqual(text.count('package body app'), 1)

    def test_rejects_unlisted_orphan_database_file(self):
        (self.db / 'Tables/UNLISTED.sql').write_text('select 1 from dual;\n')
        result = self.assemble('--check-only', '--check-inventory')
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Unlisted Database/', result.stderr)
        self.assertIn('Tables/UNLISTED.sql', result.stderr)

    def test_rejects_unpaired_packages(self):
        self.list_file.write_text('Tables/A.sql\nPackages/APP.pks\n')
        result = self.assemble('--check-only')
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Unpaired package', result.stderr)

    def test_rejects_package_body_before_specification(self):
        self.list_file.write_text('Packages/APP.pkb\nPackages/APP.pks\n')
        result = self.assemble('--check-only')
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('must precede', result.stderr)

    def test_rejects_duplicates_and_path_traversal(self):
        self.list_file.write_text('Tables/A.sql\nTables/A.sql\n')
        result = self.assemble('--check-only')
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('duplicate source', result.stderr)
        self.list_file.write_text('../private.sql\n')
        result = self.assemble('--check-only')
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('invalid repository-relative', result.stderr)
        self.list_file.write_text('Tables//A.sql\n')
        result = self.assemble('--check-only')
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('invalid repository-relative', result.stderr)

    def test_version_view_cannot_be_installed_twice(self):
        self.list_file.write_text(self.list_file.read_text() + 'Views/BLOG_V_VERSION.sql\n')
        result = self.assemble('--check-only', '--check-inventory')
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('installed separately', result.stderr)

    def test_missing_manifest_file_fails_without_output(self):
        self.list_file.write_text('Tables/MISSING.sql\n')
        dest = self.root / 'out.sql'
        result = self.assemble(str(dest))
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(dest.exists())


if __name__ == '__main__':
    unittest.main()
