#!/usr/bin/env python3
"""Safely extract named SQL files from a previous APEX Blog release ZIP.

With --candidate-version-file, require a VERSION.txt identifying a release
strictly older than that checksum-verified candidate (before TEST is reset).
"""
import argparse
from datetime import datetime
from pathlib import Path
import re
import stat
from zipfile import ZipFile, BadZipFile
import sys


VERSION_RE = re.compile(r"Release ([0-9]+(?:\.[0-9]+)+)\.([0-9]{8})")


def version_key(data: bytes, label: str) -> tuple[int, ...]:
    try:
        text = data.decode('utf-8').removesuffix('\n')
    except UnicodeDecodeError as exc:
        raise ValueError(f'Invalid UTF-8 in {label}') from exc
    match = VERSION_RE.fullmatch(text)
    if not match:
        raise ValueError(f'Invalid {label}; expected Release X.Y.Z.YYYYMMDD')
    try:
        datetime.strptime(match.group(2), '%Y%m%d')
    except ValueError as exc:
        raise ValueError(f'Invalid release date in {label}') from exc
    return (*map(int, match.group(1).split('.')), int(match.group(2)))


def checked_entry(z: ZipFile, name: str, size_limit: int):
    if name != Path(name).name or name in ('', '.', '..'):
        raise ValueError(f'Unsafe requested ZIP filename: {name}')
    matches = [info for info in z.infolist() if info.filename == name]
    if len(matches) != 1:
        raise ValueError(f'Missing or duplicate release file: {name}')
    info = matches[0]
    if info.is_dir() or stat.S_ISLNK((info.external_attr >> 16) & 0xffff):
        raise ValueError(f'Unsafe release entry: {name}')
    if info.file_size > size_limit:
        raise ValueError(f'Release file unexpectedly large: {name}')
    return info


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--candidate-version-file', type=Path,
                        help='Require ZIP VERSION.txt strictly older than this candidate')
    parser.add_argument('zipfile', type=Path)
    parser.add_argument('output', type=Path)
    parser.add_argument('names', nargs='+')
    args = parser.parse_args()
    with ZipFile(args.zipfile) as archive:
        entries = [checked_entry(archive, name, 100 * 1024 * 1024)
                   for name in args.names]
        if args.candidate_version_file:
            expected = version_key(args.candidate_version_file.read_bytes(),
                                   'candidate VERSION.txt')
            version_entry = checked_entry(archive, 'VERSION.txt', 256)
            previous_data = archive.read(version_entry)
            previous = version_key(previous_data, 'previous release VERSION.txt')
            if previous >= expected:
                raise ValueError('Previous release must be older than the selected candidate')
            entries.append(version_entry)
        args.output.mkdir(parents=True, exist_ok=True)
        for info in entries:
            with archive.open(info) as stream:
                data = stream.read()
            if not data:
                raise ValueError(f'Empty previous release file: {info.filename}')
            (args.output / info.filename).write_bytes(data)


if __name__ == '__main__':
    try:
        main()
    except (OSError, ValueError, BadZipFile) as exc:
        print(f'ERROR: {exc}', file=sys.stderr)
        sys.exit(1)
