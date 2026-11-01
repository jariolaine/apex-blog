#!/usr/bin/env python3
"""Check repository-managed APEXLang assets and release metadata without Oracle.

`source` mode is suitable for WIP and CI. `release` adds strict version checks
before packaging, without applying a release policy to every source edit.
"""

import argparse
import json
from pathlib import Path, PurePosixPath
import re
import sys


APP_ALIASES = ("blog-admin", "blog")
VERSION_PATTERN = re.compile(r"^Release [0-9]+(?:\.[0-9]+)+\.[0-9]{8}$")
VERSION_DECL = re.compile(r"(?m)^\s*version:\s*(Release [^\r\n]+?)\s*$")
STATIC_DECL = re.compile(r'(?m)^file\s+"([^"]+)"\s*\(')
CONTENT_FILE = re.compile(r"(?m)^\s*contentFile:\s*(\S+)\s*$")
SCRIPT_FILE = re.compile(r"(?m)^\s*scriptFile:\s*(\S+)\s*$")


def safe_file(base: Path, name: str) -> Path | None:
    """Reject absolute or parent-traversing references before joining paths."""
    posix = PurePosixPath(name)
    if posix.is_absolute() or not name or any(p in (".", "..", "") for p in posix.parts):
        return None
    return base.joinpath(*posix.parts)


def check(root: Path, apps: Path, dev_ids: list[str], mode: str) -> list[str]:
    problems: list[str] = []
    release_version = (root / "VERSION.txt").read_text(encoding="utf-8").strip()
    if not VERSION_PATTERN.fullmatch(release_version):
        problems.append("VERSION.txt: invalid release version (expected 'Release x.y.z.YYYYMMDD')")

    for alias, dev_id in zip(APP_ALIASES, dev_ids, strict=True):
        base = apps / alias
        deployment = base / "deployments/default.json"
        try:
            actual_id = json.loads(deployment.read_text(encoding="utf-8"))["app"]["id"]
            if str(actual_id) != str(dev_id):
                problems.append(f"{alias}: deployment app ID {actual_id} differs from DEV ID {dev_id}")
        except (OSError, ValueError, KeyError, TypeError) as exc:
            problems.append(f"{alias}: invalid deployments/default.json: {exc}")

        app_file = base / "application.apx"
        try:
            versions = VERSION_DECL.findall(app_file.read_text(encoding="utf-8"))
            if len(versions) != 1:
                problems.append(f"{alias}: expected one version in application.apx")
            elif mode == "release" and versions[0] != release_version:
                problems.append(f"{alias}: application.apx version {versions[0]!r} differs from VERSION.txt {release_version!r}")
        except OSError as exc:
            problems.append(f"{alias}: cannot read application.apx: {exc}")

        static_manifest = base / "shared-components/static-files.apx"
        static_root = base / "shared-components/static-files"
        try:
            declared = STATIC_DECL.findall(static_manifest.read_text(encoding="utf-8"))
        except OSError as exc:
            problems.append(f"{alias}: missing static-files.apx: {exc}")
            declared = []
        if len(declared) != len(set(declared)):
            problems.append(f"{alias}: duplicate static file declarations")
        declared_set = set(declared)
        for name in declared_set:
            target = safe_file(static_root, name)
            if target is None or not target.is_file() or target.is_symlink():
                problems.append(f"{alias}: referenced static file missing or unsafe: {name}")
        if static_root.is_dir():
            actual = {p.relative_to(static_root).as_posix() for p in static_root.rglob("*") if p.is_file()}
            for name in sorted(actual - declared_set):
                problems.append(f"{alias}: static file not listed in static-files.apx: {name}")

        sup = base / "supporting-objects"
        for kind in ("install-scripts", "upgrade-scripts"):
            manifest = sup / f"{kind}.apx"
            if not manifest.is_file():
                continue  # Not all applications define upgrade scripts.
            for name in CONTENT_FILE.findall(manifest.read_text(encoding="utf-8")):
                target = safe_file(sup / kind, name)
                if target is None or not target.is_file() or target.is_symlink():
                    problems.append(f"{alias}: referenced Supporting Objects SQL missing or unsafe: {kind}/{name}")
        main = sup / "supporting-objects.apx"
        if main.is_file():
            for name in SCRIPT_FILE.findall(main.read_text(encoding="utf-8")):
                target = safe_file(sup, name)
                if target is None or not target.is_file() or target.is_symlink():
                    problems.append(f"{alias}: referenced deinstall SQL missing or unsafe: {name}")

    if mode == "release":
        # Only current install/upgrade metadata: historical upgrade patches
        # intentionally contain older version numbers and must not be scanned.
        current = {
            "blog/supporting-objects/install-scripts/metadata.sql": r"blog_install\.settings_merge\s*\(\s*'G_APP_VERSION'[^;]*;",
            "blog/supporting-objects/upgrade-scripts/postupgrade.sql": r"(?is)update\s+blog_settings\b.*?;",
        }
        for rel, statement_pattern in current.items():
            path = apps / rel
            try:
                sql = path.read_text(encoding="utf-8")
                statement = re.search(statement_pattern, sql, re.IGNORECASE | re.DOTALL)
                values = re.findall(r"'Release [^']+'", statement.group(0)) if statement else []
                if values != [f"'{release_version}'"]:
                    problems.append(f"{rel}: current installer version differs from VERSION.txt (or is missing)")
            except OSError as exc:
                problems.append(f"{rel}: cannot read current metadata: {exc}")
    return problems


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, required=True)
    parser.add_argument("--apps-dir", type=Path)
    parser.add_argument("--dev-ids", nargs=2, required=True, metavar=("ADMIN", "PUBLIC"))
    parser.add_argument("--mode", choices=("source", "release"), default="source")
    args = parser.parse_args()
    root = args.repo.resolve()
    errors = check(root, (args.apps_dir or root / "applications").resolve(), args.dev_ids, args.mode)
    for error in errors:
        print(f"[source-consistency] ERROR: {error}", file=sys.stderr)
    if errors:
        return 1
    print(f"[source-consistency] {args.mode} checks passed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
