"""Offline contracts for optional ADB wallet mounts and private CA trust.

No database, Docker daemon, real wallet or external certificate authority is
needed. The runtime test creates a throwaway self-signed public test root.
"""

import json
import os
from pathlib import Path
import shutil
import stat
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
DOCKER = ROOT / 'automation/docker'


class OracleContainerTrustTests(unittest.TestCase):
    def test_single_dev_compose_and_optional_mcp_mounts_are_read_only(self):
        dev = (DOCKER / 'docker-compose.dev.yml').read_text()
        mcp = (DOCKER / 'docker-compose.mcp.yml').read_text()
        for service, compose in (('dev', dev), ('mcp', mcp)):
            with self.subTest(service=service):
                self.assertIn('APEX_BLOG_EXTERNAL_DIR', compose)
                self.assertIn('target: /run/apex-blog/external', compose)
                self.assertIn('read_only: true', compose)
                self.assertIn('create_host_path: false', compose)
                self.assertIn('APEX_BLOG_CUSTOM_CA_DIR', compose)
                for variable in ('SSL_CERT_FILE', 'REQUESTS_CA_BUNDLE',
                                 'NODE_EXTRA_CA_CERTS', 'JAVA_TOOL_OPTIONS'):
                    self.assertIn(variable, compose)
        # Never attach wallet/CA files to the MCP ownership initializer.
        setup = mcp.split('  setup:', 1)[1].split('\n  mcp:', 1)[0]
        self.assertNotIn('APEX_BLOG_EXTERNAL_DIR', setup)
        self.assertNotIn('APEX_BLOG_CUSTOM_CA_DIR', setup)
        self.assertNotIn('/run/apex-blog/external', setup)
        self.assertNotIn('/run/sqlcl-profile', setup)
        self.assertIn('${APEX_BLOG_EXTERNAL_DIR:-./placeholders/empty-external}',
                      mcp)
        self.assertFalse((DOCKER / 'docker-compose.external.mcp.yml').exists())
        self.assertIn('${APEX_BLOG_EXTERNAL_DIR:-./placeholders/empty-external}',
                      dev)
        self.assertFalse((DOCKER / 'docker-compose.external.dev.yml').exists())

    def test_optional_build_ca_is_buildkit_secret_and_wallet_is_not_in_image(self):
        dev = (DOCKER / 'docker-compose.dev.yml').read_text()
        mcp = (DOCKER / 'docker-compose.mcp.yml').read_text()
        for service, compose in (('dev', dev), ('mcp', mcp)):
            with self.subTest(service=service):
                dockerfile = (DOCKER / f'Dockerfile.{service}').read_text()
                self.assertIn('APEX_BLOG_BUILD_CA_BUNDLE', compose)
                self.assertIn('secrets:', compose)
                self.assertNotIn('wallet', dockerfile.lower())
                self.assertIn('RUN --mount=type=secret,id=apex_blog_build_ca', dockerfile)
                self.assertLess(dockerfile.index('sh /tmp/install_build_ca.sh'),
                                dockerfile.index('RUN apt-get update'))
                self.assertIn('keytool" -importcert', dockerfile)
                self.assertIn('COPY automation/docker/prepare_trust.sh', dockerfile)
        self.assertFalse((DOCKER / 'docker-compose.build-ca.mcp.yml').exists())
        self.assertIn('${APEX_BLOG_BUILD_CA_BUNDLE:-./placeholders/empty-build-ca.pem}', mcp)
        self.assertIn('${APEX_BLOG_BUILD_CA_BUNDLE:-./placeholders/empty-build-ca.pem}',
                      dev)
        self.assertFalse((DOCKER / 'docker-compose.build-ca.dev.yml').exists())
        self.assertIn('bash /usr/local/lib/apex-blog/prepare_trust.sh',
                      (ROOT / 'automation/mcp/start.sh').read_text())
        dockerignore = (ROOT / '.dockerignore').read_text()
        self.assertIn('Wallet_*.zip', dockerignore)
        self.assertIn('ewallet.p12', dockerignore)

    def test_one_standard_dev_container_supports_optional_trust(self):
        container_dir = ROOT / '.devcontainer'
        configs = list(container_dir.rglob('devcontainer.json'))
        self.assertEqual([container_dir / 'devcontainer.json'], configs)
        config = json.loads(configs[0].read_text())
        self.assertEqual('../automation/docker/docker-compose.dev.yml',
                         config['dockerComposeFile'])
        self.assertEqual('dev', config['service'])
        self.assertEqual('vscode', config['remoteUser'])
        self.assertEqual(['bash',
                          '${localWorkspaceFolder}/automation/docker/ensure_compose_env.sh'],
                         config['initializeCommand'])
        # VS Code configuration lives in .devcontainer; Docker fallbacks do not.
        self.assertFalse((container_dir / 'empty-external').exists())
        self.assertFalse((container_dir / 'empty-sqlcl-profile').exists())
        self.assertFalse((container_dir / 'empty-build-ca.pem').exists())
        placeholders = DOCKER / 'placeholders'
        for relative in ('empty-external/.gitkeep',
                         'empty-sqlcl-profile/.gitkeep',
                         'empty-build-ca.pem'):
            with self.subTest(placeholder=relative):
                path = placeholders / relative
                self.assertTrue(path.is_file())
                self.assertEqual(b'', path.read_bytes())

    def test_compose_fallbacks_resolve_to_tracked_docker_placeholders(self):
        # Compose resolves relative bind/secret sources from the Compose file
        # directory. None of these paths should point into .devcontainer/.
        fallbacks = {
            'APEX_BLOG_EXTERNAL_DIR': 'placeholders/empty-external',
            'APEX_BLOG_DEV_SQLCL_PROFILE_DIR': 'placeholders/empty-sqlcl-profile',
            'APEX_BLOG_BUILD_CA_BUNDLE': 'placeholders/empty-build-ca.pem',
        }
        for name in ('docker-compose.dev.yml', 'docker-compose.mcp.yml'):
            compose = (DOCKER / name).read_text()
            self.assertNotIn('.devcontainer/empty-', compose)
            for env, relative in fallbacks.items():
                if env == 'APEX_BLOG_DEV_SQLCL_PROFILE_DIR' and name != 'docker-compose.dev.yml':
                    continue
                with self.subTest(compose=name, variable=env):
                    self.assertIn('${' + env + ':-./' + relative + '}', compose)
                    expected = DOCKER / relative
                    self.assertTrue(expected.is_dir() if env != 'APEX_BLOG_BUILD_CA_BUNDLE'
                                    else expected.is_file())

    def test_build_time_ca_installer_splits_bundle_without_real_trust_changes(self):
        # Substitute temp paths and a fake update-ca-certificates executable
        # rather than changing the test host's trusted root store.
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            source = root / 'roots.pem'
            destination = root / 'ca'
            binary = root / 'bin'
            binary.mkdir()
            update = binary / 'update-ca-certificates'
            update.write_text('#!/bin/sh\nexit 0\n')
            update.chmod(0o755)
            build_script = (DOCKER / 'install_build_ca.sh').read_text()
            build_script = build_script.replace(
                '/run/secrets/apex_blog_build_ca', str(source))
            build_script = build_script.replace(
                '/usr/local/share/ca-certificates', str(destination))
            patched = root / 'install.sh'
            patched.write_text(build_script)
            # Two PEM blocks with Windows line endings exercise splitting.
            source.write_bytes((
                '-----BEGIN CERTIFICATE-----\r\nYQ==\r\n'
                '-----END CERTIFICATE-----\r\n'
                '-----BEGIN CERTIFICATE-----\r\nYg==\r\n'
                '-----END CERTIFICATE-----\r\n').encode())
            env = dict(os.environ, PATH=f'{binary}:{os.environ.get("PATH", "")}')
            result = subprocess.run(['sh', str(patched)], env=env,
                                    capture_output=True, text=True, timeout=10)
            self.assertEqual(0, result.returncode, result.stderr)
            roots = sorted(destination.glob('apex-blog-build-*.crt'))
            self.assertEqual(2, len(roots))
            self.assertTrue(all('\r' not in f.read_text() for f in roots))
            self.assertIn('YQ==', roots[0].read_text())
            self.assertIn('Yg==', roots[1].read_text())
            source.write_text('not PEM\n')
            failed = subprocess.run(['sh', str(patched)], env=env,
                                    capture_output=True, text=True, timeout=10)
            self.assertNotEqual(0, failed.returncode)

    def test_trust_script_noop_without_optional_mount(self):
        with tempfile.TemporaryDirectory() as td:
            env = dict(os.environ, APEX_BLOG_TRUST_DIR=str(Path(td) / 'unused'))
            env.pop('APEX_BLOG_CUSTOM_CA_DIR', None)
            result = subprocess.run(['bash', str(DOCKER / 'prepare_trust.sh')],
                                    env=env, capture_output=True, text=True, timeout=10)
            self.assertEqual(0, result.returncode, result.stderr)
            self.assertFalse((Path(td) / 'unused').exists())

    def test_wallet_only_mount_does_not_require_certificates_folder(self):
        java_home = self._java_home()
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / 'wallet').mkdir()
            env = dict(os.environ,
                       APEX_BLOG_CUSTOM_CA_DIR=str(root / 'certificates'),
                       APEX_BLOG_TRUST_DIR=str(root / 'trust'),
                       JAVA_HOME=str(java_home))
            result = subprocess.run(['bash', str(DOCKER / 'prepare_trust.sh')],
                                    env=env, capture_output=True, text=True, timeout=20)
            self.assertEqual(0, result.returncode, result.stderr)
            self.assertIn('0 additional CA', result.stderr)
            self.assertTrue((root / 'trust/ca-bundle.pem').is_file())
            self.assertTrue((root / 'trust/cacerts').is_file())

    def test_invalid_certificate_stops_startup(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            certs = root / 'certificates'
            certs.mkdir()
            (certs / 'bad.crt').write_text('not a root CA\n')
            java_home = self._java_home()
            env = dict(os.environ, APEX_BLOG_CUSTOM_CA_DIR=str(certs),
                       APEX_BLOG_TRUST_DIR=str(root / 'trust'), JAVA_HOME=str(java_home))
            result = subprocess.run(['bash', str(DOCKER / 'prepare_trust.sh')],
                                    env=env, capture_output=True, text=True, timeout=15)
            self.assertNotEqual(0, result.returncode)
            self.assertIn('Expected one PEM certificate', result.stderr)
            self.assertFalse((root / 'trust/ca-bundle.pem').exists())

    def test_private_key_in_certificate_file_is_rejected(self):
        java_home = self._java_home()
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            cert_dir = root / 'certificates'
            cert_dir.mkdir()
            # Assemble a deliberately invalid key-shaped fixture at runtime.
            # Do not embed a complete PEM private-key header in tracked source:
            # pre-commit's detect-private-key hook correctly rejects those.
            pem_type = 'PRIVATE KEY'
            (cert_dir / 'not-a-ca.pem').write_text(
                f'-----BEGIN {pem_type}-----\nAAAA\n-----END {pem_type}-----\n')
            env = dict(os.environ, APEX_BLOG_CUSTOM_CA_DIR=str(cert_dir),
                       APEX_BLOG_TRUST_DIR=str(root / 'trust'), JAVA_HOME=str(java_home))
            result = subprocess.run(['bash', str(DOCKER / 'prepare_trust.sh')],
                                    env=env, capture_output=True, text=True, timeout=10)
            self.assertNotEqual(0, result.returncode)
            self.assertIn('must not contain a private key', result.stderr)

    def test_runtime_trust_adds_root_to_system_and_java_bundles(self):
        java_home = self._java_home()
        keytool = java_home / 'bin/keytool'
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            cert_dir = root / 'certificates'
            cert_dir.mkdir()
            temp_keystore = root / 'test-root.p12'
            public_root = cert_dir / 'company-root.crt'
            subprocess.run([
                str(keytool), '-genkeypair', '-alias', 'test-root',
                '-keyalg', 'RSA', '-keysize', '2048', '-validity', '1',
                '-dname', 'CN=Temporary Test Root CA', '-ext', 'BC=ca:true',
                '-storetype', 'PKCS12', '-keystore', str(temp_keystore),
                '-storepass', 'temporary-password', '-keypass', 'temporary-password',
                '-noprompt'
            ], check=True, capture_output=True, timeout=40)
            subprocess.run([
                str(keytool), '-exportcert', '-rfc', '-alias', 'test-root',
                '-keystore', str(temp_keystore), '-storepass', 'temporary-password',
                '-file', str(public_root)
            ], check=True, capture_output=True, timeout=20)
            # Our Dockerfiles mark the entire Oracle JDK read-only. Recreate
            # that source layout and make the keytool shim enforce normal
            # non-root write permissions even if this suite runs as root.
            readonly_jdk = root / 'read-only-jdk'
            (readonly_jdk / 'bin').mkdir(parents=True)
            (readonly_jdk / 'lib/security').mkdir(parents=True)
            readonly_cacerts = readonly_jdk / 'lib/security/cacerts'
            shutil.copyfile(java_home / 'lib/security/cacerts', readonly_cacerts)
            readonly_cacerts.chmod(0o400)
            shim = readonly_jdk / 'bin/keytool'
            shim.write_text(
                '#!/usr/bin/env python3\n'
                'import os, stat, sys\n'
                'args = sys.argv[1:]\n'
                'if "-importcert" in args:\n'
                '    store = args[args.index("-keystore") + 1]\n'
                '    if not (os.stat(store).st_mode & stat.S_IWUSR):\n'
                '        print("Temporary JDK truststore is read-only", file=sys.stderr)\n'
                '        sys.exit(9)\n'
                f'os.execv({str(keytool)!r}, [{str(keytool)!r}, *args])\n'
            )
            shim.chmod(0o755)
            self.assertFalse(readonly_cacerts.stat().st_mode & stat.S_IWUSR)
            env = dict(os.environ, APEX_BLOG_CUSTOM_CA_DIR=str(cert_dir),
                       APEX_BLOG_TRUST_DIR=str(root / 'trust'), JAVA_HOME=str(readonly_jdk))
            result = subprocess.run(['bash', str(DOCKER / 'prepare_trust.sh')],
                                    env=env, capture_output=True, text=True, timeout=30)
            self.assertEqual(0, result.returncode, result.stderr)
            self.assertIn('1 additional CA', result.stderr)
            bundle = (root / 'trust/ca-bundle.pem').read_text()
            self.assertIn('-----BEGIN CERTIFICATE-----', bundle)
            self.assertIn(public_root.read_text().strip(), bundle)
            self.assertGreater(len(bundle), len(public_root.read_text()))
            imported = subprocess.run([
                str(keytool), '-list', '-alias', 'apex-blog-runtime-0001',
                '-keystore', str(root / 'trust/cacerts'), '-storepass', 'changeit'
            ], capture_output=True, text=True, timeout=20)
            self.assertEqual(0, imported.returncode, imported.stderr)
            self.assertIn('trustedCertEntry', imported.stdout)
            self.assertEqual(0o600, stat.S_IMODE((root / 'trust/cacerts').stat().st_mode))
            self.assertEqual([], list((root / 'trust').glob('.stage.*')))

    def _java_home(self):
        keytool = shutil.which('keytool')
        if not keytool:
            self.skipTest('keytool unavailable outside a Java-capable image')
        home = Path(keytool).resolve().parent.parent
        if not (home / 'lib/security/cacerts').is_file():
            self.skipTest('JDK CA keystore unavailable in this environment')
        return home


if __name__ == '__main__':
    unittest.main()
