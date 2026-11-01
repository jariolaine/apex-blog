#!/usr/bin/env python3
"""Validate the hand-maintained Supporting Objects deinstall SQL against Git.

This command never generates or rewrites deinstallation SQL. Tables own their
indexes and triggers, so dropping a table removes those automatically. Foreign
keys and Oracle Text preferences are checked separately against their sources.
"""
import argparse
from collections import Counter
from pathlib import Path, PurePosixPath
import re
import sys

from assemble_objects import SEPARATE_INSTALL_SOURCE, load_manifest

IDENT = r'[A-Za-z][A-Za-z0-9_$#]*'
DROP_OBJECT = re.compile(
    rf'^\s*drop\s+(package|sequence|table|view)\s+({IDENT})\s*;\s*$', re.I | re.M
)
DROP_ANY = re.compile(r'^\s*drop\s+[^\n]+', re.I | re.M)
ADD_FK = re.compile(
    rf'^\s*alter\s+table\s+({IDENT})\s+add\s+constraint\s+({IDENT})\s+foreign\s+key\s*\(',
    re.I | re.M,
)
DROP_FK = re.compile(
    rf'^\s*alter\s+table\s+({IDENT})\s+drop\s+constraint\s+({IDENT})\s*;\s*$',
    re.I | re.M,
)
CREATE_PREFERENCE = re.compile(
    r"\bctx_ddl\.create_preference\s*\(\s*preference_name\s*=>\s*'([^']+)'",
    re.I,
)
DROP_PREFERENCE = re.compile(
    r"\bctx_ddl\.drop_preference\s*\(\s*'([^']+)'\s*\)", re.I
)
SOURCE_KINDS = {
    'Packages': ('package', '.pks'),
    'Sequences': ('sequence', '.sql'),
    'Tables': ('table', '.sql'),
    'Views': ('view', '.sql'),
}


def without_line_comments(sql: str) -> str:
    # The checked SQL is a DDL-only script; comments do not contain SQL literals.
    return re.sub(r'--[^\n]*', '', sql)


def expected_objects(entries: list[tuple[str, Path]]) -> Counter:
    objects = Counter()
    for name, _ in entries:
        if name == 'Tables/foreign_keys.sql':
            continue
        source = PurePosixPath(name)
        if source.parts[0] not in SOURCE_KINDS:
            # Indexes and triggers disappear when their owning tables drop.
            if source.parts[0] not in ('Indexes', 'Triggers'):
                raise ValueError(f'Unknown schema source category: {name}')
            continue
        kind, suffix = SOURCE_KINDS[source.parts[0]]
        if source.suffix == '.pkb' and source.parts[0] == 'Packages':
            continue  # DROP PACKAGE removes both specification and body.
        if source.suffix != suffix:
            raise ValueError(f'Unexpected schema source extension: {name}')
        objects[(kind, source.stem.upper())] += 1
    # Public application installation creates this view separately.
    objects[('view', PurePosixPath(SEPARATE_INSTALL_SOURCE).stem.upper())] += 1
    return objects


def check_counter(label: str, expected: Counter, actual: Counter) -> list[str]:
    issues = []
    missing = expected - actual
    extra = actual - expected
    if missing:
        entries = ', '.join(f'{name} ({count})' for name, count in sorted(missing.items()))
        issues.append(f'Missing {label}: {entries}')
    if extra:
        entries = ', '.join(f'{name} ({count})' for name, count in sorted(extra.items()))
        issues.append(f'Unexpected/duplicate {label}: {entries}')
    return issues


def check(manifest: Path, database: Path, deinstall: Path) -> list[str]:
    root = database.resolve(strict=True)
    entries = load_manifest(manifest, root)
    sql = without_line_comments(deinstall.read_text(encoding='utf-8-sig'))
    expected = expected_objects(entries)
    actual = Counter((kind.lower(), name.upper()) for kind, name in DROP_OBJECT.findall(sql))
    issues = check_counter('object drops', expected, actual)
    if len(DROP_ANY.findall(sql)) != sum(actual.values()):
        issues.append('Unsupported DROP statement; expected only DROP PACKAGE/SEQUENCE/TABLE/VIEW')

    fk_file = root / 'Tables/foreign_keys.sql'
    if not any(name == 'Tables/foreign_keys.sql' for name, _ in entries):
        issues.append('Install manifest must include Tables/foreign_keys.sql')
    fk_source = without_line_comments(fk_file.read_text(encoding='utf-8-sig'))
    foreign_keys = Counter((table.upper(), constraint.upper())
                           for table, constraint in ADD_FK.findall(fk_source))
    if not foreign_keys:
        issues.append('No foreign keys recognized in Database/Tables/foreign_keys.sql')
    actual_fks = Counter((table.upper(), constraint.upper())
                         for table, constraint in DROP_FK.findall(sql))
    issues += check_counter('foreign-key drops', foreign_keys, actual_fks)

    preferences = Counter()
    for name, source in entries:
        if name.startswith('Indexes/'):
            contents = without_line_comments(source.read_text(encoding='utf-8-sig'))
            preferences.update(value.upper() for value in CREATE_PREFERENCE.findall(contents))
    actual_prefs = Counter(value.upper() for value in DROP_PREFERENCE.findall(sql))
    issues += check_counter('Oracle Text preference drops', preferences, actual_prefs)
    return issues


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('install_manifest', type=Path)
    parser.add_argument('database_root', type=Path)
    parser.add_argument('deinstall_script', type=Path)
    args = parser.parse_args()
    try:
        issues = check(args.install_manifest, args.database_root, args.deinstall_script)
    except (OSError, ValueError) as exc:
        issues = [str(exc)]
    for issue in issues:
        print(f'ERROR: {issue}', file=sys.stderr)
    if issues:
        return 1
    print('Checked-in deinstall SQL matches schema objects, foreign keys and text preferences')
    return 0


if __name__ == '__main__':
    sys.exit(main())
