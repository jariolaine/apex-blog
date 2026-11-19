#!/usr/bin/env python3
"""Optionally seed Dev SQLcl profiles from an external read-only directory.

The external directory is authoritative when populated. An empty placeholder
leaves the existing persistent Dev home unchanged; MCP uses a different source.
"""

from __future__ import annotations

import os
from pathlib import Path
import shutil
import sys
import tempfile


def sync_profile(source: Path, home: Path) -> bool:
    if not source.is_dir():
        raise ValueError(f"SQLcl source directory is missing: {source}")
    contents = [p for p in source.iterdir() if p.name != ".gitkeep"]
    if not contents:
        return False
    destination = home / ".dbtools"
    if destination.is_symlink():
        raise ValueError(f"Refusing to replace symlinked SQLcl home: {destination}")
    # Do not copy symlinks that could pull in credentials from outside the
    # intended profile directory.
    for directory, dirs, files in os.walk(source, followlinks=False):
        for name in dirs + files:
            if (Path(directory) / name).is_symlink():
                raise ValueError("SQLcl profile source must not contain symlinks")
    os.umask(0o077)
    with tempfile.TemporaryDirectory(prefix=".apex-blog-sqlcl-", dir=home) as tmp:
        stage = Path(tmp) / "staged"
        shutil.copytree(source, stage, ignore=shutil.ignore_patterns(".gitkeep"))
        for directory, dirs, files in os.walk(stage):
            os.chmod(directory, 0o700)
            for name in dirs:
                os.chmod(Path(directory) / name, 0o700)
            for name in files:
                os.chmod(Path(directory) / name, 0o600)
        previous = Path(tmp) / "previous"
        if destination.exists():
            destination.rename(previous)
        try:
            stage.rename(destination)
        except BaseException:
            if previous.exists():
                previous.rename(destination)
            raise
    return True


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit("Usage: prepare_dev_sqlcl_profile.py SOURCE_DIRECTORY")
    changed = sync_profile(Path(sys.argv[1]), Path.home())
    print("[apex-blog] Dev SQLcl profile " + ("loaded" if changed else "unchanged"),
          file=sys.stderr)
