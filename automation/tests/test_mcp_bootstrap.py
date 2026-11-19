"""Offline contracts for immutable MCP/Dev tooling and retained volumes.

Image build/pulls are tested manually; these tests guard the interface without
requiring Docker, credentials, or network access during automation maintenance.
"""

import json
import os
import re
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[2]
MCP = ROOT / 'automation/docker/docker-compose.mcp.yml'
DEV = ROOT / 'automation/docker/docker-compose.dev.yml'


def compose_project_name(compose):
    match = re.search(r'(?m)^name:\s*([\w.-]+)\s*$', compose)
    if not match:
        raise AssertionError('Compose file must declare a project name')
    return match.group(1)


def named_volumes(compose):
    # Compose volumes are declared at the root, after the services block.
    if '\nvolumes:\n' not in compose:
        raise AssertionError('Compose file must declare persistent volumes')
    # Stop at the next top-level Compose key (e.g. build-time `secrets:`),
    # rather than counting secret definitions as persistent named volumes.
    section = compose.rsplit('\nvolumes:\n', 1)[1]
    section = re.split(r'\n(?=\S)', section, maxsplit=1)[0]
    return re.findall(r'(?m)^  ([\w.-]+):\s*$', section)


class ImageToolingTests(unittest.TestCase):
    def test_mcp_has_only_persistent_job_data(self):
        compose = MCP.read_text(encoding='utf-8')
        dockerfile = (ROOT / 'automation/docker/Dockerfile.mcp').read_text()
        startup = (ROOT / 'automation/mcp/start.sh').read_text()
        self.assertNotEqual(compose_project_name(compose),
                            compose_project_name(DEV.read_text(encoding='utf-8')))
        self.assertIn('  setup:', compose)
        self.assertIn('  mcp:', compose)
        self.assertIn('  - init', compose)
        self.assertIn('dockerfile: automation/docker/Dockerfile.mcp', compose)
        setup_mount = re.search(r'(?m)^      - ([\w.-]+):/volumes/jobs\s*$', compose)
        self.assertIsNotNone(setup_mount)
        jobs_volume = setup_mount.group(1)
        self.assertEqual([jobs_volume], named_volumes(compose))
        self.assertIn(f'{jobs_volume}:/var/lib/apex-blog/jobs', compose)
        self.assertIn('APEX_BLOG_MCP_SQLCL_PROFILE_DIR', compose)
        self.assertIn('target: /run/sqlcl-profile', compose)
        self.assertIn('read_only: true', compose)
        self.assertNotIn('APEX_BLOG_DEV_SQLCL_PROFILE_DIR', compose)
        self.assertNotIn('automation_venv:', compose)
        self.assertNotIn('automation_node_modules:', compose)
        self.assertNotIn('/workspace/.venv', compose)
        self.assertNotIn('/workspace/node_modules', compose)
        setup = compose.split('  setup:', 1)[1].split('\n  mcp:', 1)[0]
        self.assertNotIn('/workspace', setup)
        self.assertNotIn('/run/sqlcl-profile', setup)
        self.assertNotIn('depends_on:', compose.split('\n  mcp:', 1)[1])
        self.assertIn('FROM python:3.12-slim-bookworm', dockerfile)
        self.assertIn('install_image_dependencies.sh', dockerfile)
        self.assertIn('PRE_COMMIT_HOME=/opt/apex-blog/pre-commit-cache', dockerfile)
        self.assertIn('exec /usr/local/bin/python3 -m automation.mcp.run_service', startup)
        self.assertNotIn('ensure_dependencies.sh', startup)
        self.assertFalse((ROOT / 'automation/mcp/ensure_dependencies.sh').exists())

    def test_dev_has_microsoft_base_and_single_home_volume(self):
        compose = DEV.read_text(encoding='utf-8')
        dockerfile = (ROOT / 'automation/docker/Dockerfile.dev').read_text()
        config = json.loads((ROOT / '.devcontainer/devcontainer.json').read_text())
        self.assertNotEqual(compose_project_name(compose),
                            compose_project_name(MCP.read_text(encoding='utf-8')))
        self.assertIn('  dev:', compose)
        self.assertNotIn('  dev-volume-init:', compose)
        self.assertIn('dockerfile: automation/docker/Dockerfile.dev', compose)
        home_mount = re.search(r'(?m)^      - ([\w.-]+):/home/vscode\s*$', compose)
        self.assertIsNotNone(home_mount)
        self.assertEqual([home_mount.group(1)], named_volumes(compose))
        self.assertNotIn('venv_py314:', compose)
        self.assertNotIn('node_modules:', compose)
        self.assertNotIn('nocopy: true', compose)
        self.assertIn('network_mode: host', compose)
        self.assertIn('APEX_BLOG_DEV_SQLCL_PROFILE_DIR', compose)
        self.assertIn('target: /run/sqlcl-profile', compose)
        self.assertNotIn('APEX_BLOG_MCP_SQLCL_PROFILE_DIR', compose)
        self.assertIn('prepare_dev_sqlcl_profile.py', dockerfile)
        self.assertIn('FROM mcr.microsoft.com/devcontainers/base:ubuntu26.04', dockerfile)
        self.assertIn('ARG RUN_UID=1000', dockerfile)
        self.assertIn('ARG RUN_GID=1000', dockerfile)
        self.assertIn('usermod -o -u "$RUN_UID"', dockerfile)
        self.assertIn('groupmod -o -g "$RUN_GID"', dockerfile)
        self.assertIn('install_image_dependencies.sh', dockerfile)
        self.assertIn('USER vscode', dockerfile)
        self.assertIn('bash-completion', dockerfile)
        self.assertEqual('vscode', config['remoteUser'])
        self.assertNotIn('postStartCommand', config)
        self.assertFalse(config['updateRemoteUserUID'])

    def test_shared_image_installer_uses_pinned_inputs_and_prewarms_hooks(self):
        installer = (ROOT / 'automation/ci/install_image_dependencies.sh').read_text()
        self.assertIn('python3 -m venv "$root/venv"', installer)
        self.assertIn('npm ci --prefix "$root/npm"', installer)
        self.assertIn('ACTIONLINT_TARGET=', installer)
        self.assertIn('install-hooks', installer)
        self.assertIn('PRE_COMMIT_HOME=', installer)
        for name in ('Dockerfile.dev', 'Dockerfile.mcp'):
            dockerfile = (ROOT / 'automation/docker' / name).read_text()
            self.assertIn('COPY package.json package-lock.json /opt/apex-blog/npm/', dockerfile)
            self.assertIn('COPY .pre-commit-config.yaml', dockerfile)
            self.assertIn('NODE_PATH=/opt/apex-blog/npm/node_modules', dockerfile)
        self.assertTrue((ROOT / 'package-lock.json').is_file())

    def test_dev_image_includes_maintainer_tests_not_mcp_runtime(self):
        dev_image = (ROOT / 'automation/docker/Dockerfile.dev').read_text()
        mcp_image = (ROOT / 'automation/docker/Dockerfile.mcp').read_text()
        maintainer = (ROOT / 'automation/ci/requirements-maintainer.txt').read_text()
        mcp_sdk = (ROOT / 'automation/mcp/requirements.txt').read_text()
        self.assertIn('pytest==', maintainer)
        self.assertIn('mcp>=', mcp_sdk)
        self.assertIn('COPY automation/mcp/requirements.txt', dev_image)
        self.assertIn('COPY automation/ci/requirements-maintainer.txt', dev_image)
        self.assertIn('mcp-requirements.txt', dev_image)
        self.assertIn('maintainer-requirements.txt', dev_image)
        self.assertNotIn('requirements-maintainer.txt', mcp_image)
        self.assertNotIn('pytest', mcp_image)

    def test_image_bootstrap_does_not_install_dependencies(self):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            (root / 'automation/ci').mkdir(parents=True)
            shutil.copy2(ROOT / 'automation/ci/bootstrap.sh',
                         root / 'automation/ci/bootstrap.sh')
            env = dict(os.environ, APEX_BLOG_IMAGE_TOOLS='true')
            result = subprocess.run(['bash', 'automation/ci/bootstrap.sh', '--no-hooks'],
                                    cwd=root, env=env, capture_output=True, text=True)
            self.assertEqual(0, result.returncode, result.stderr)
            self.assertIn('no runtime installation', result.stderr)
            self.assertFalse((root / '.venv').exists())
            self.assertFalse((root / 'node_modules').exists())
            default_setup = subprocess.run(['bash', 'automation/ci/bootstrap.sh'],
                                           cwd=root, env=env, capture_output=True, text=True)
            self.assertEqual(0, default_setup.returncode, default_setup.stderr)
            self.assertIn('Skipping Git hook installation', default_setup.stderr)
            self.assertFalse((root / '.git').exists())
            reset = subprocess.run(['bash', 'automation/ci/bootstrap.sh', '--reset'],
                                   cwd=root, env=env, capture_output=True, text=True)
            self.assertEqual(2, reset.returncode)
            self.assertIn('rebuild the Docker image', reset.stderr)

    def test_local_tool_resolver_still_works_without_image(self):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            (root / 'automation/ci').mkdir(parents=True)
            (root / '.venv/bin').mkdir(parents=True)
            shutil.copy2(ROOT / 'automation/ci/run_tool.sh',
                         root / 'automation/ci/run_tool.sh')
            fake = root / '.venv/bin/ruff'
            fake.write_text('#!/bin/sh\nprintf "local:%s\\n" "$1"\n')
            fake.chmod(0o755)
            env = dict(os.environ)
            env.pop('APEX_BLOG_IMAGE_TOOLS', None)
            result = subprocess.run(['bash', 'automation/ci/run_tool.sh', 'ruff', 'check'],
                                    cwd=root, env=env, capture_output=True, text=True)
            self.assertEqual(0, result.returncode, result.stderr)
            self.assertEqual('local:check\n', result.stdout)

    def test_image_mode_never_runs_stale_checkout_tools(self):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            (root / 'automation/ci').mkdir(parents=True)
            (root / '.venv/bin').mkdir(parents=True)
            shutil.copy2(ROOT / 'automation/ci/run_tool.sh',
                         root / 'automation/ci/run_tool.sh')
            fake = root / '.venv/bin/ruff'
            fake.write_text('#!/bin/sh\necho UNSAFE_HOST_TOOL\n')
            fake.chmod(0o755)
            env = dict(os.environ, APEX_BLOG_IMAGE_TOOLS='true')
            # In a built Dev Container the image tool exists and must win;
            # on a host it is absent and image mode must fail closed. Both
            # environments must ignore a stale, bind-mounted checkout tool.
            result = subprocess.run(['bash', 'automation/ci/run_tool.sh',
                                     '--which', 'ruff'], cwd=root, env=env,
                                    capture_output=True, text=True)
            image_tool = Path('/opt/apex-blog/venv/bin/ruff')
            if os.access(image_tool, os.X_OK):
                self.assertEqual(0, result.returncode, result.stderr)
                self.assertEqual(str(image_tool), result.stdout.strip())
            else:
                self.assertNotEqual(0, result.returncode)
                self.assertIn('rebuild the container image', result.stderr)
            self.assertNotIn('UNSAFE_HOST_TOOL', result.stdout)
            self.assertNotIn(str(fake), result.stdout)

    def test_precommit_and_npm_hooks_use_shared_resolver(self):
        hooks = (ROOT / '.pre-commit-config.yaml').read_text(encoding='utf-8')
        package = json.loads((ROOT / 'package.json').read_text())
        self.assertIn('bash automation/ci/run_tool.sh ruff', hooks)
        self.assertIn('bash automation/ci/run_tool.sh sqlfluff', hooks)
        for name in ('lint:styles', 'lint:markdown', 'lint:format'):
            self.assertIn('bash automation/ci/run_tool.sh', package['scripts'][name])
        resolver = (ROOT / 'automation/ci/run_tool.sh').read_text()
        self.assertIn('--config-basedir /opt/apex-blog/npm', resolver)

    def test_environment_and_release_state_not_moved_into_images(self):
        compose = MCP.read_text(encoding='utf-8')
        self.assertIn('APEX_BLOG_MCP_SQLCL_PROFILE_DIR', compose)
        self.assertNotIn('APEX_BLOG_DEV_SQLCL_PROFILE_DIR', compose)
        self.assertEqual(1, len(named_volumes(compose)))
        self.assertIn('/var/lib/apex-blog/jobs', compose)
        env = (ROOT / '.env.example').read_text()
        self.assertIn('APEX_BLOG_DEV_SQLCL_PROFILE_DIR=', env)
        self.assertIn('APEX_BLOG_MCP_SQLCL_PROFILE_DIR=', env)
        self.assertNotIn('\nSQLCL_PROFILE_DIR=', env)
        self.assertIn('docker-compose.mcp.yml', env)


if __name__ == '__main__':
    unittest.main()
