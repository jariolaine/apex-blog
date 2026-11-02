#!/usr/bin/env python3
"""Create and verify immutable APEX Blog release candidates (no database calls)."""

import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import zipfile


SOURCE_DIRS = (
    "applications", "Database", "less",
    "automation/lib", "automation/schema", "automation/sql", "automation/templates", "Stack/terraform",
)
RELEASE_FILES = ("VERSION.txt", "README.md", "LICENSE.txt")
ROOT_FILES = (*RELEASE_FILES, "automation/export_application.sh", "automation/supporting_objects.sh", "automation/variables.sh")
# Files produced by Terraform initialization or build-time stack packaging.
IGNORED_PARTS = {".terraform", "__pycache__", ".git"}
IGNORED_NAMES = {".terraform.lock.hcl", "VERSION.txt", ".DS_Store"}


def sha(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest()


def source_digest(root: Path) -> str:
    """Fingerprint release-relevant local source, including uncommitted files."""
    files = [root / name for name in ROOT_FILES]
    for folder in SOURCE_DIRS:
        base = root / folder
        if not base.is_dir():
            raise ValueError(f"missing source directory: {base}")
        for path in base.rglob("*"):
            rel = path.relative_to(base)
            if any(part in IGNORED_PARTS for part in rel.parts):
                continue
            if folder == "Stack/terraform" and (
                path.name in IGNORED_NAMES
                or path.name.startswith(".env")
                or path.name.endswith((".tfvars", ".tfvars.json", ".tfstate"))
                or ".tfstate." in path.name
            ):
                continue
            if path.is_file() or path.is_symlink():
                files.append(path)
    hasher = hashlib.sha256()
    for path in sorted(files, key=lambda p: p.relative_to(root).as_posix()):
        if path.is_symlink() or not path.is_file():
            raise ValueError(f"invalid release source file (symlink or missing): {path}")
        rel = path.relative_to(root).as_posix()
        hasher.update(rel.encode("utf-8") + b"\0" + sha(path).encode("ascii") + b"\n")
    return hasher.hexdigest()


def git_state(root: Path) -> tuple[str | None, bool | None]:
    try:
        commit = subprocess.run(
            ["git", "-C", str(root), "rev-parse", "--verify", "HEAD"],
            capture_output=True, text=True, check=False,
        )
    except OSError:
        return None, None
    if commit.returncode != 0:
        return None, None  # ZIP snapshot / no Git checkout.
    status = subprocess.run(
        ["git", "-C", str(root), "status", "--porcelain", "--untracked-files=normal"],
        capture_output=True, text=True, check=False,
    )
    return commit.stdout.strip(), bool(status.stdout.strip()) if status.returncode == 0 else None


def filename(name: str) -> str:
    if Path(name).name != name or name in ("", ".", "..") or "\\" in name:
        raise ValueError(f"invalid artifact filename: {name!r}")
    return name


def expected_names(args) -> list[str]:
    return list(dict.fromkeys(
        [filename(s) for s in args.sql_names]
        + [filename(args.zip_name), filename(args.stack_name)]
        + list(RELEASE_FILES)
    ))


def create(args) -> None:
    folder = args.dir.resolve()
    root = args.repo.resolve()
    names = expected_names(args)
    version = (folder / "VERSION.txt").read_text(encoding="utf-8").strip()
    if not version.startswith("Release ") or not version[8:]:
        raise ValueError("invalid VERSION.txt in release")
    commit, dirty = git_state(root)
    manifest = {
        "formatVersion": 1,
        "release": version,
        "version": version.removeprefix("Release "),
        "gitCommit": commit,
        "gitDirtyAtBuild": dirty,
        "sourceSha256": source_digest(root),
        "applications": [
            {"alias": alias, "devId": int(app_id), "sql": sql}
            for alias, app_id, sql in zip(
                ("blog-admin", "blog"), args.dev_ids, args.sql_names, strict=True
            )
        ],
        "files": {name: sha(folder / name) for name in names},
    }
    (folder / "manifest.json").write_text(
        json.dumps(manifest, sort_keys=True, indent=2) + "\n", encoding="utf-8"
    )
    # sha256sum-compatible file, sorted and relative to the candidate directory.
    (folder / "SHA256SUMS").write_text(
        "".join(f"{sha(folder / name)}  {name}\n" for name in sorted((*names, "manifest.json"))),
        encoding="utf-8",
    )
    verify(args, source=True, check_directory_name=False)


def verify(args, source: bool = False, check_directory_name: bool = True) -> None:
    folder = args.dir.resolve()
    manifest = json.loads((folder / "manifest.json").read_text(encoding="utf-8"))
    if manifest.get("formatVersion") != 1:
        raise ValueError("unsupported release manifest format")
    version = (folder / "VERSION.txt").read_text(encoding="utf-8").strip()
    if manifest.get("release") != version or manifest.get("version") != version.removeprefix("Release "):
        raise ValueError("release version in manifest differs from VERSION.txt")
    if check_directory_name and folder.name != manifest["version"]:
        raise ValueError(f"release directory {folder.name!r} differs from manifest version")
    expected = manifest.get("files")
    if not isinstance(expected, dict) or not expected:
        raise ValueError("missing release files in manifest")
    if not isinstance(manifest.get("applications"), list) or len(manifest["applications"]) != 2:
        raise ValueError("manifest does not describe both applications")
    sql_files = {app["sql"] for app in manifest["applications"]}
    if len(sql_files) != 2 or not sql_files.issubset(expected):
        raise ValueError("manifest does not reference two packaged SQL applications")
    required = (*RELEASE_FILES, "manifest.json", "SHA256SUMS")
    for name in required:
        if not (folder / name).is_file():
            raise ValueError(f"missing release file: {name}")
    sums = (folder / "SHA256SUMS").read_text(encoding="utf-8").splitlines()
    checksum_entries: dict[str, str] = {}
    for line in sums:
        if "  " not in line:
            raise ValueError("invalid SHA256SUMS line")
        digest, name = line.split("  ", 1)
        filename(name)
        if name in checksum_entries or len(digest) != 64:
            raise ValueError("duplicate or invalid checksum entry")
        checksum_entries[name] = digest
    if set(checksum_entries) != set(expected) | {"manifest.json"}:
        raise ValueError("SHA256SUMS does not match release manifest contents")
    for name in checksum_entries:
        path = folder / name
        if path.is_symlink() or not path.is_file():
            raise ValueError(f"missing or unsafe release artifact: {name}")
        if sha(path) != checksum_entries[name]:
            raise ValueError(f"checksum mismatch: {name}")
        if name != "manifest.json" and expected[name] != checksum_entries[name]:
            raise ValueError(f"manifest checksum mismatch: {name}")
    # The downloadable ZIP must contain the same two standalone SQL exports,
    # not different exports with the same external filenames.
    archives = [name for name in expected if name.endswith(".zip")]
    if len(archives) != 2:
        raise ValueError("expected application and stack ZIPs")
    candidates = []
    for name in archives:
        with zipfile.ZipFile(folder / name) as archive:
            listed = set(archive.namelist())
            if sql_files.issubset(listed):
                candidates.append(name)
                for sql in sql_files:
                    if hashlib.sha256(archive.read(sql)).hexdigest() != expected[sql]:
                        raise ValueError(f"ZIP SQL differs from release SQL: {sql}")
    if len(candidates) != 1:
        raise ValueError("cannot identify unique packaged application ZIP")
    if source:
        root = args.repo.resolve()
        if source_digest(root) != manifest.get("sourceSha256"):
            raise ValueError("source fingerprint differs from built release; test the matching source checkout")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=("create", "verify"))
    parser.add_argument("--dir", type=Path, required=True)
    parser.add_argument("--repo", type=Path)
    parser.add_argument("--check-source", action="store_true")
    parser.add_argument("--staging", action="store_true", help="internal: verify a temporary candidate before atomic publication")
    parser.add_argument("--sql-names", nargs=2, metavar=("ADMIN", "PUBLIC"))
    parser.add_argument("--zip-name")
    parser.add_argument("--stack-name")
    parser.add_argument("--dev-ids", nargs=2, metavar=("ADMIN", "PUBLIC"))
    args = parser.parse_args()
    try:
        if args.action == "create":
            if not (args.repo and args.sql_names and args.zip_name and args.stack_name and args.dev_ids):
                parser.error("create requires --repo, --sql-names, --zip-name, --stack-name and --dev-ids")
            create(args)
        else:
            if args.check_source and args.repo is None:
                parser.error("--check-source requires --repo")
            verify(args, source=args.check_source, check_directory_name=not args.staging)
        print(f"[release-manifest] {args.action} OK: {args.dir}")
        return 0
    except (OSError, ValueError, KeyError, IndexError, TypeError, zipfile.BadZipFile) as exc:
        print(f"[release-manifest] ERROR: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
