#!/usr/bin/env python3
"""Validate Git-owned APEX install metadata and stage its release version offline.

Only the G_APP_VERSION SQL string literal may change during rendering. Other
metadata, including dynamic application IDs, is authored and reviewed in Git.
"""

import argparse
from pathlib import Path
import re
import sys


VERSION = re.compile(r"Release [0-9]+(?:\.[0-9]+)+\.[0-9]{8}\Z")
SETTING = re.compile(r"(?mi)^[ \t]*blog_install\.settings_merge\(\s*'([^']+)'\s*,")
FEATURE = re.compile(r"(?mi)^[ \t]*blog_install\.features_merge\(\s*'([^']+)'\s*,")
LOV = re.compile(
    r"(?mi)^[ \t]*blog_install\.list_of_values_ins\(\s*\d+\s*,\s*\d+\s*,\s*'([^']+)'\s*,\s*'([^']+)'\s*,"
)
VERSION_LINE = re.compile(
    r"(?mi)^(?P<before>[ \t]*blog_install\.settings_merge\(\s*'G_APP_VERSION'\s*,[^;\r\n]*,\s*)"
    r"'(?P<version>Release [^'\r\n]*)'(?P<after>\s*\);[ \t]*)$"
)


def read_source(path: Path) -> str:
    if path.is_symlink() or not path.is_file():
        raise ValueError(f"missing or unsafe metadata file: {path}")
    try:
        content = path.read_bytes().decode("utf-8")
    except UnicodeError as exc:
        raise ValueError(f"invalid UTF-8 metadata: {path}") from exc
    if not content.strip():
        raise ValueError(f"empty metadata: {path}")
    return content


def unique(items: list, label: str) -> None:
    if len(items) != len(set(items)):
        raise ValueError(f"duplicate {label} in Git-owned metadata")


def check_app_id(content: str, key: str) -> None:
    # Limit this assertion to its own settings_merge statement. Do not accept
    # an expression that merely appears in a SQL comment or a different key.
    row = re.search(
        rf"(?mi)^[ \t]*blog_install\.settings_merge\(\s*'{key}'\s*,[^;\r\n]*\);[ \t]*$",
        content,
    )
    if not row or not re.search(
        r"(?i),\s*blog_util\.int_to_vc2\(\s*apex_application_install\.get_application_id\s*\)\s*\);\s*$",
        row.group(),
    ):
        raise ValueError(f"{key} must use the dynamic APEX install application ID")


def render(root: Path, check: bool) -> str:
    version = read_source(root / "VERSION.txt").strip()
    if not VERSION.fullmatch(version):
        raise ValueError("VERSION.txt must contain exactly Release x.y.z.YYYYMMDD")

    admin = read_source(root / "applications/blog-admin/supporting-objects/install-scripts/metadata.sql")
    public = read_source(root / "applications/blog/supporting-objects/install-scripts/metadata.sql")

    admin_settings = SETTING.findall(admin)
    public_settings = SETTING.findall(public)
    features = FEATURE.findall(public)
    lovs = LOV.findall(public)
    unique(admin_settings, "Admin settings")
    unique(public_settings, "Public settings")
    unique(features, "Public feature names")
    unique(lovs, "Public LOV name/return-value pairs")
    if admin_settings != ["G_ADMIN_APP_ID"] or "G_ADMIN_APP_ID" in public_settings:
        raise ValueError("Admin metadata must contain only G_ADMIN_APP_ID")
    if public_settings.count("G_APP_VERSION") != 1 or public_settings.count("G_PUB_APP_ID") != 1:
        raise ValueError("Public metadata must contain G_APP_VERSION and G_PUB_APP_ID exactly once")
    check_app_id(admin, "G_ADMIN_APP_ID")
    check_app_id(public, "G_PUB_APP_ID")
    if not features or not lovs or len(re.findall(r"(?i)\bblog_install\.init_items_ins\s*;", public)) != 1:
        raise ValueError("Public metadata must contain features, LOVs and one init_items_ins call")

    matches = list(VERSION_LINE.finditer(public))
    if len(matches) != 1 or not VERSION.fullmatch(matches[0].group("version")):
        raise ValueError("Expected one valid G_APP_VERSION string literal in Public metadata")
    old_version = matches[0].group("version")
    if check and old_version != version:
        raise ValueError(f"Public metadata G_APP_VERSION {old_version!r} differs from VERSION.txt {version!r}; run make supporting")
    match = matches[0]
    return public[:match.start("version")] + version + public[match.end("version"):]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=("check", "render"))
    parser.add_argument("--repo", type=Path, required=True)
    parser.add_argument("--output", type=Path, help="staging output for render; source is never written")
    args = parser.parse_args()
    if (args.action == "render") != (args.output is not None):
        parser.error("render requires --output, check must not provide --output")
    try:
        if args.output is not None and args.output.resolve() == (
            args.repo / "applications/blog/supporting-objects/install-scripts/metadata.sql"
        ).resolve():
            raise ValueError("render output must be separate from Git-owned metadata source")
        content = render(args.repo, check=args.action == "check")
        if args.output is not None:
            args.output.parent.mkdir(parents=True, exist_ok=True)
            args.output.write_bytes(content.encode("utf-8"))
        print(f"[metadata-source] {args.action} OK")
    except (OSError, ValueError) as exc:
        print(f"[metadata-source] ERROR: {exc}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
