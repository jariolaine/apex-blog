#!/usr/bin/env python3
"""Non-mutating SQL source hygiene; never formats or parses PL/SQL bodies.

SQLFluff performs a narrow Oracle-dialect pass separately. This checker
covers all hand-authored SQL, including complex PL/SQL, without false SQLcl
parse failures. Generated Supporting Objects bundles are excluded.
"""
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
SQL_ROOTS = (ROOT / "Database", ROOT / "automation/database", ROOT / "automation/sql")

def check(path: Path) -> list[str]:
    problems = []
    try:
        content = path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        return [f"{path}: not UTF-8"]
    if not content.strip():
        problems.append(f"{path}: empty SQL file")
    if "\x00" in content:
        problems.append(f"{path}: NUL byte")
    if not content.endswith("\n"):
        problems.append(f"{path}: missing final newline")
    for number, line in enumerate(content.splitlines(), start=1):
        if line.startswith(("<<<<<<< ", "=======", ">>>>>>> ")):
            problems.append(f"{path}:{number}: unresolved merge conflict")
    return problems


def main() -> int:
    files = sorted(p for root in SQL_ROOTS for p in root.rglob("*")
                   if p.is_file() and p.suffix.lower() in {".sql", ".pks", ".pkb"})
    issues = [msg for path in files for msg in check(path)]
    for msg in issues:
        print(msg, file=sys.stderr)
    print(f"SQL source check: {len(files)} files, {len(issues)} issues")
    return bool(issues)


if __name__ == "__main__":
    sys.exit(main())
