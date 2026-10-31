#!/usr/bin/env python3
"""Build installation/upgrade SQL with all package specs before package bodies.

Does not remove blank lines, trim SQL literals, or use regex-based whitespace edits.
"""
import argparse
from pathlib import Path
import re
import sys

# Supports CREATE OR REPLACE [NON]EDITIONABLE PACKAGE BODY across lines.
BODY = re.compile(
    r"(?im)^[ \t]*create\s+or\s+replace\s+"
    r"(?:(?:noneditionable|editionable)\s+)?package\s+body\b"
)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('list_file', type=Path)
    p.add_argument('source_root', type=Path)
    p.add_argument('output', type=Path)
    p.add_argument('--header', default='')
    p.add_argument('--append', type=Path, action='append', default=[])
    args = p.parse_args()
    root = args.source_root.resolve(strict=True)
    specs = []
    bodies = []
    for raw in args.list_file.read_text(encoding='utf-8-sig').splitlines():
        name = raw.strip()
        if not name or name.startswith('#') or name.startswith('--'):
            continue
        src = (root / (name + '.sql')).resolve(strict=True)
        if not src.is_relative_to(root):
            raise ValueError(f'Unsafe source path: {name}')
        text = src.read_text(encoding='utf-8-sig')
        if not text.strip():
            raise ValueError(f'Empty source: {src}')
        if name.casefold().startswith('packages/'):
            match = BODY.search(text)
            if not match:
                raise ValueError(f'No package body declaration found: {src}')
            specs.append(text[:match.start()])
            bodies.append(text[match.start():])
        else:
            specs.append(text)
    extra = [path.read_text(encoding='utf-8-sig') for path in args.append]
    args.output.parent.mkdir(parents=True, exist_ok=True)
    # Keep content whitespace intact. Ensure separate source files start on a new line.
    parts = ([args.header] if args.header else []) + specs + bodies + extra
    args.output.write_text(''.join(x if x.endswith('\n') else x + '\n' for x in parts),
                           encoding='utf-8')


if __name__ == '__main__':
    try:
        main()
    except (OSError, ValueError) as exc:
        print(f'ERROR: {exc}', file=sys.stderr)
        raise SystemExit(1)
