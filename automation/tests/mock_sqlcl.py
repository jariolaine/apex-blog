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

if 'APEX_BLOG_BUILD_API_VALID' in src:
    if os.environ.get('MOCK_COMPILE_INVALID'):
        print('ORA-20075: BUILD_API compilation errors')
        sys.exit(2)
    print('APEX_BLOG_BUILD_API_VALID')
    sys.exit(0)

if 'APEX_BLOG_VERSION_OK' in src:
    if os.environ.get('MOCK_WRONG_RELEASE_VERSION'):
        print('ORA-20074: DEV APEX application versions differ from VERSION.txt')
        sys.exit(2)
    print('APEX_BLOG_VERSION_OK')
    sys.exit(0)

if 'APEX_BLOG_SCHEMA_PRESENT' in src:
    if not os.environ.get('MOCK_SCHEMA_EMPTY'):
        print('APEX_BLOG_SCHEMA_PRESENT')
    sys.exit(0)

if 'APEX_BLOG_ENV_OK' in src:
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
        output_alias = alias.upper() if os.environ.get('MOCK_ALIAS_UPPER') else alias
        shutil.copytree(template, out / output_alias, dirs_exist_ok=True)
        if os.environ.get('MOCK_CHANGE_PAGE'):
            page = next((out/output_alias/'pages').glob('*.apx'))
            page.write_text(page.read_text()+'\n-- mock changed page\n')
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

if 'build_api.export_object_list' in src:
    # An explicit release must be supplied for both applications.
    versions = re.findall(r"build_api\.export_metadata\(p_application => '(?:ADMIN|PUBLIC)', p_release_version => '([^']+)'\)", src)
    if len(versions) != 2 or versions[0] != versions[1]:
        print('Missing or inconsistent version in BUILD_API calls', file=sys.stderr)
        sys.exit(2)
    version = versions[0]
    fixtures = {
      'objects.list': 'Tables/BLOG_POSTS\nPackages/BLOG_UTIL\n',
      'upgrade.list': 'Packages/BLOG_UTIL\n',
      'foreign_keys.sql': "select 'a  b' from dual;\n",
      'foreign_key_indexes.sql': "select '  spaced' from dual;\n",
      'admin_metadata.sql': 'prompt admin metadata\n',
      'public_metadata.sql': "blog_install.settings_merge('G_APP_VERSION',10,0,'STRING','INTERNAL',null,null,null,null,'" + version + "');\n",
      'deinstall.sql': 'prompt deinstall\n',
    }
    for output in re.findall(r'^spool\s+"([^"]+)"', src, flags=re.M):
        file = Path(output)
        file.parent.mkdir(parents=True, exist_ok=True)
        if file.name not in fixtures:
            print(f'Unexpected BUILD_API export: {file.name}', file=sys.stderr)
            sys.exit(2)
        file.write_text(fixtures[file.name], encoding='utf-8')
    sys.exit(0)

if re.search(r'^@', src, flags=re.M) and 'deinstall_supporting_objects.sql' in src:
    if os.environ.get('MOCK_DEINSTALL_SQL_ERROR'):
        print('ORA-00942: simulated deinstallation failure')
        sys.exit(2)
    print('Deinstallation completed')
    sys.exit(0)

if re.search(r'^@', src, flags=re.M) and 'verify_deinstalled_objects.sql' in src:
    if os.environ.get('MOCK_DEINSTALL_LEFTOVER_OBJECTS'):
        print('ORA-20058: TEST deinstall incomplete: 1 user object, 0 applications remain')
        sys.exit(2)
    if os.environ.get('MOCK_DEINSTALL_LEFTOVER_APPS'):
        print('ORA-20058: TEST deinstall incomplete: 0 user objects, 1 application remains')
        sys.exit(2)
    if not os.environ.get('MOCK_DEINSTALL_MISSING_MARKER'):
        print('APEX_BLOG_DEINSTALL_OK')
    sys.exit(0)

if re.search(r'^@', src, flags=re.M) and 'install_application.sql' in src:
    if os.environ.get('MOCK_INSTALL_WRONG_VERSION'):
        print('ORA-20056: Installed application version mismatch')
        sys.exit(2)
    if not os.environ.get('MOCK_INSTALL_MISSING_MARKER'):
        print('APEX_BLOG_INSTALL_OK')
    sys.exit(0)

if re.search(r'^@', src, flags=re.M) and 'verify_installed_objects.sql' in src:
    if os.environ.get('MOCK_INVALID_BLOG_OBJECTS'):
        print('ORA-20057: Installation left invalid BLOG_ database objects')
        sys.exit(2)
    if not os.environ.get('MOCK_OBJECTS_MISSING_MARKER'):
        print('APEX_BLOG_OBJECTS_VALID')
    sys.exit(0)

print('OK')
