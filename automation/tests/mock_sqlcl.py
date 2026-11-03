#!/usr/bin/env python3
"""Small SQLcl stand-in for orchestration tests. This is NOT a SQL/APEX emulator."""
import json
import os
from pathlib import Path
import re
import shlex
import shutil
import sys

src = sys.stdin.read()
argv = sys.argv[1:]
log_file = Path(os.environ['MOCK_SQLCL_LOG'])
with log_file.open('a', encoding='utf-8') as stream:
    stream.write(json.dumps({'argv': argv, 'sql': src}) + '\n')

# Release management checks are simulated; they cannot validate database state.
if 'APEX_BLOG_RELEASE_PREPARED' in src:
    print('APEX_BLOG_RELEASE_PREPARED')
    sys.exit(0)

if 'APEX_BLOG_VERSION_OK' in src:
    print('APEX_BLOG_VERSION_OK')
    sys.exit(0)

if 'APEX_BLOG_SCHEMA_PRESENT' in src:
    if not os.environ.get('MOCK_SCHEMA_EMPTY'):
        print('APEX_BLOG_SCHEMA_PRESENT')
    sys.exit(0)

if 'APEX_BLOG_ENV_OK' in src:
    if os.environ.get('MOCK_WRONG_ENV'):
        print('ORA-20050: Wrong connected schema')
        sys.exit(2)
    print('APEX_BLOG_ENV_OK')
    sys.exit(0)

match = re.search(r'^apex export .*$', src, flags=re.M)
if match:
    args = shlex.split(match.group(0))
    app_id = args[args.index('-applicationid')+1]
    kind = args[args.index('-exptype')+1]
    out = Path(args[args.index('-dir')+1])
    out.mkdir(parents=True, exist_ok=True)
    if kind == 'APEXLANG':
        alias = {'402': 'blog-admin', '401': 'blog'}[app_id]
        template = Path(os.environ['MOCK_APEX_TEMPLATE']) / alias
        output_alias = alias
        shutil.copytree(template, out / output_alias, dirs_exist_ok=True)
        if os.environ.get('MOCK_CHANGE_STATIC'):
            static = out / output_alias / 'shared-components/static-files'
            css = next(static.rglob('*.css'))
            css.write_bytes(css.read_bytes() + b'\n/* DEV static edit */\n')
            png = next(static.rglob('*.png'))
            png.write_bytes(png.read_bytes() + b'\x00DEV')
        if os.environ.get('MOCK_ADD_STATIC'):
            static = out / output_alias / 'shared-components/static-files'
            (static / 'css/new-from-dev.css').write_text('/* New from DEV */\n')
            metadata = out / output_alias / 'shared-components/static-files.apx'
            with metadata.open('a') as f:
                f.write('\nfile "css/new-from-dev.css" (\n    mimeType: text/css\n    charSet: utf-8\n)\n')
    elif kind == 'SQL':
        (out / f'f{app_id}.sql').write_text(f'prompt Release app {app_id} with Supporting Objects\n')
    else:
        print(f'Unknown format {kind}', file=sys.stderr)
        sys.exit(1)
    print('Export successful')
    sys.exit(0)

if re.search(r'^apex validate ', src, flags=re.M):
    if os.environ.get('MOCK_FAIL_VALIDATE'):
        print('APEXlang compile errors: invalid component')
        # SQLcl may return 0 for this type of command failure.
        sys.exit(0)
    print('Validation successful')
    sys.exit(0)

if re.search(r'^apex import ', src, flags=re.M):
    print('Import successful')
    sys.exit(0)

if re.search(r'^@', src, flags=re.M) and 'deinstall_supporting_objects.sql' in src:
    print('Deinstallation completed')
    sys.exit(0)

if re.search(r'^@', src, flags=re.M) and 'verify_deinstalled_objects.sql' in src:
    if os.environ.get('MOCK_DEINSTALL_LEFTOVER_OBJECTS'):
        print('ORA-20058: TEST deinstall incomplete: 1 user object, 0 applications remain')
        sys.exit(2)
    if os.environ.get('MOCK_DEINSTALL_LEFTOVER_APPS'):
        print('ORA-20058: TEST deinstall incomplete: 0 user objects, 1 application remains')
        sys.exit(2)
    print('APEX_BLOG_DEINSTALL_OK')
    sys.exit(0)

if re.search(r'^@', src, flags=re.M) and 'install_application.sql' in src:
    print('APEX_BLOG_INSTALL_OK')
    sys.exit(0)

if re.search(r'^@', src, flags=re.M) and 'verify_installed_objects.sql' in src:
    print('APEX_BLOG_OBJECTS_VALID')
    sys.exit(0)

print('OK')
