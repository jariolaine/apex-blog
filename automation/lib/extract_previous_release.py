#!/usr/bin/env python3
"""Extract only named application SQL files from a previous public release ZIP.

Never extract arbitrary ZIP paths, symlinks, or extra files.
"""
import argparse
from pathlib import Path
import stat
from zipfile import ZipFile, BadZipFile
import sys


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('zipfile', type=Path)
    p.add_argument('output', type=Path)
    p.add_argument('names', nargs='+')
    a = p.parse_args()
    a.output.mkdir(parents=True, exist_ok=True)
    with ZipFile(a.zipfile) as z:
        for name in a.names:
            matches = [info for info in z.infolist() if info.filename == name]
            if len(matches) != 1:
                raise ValueError(f'Missing or duplicate release file: {name}')
            info = matches[0]
            if info.is_dir() or stat.S_ISLNK((info.external_attr >> 16) & 0xffff):
                raise ValueError(f'Unsafe release entry: {name}')
            if info.file_size > 100 * 1024 * 1024:
                raise ValueError(f'Release file unexpectedly large: {name}')
            with z.open(info) as data:
                (a.output / name).write_bytes(data.read())
            if not (a.output / name).stat().st_size:
                raise ValueError(f'Empty previous release file: {name}')


if __name__ == '__main__':
    try:
        main()
    except (OSError, ValueError, BadZipFile) as e:
        print(f'ERROR: {e}', file=sys.stderr)
        sys.exit(1)
