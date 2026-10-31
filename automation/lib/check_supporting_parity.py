#!/usr/bin/env python3
"""Fail if the SQL scripts exported from DEV differ from maintained APEXlang SQL."""
import argparse
from pathlib import Path
import sys


def files(root: Path):
    parent = root / "supporting-objects"
    return {p.relative_to(parent): p.read_bytes() for p in parent.rglob("*.sql")}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("repository_app", type=Path)
    parser.add_argument("exported_app", type=Path)
    args = parser.parse_args()
    repo = files(args.repository_app)
    exported = files(args.exported_app)
    mismatches = sorted(p for p in repo.keys() | exported.keys()
                        if repo.get(p) != exported.get(p))
    if mismatches:
        print("ERROR: Supporting Objects SQL in DEV differs from the repository:", file=sys.stderr)
        for path in mismatches[:30]:
            print(f"  supporting-objects/{path}", file=sys.stderr)
        if len(mismatches) > 30:
            print(f"  ... and {len(mismatches)-30} more", file=sys.stderr)
        print("Synchronize APEXlang sources into DEV using import_apps_to_dev.sh "
              "(review before importing), then export again.", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
