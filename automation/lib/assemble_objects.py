#!/usr/bin/env python3
"""Assemble schema SQL in the exact order of a repository-owned manifest.

Entries are paths relative to Database/, including .sql, .pks, or .pkb.
The manifest owns installation order; package specs must precede bodies.
No connection to DEV or SQL metadata queries are necessary.
"""
import argparse
from pathlib import Path, PurePosixPath
import sys

SOURCE_EXTENSIONS = {'.sql', '.pks', '.pkb'}
# Installed by the Public application's own Supporting Objects step, not here.
SEPARATE_INSTALL_SOURCE = 'Views/BLOG_V_VERSION.sql'


def load_manifest(list_file: Path, root: Path) -> list[tuple[str, Path]]:
    entries = []
    seen = set()
    seen_files = set()
    for lineno, raw in enumerate(list_file.read_text(encoding='utf-8-sig').splitlines(), 1):
        name = raw.strip()
        if not name or name.startswith(('#', '--')):
            continue
        relative = PurePosixPath(name)
        if (relative.is_absolute() or name != relative.as_posix()
                or '..' in relative.parts or '\\' in name
                or relative.suffix not in SOURCE_EXTENSIONS or len(relative.parts) < 2):
            raise ValueError(f'{list_file}:{lineno}: invalid repository-relative source: {name}')
        if name.casefold() in seen:
            raise ValueError(f'{list_file}:{lineno}: duplicate source: {name}')
        seen.add(name.casefold())
        src = (root / name).resolve(strict=True)
        if not src.is_relative_to(root) or not src.is_file():
            raise ValueError(f'{list_file}:{lineno}: unsafe source: {name}')
        if src in seen_files:
            raise ValueError(f'{list_file}:{lineno}: same source listed twice: {name}')
        seen_files.add(src)
        entries.append((name, src))

    if not entries:
        raise ValueError(f'Empty manifest: {list_file}')

    names = {name for name, _ in entries}
    specs = {name.removesuffix('.pks') for name in names if name.endswith('.pks')}
    bodies = {name.removesuffix('.pkb') for name in names if name.endswith('.pkb')}
    if specs != bodies:
        raise ValueError(f'Unpaired package sources (spec only: {sorted(specs-bodies)}; '
                         f'body only: {sorted(bodies-specs)})')
    if any(not name.startswith('Packages/') for name in names
           if name.endswith(('.pks', '.pkb'))):
        raise ValueError('Package .pks and .pkb files must be under Database/Packages/')
    first_body = next((i for i, (name, _) in enumerate(entries) if name.endswith('.pkb')), None)
    if first_body is not None and any(name.endswith('.pks') for name, _ in entries[first_body:]):
        raise ValueError('All package specifications must precede package bodies')
    return entries


def check_inventory(root: Path, entries: list[tuple[str, Path]]) -> None:
    """Reject new/orphan schema files not explicitly accounted for by install.list."""
    names = {name for name, _ in entries}
    if SEPARATE_INSTALL_SOURCE in names:
        raise ValueError(f'{SEPARATE_INSTALL_SOURCE} is installed separately by the Public app')
    if not (root / SEPARATE_INSTALL_SOURCE).is_file():
        raise ValueError(f'Missing separately installed source: {SEPARATE_INSTALL_SOURCE}')
    files = {str(p.relative_to(root)) for p in root.rglob('*')
             if p.is_file() and p.suffix.lower() in SOURCE_EXTENSIONS}
    unlisted = files - names - {SEPARATE_INSTALL_SOURCE}
    if unlisted:
        raise ValueError('Unlisted Database/ source files: ' + ', '.join(sorted(unlisted)))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('list_file', type=Path)
    parser.add_argument('source_root', type=Path)
    parser.add_argument('output', type=Path, nargs='?')
    parser.add_argument('--header', default='')
    parser.add_argument('--check-only', action='store_true',
                        help='Validate the manifest without writing an output file')
    parser.add_argument('--check-inventory', action='store_true',
                        help='Require install.list to account for every Database/ source')
    args = parser.parse_args()
    if args.check_only == (args.output is not None):
        parser.error('Supply an output path, or use --check-only without one')

    root = args.source_root.resolve(strict=True)
    entries = load_manifest(args.list_file, root)
    if args.check_inventory:
        check_inventory(root, entries)
    if args.check_only:
        print(f'Schema manifest OK: {args.list_file} ({len(entries)} objects)')
        return

    parts = [args.header] if args.header else []
    for name, src in entries:
        sql = src.read_text(encoding='utf-8-sig')
        if not sql.strip():
            raise ValueError(f'Empty source: {name}')
        parts.append(sql)
    # Preserve SQL literals/whitespace, adding only a final newline if absent.
    result = ''.join(part if part.endswith('\n') else part + '\n' for part in parts)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(result, encoding='utf-8')


if __name__ == '__main__':
    try:
        main()
    except (OSError, ValueError) as exc:
        print(f'ERROR: {exc}', file=sys.stderr)
        raise SystemExit(1)
