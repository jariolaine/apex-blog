"""Official GitHub release selection and verification (fully offline mock API)."""
import subprocess
import sys

from automation.tests.workflow_fixture import WorkflowFixture


class GithubPreviousReleaseTests(WorkflowFixture):
    needs_dev_snapshot = False

    def resolve(self, *, equal=False, ok=True):
        output = self.root / 'verified-previous'
        command = [
            sys.executable,
            str(self.repo / 'automation/lib/fetch_previous_release.py'),
            '--candidate-version-file', str(self.repo / 'VERSION.txt'),
            '--output-dir', str(output),
        ]
        if equal:
            command.append('--allow-equal-version')
        result = subprocess.run(command, env=self.env, cwd=self.root,
                                capture_output=True, text=True, timeout=20)
        if ok:
            self.assertEqual(result.returncode, 0, result.stderr)
        else:
            self.assertNotEqual(result.returncode, 0)
            self.assertFalse(output.exists() and any(output.iterdir()),
                             'Unverified GitHub content must not be published')
        return result, output

    def test_published_tag_on_master_with_digest(self):
        result, output = self.resolve()
        self.assertIn('Official GitHub release:', result.stderr)
        self.assertEqual((output / 'VERSION.txt').read_text().strip(), self.older_version())
        self.assertEqual(len([p for p in output.glob('*.sql')]), 2)
        calls = self.github_calls()
        self.assertTrue(any('/releases/latest' in url for url in calls))
        self.assertTrue(any('/commits/' in url for url in calls))
        self.assertTrue(any('/compare/' in url for url in calls))
        self.assertTrue(any(url.endswith('/apex-blog-latest.zip') for url in calls))

    def test_legacy_published_zip_without_version_gets_verified_tag_version(self):
        self.github_release(self.older_version(), include_version=False)
        _, output = self.resolve()
        self.assertEqual((output / 'VERSION.txt').read_text().strip(), self.older_version())

    def test_published_sha256sums_is_valid_fallback(self):
        self.env['MOCK_GITHUB_NO_DIGEST'] = '1'
        self.env['MOCK_GITHUB_WITH_SUMS'] = '1'
        _, output = self.resolve()
        self.assertTrue((output / 'VERSION.txt').exists())
        self.assertTrue(any(url.endswith('/SHA256SUMS') for url in self.github_calls()))

    def test_digest_mismatch_fails_before_extracting(self):
        self.env['MOCK_GITHUB_DIGEST_OVERRIDE'] = '0' * 64
        result, _ = self.resolve(ok=False)
        self.assertIn('SHA-256 checksum mismatch', result.stderr)

    def test_historical_release_without_published_sha256_accepted_by_default(self):
        self.env['MOCK_GITHUB_NO_DIGEST'] = '1'
        result, output = self.resolve()
        self.assertIn('WARNING:', result.stderr)
        self.assertIn('checksum=unverified', result.stderr)
        self.assertEqual((output / 'VERSION.txt').read_text().strip(), self.older_version())
        self.assertFalse(any(url.endswith('/SHA256SUMS') for url in self.github_calls()))

    def test_actual_2024_style_release_has_no_digest_and_no_embedded_version(self):
        self.github_release('Release 24.1.0.20240714', include_version=False)
        self.env['MOCK_GITHUB_NO_DIGEST'] = '1'
        result, output = self.resolve()
        self.assertIn('checksum=unverified', result.stderr)
        self.assertEqual((output / 'VERSION.txt').read_text().strip(),
                         'Release 24.1.0.20240714')

    def test_strict_policy_rejects_historical_release_without_published_checksum(self):
        self.env['MOCK_GITHUB_NO_DIGEST'] = '1'
        self.env['APEX_BLOG_REQUIRE_GITHUB_SHA256'] = 'YES'
        result, _ = self.resolve(ok=False)
        self.assertIn('lacks SHA-256', result.stderr)

    def test_invalid_policy_fails_closed(self):
        self.env['APEX_BLOG_REQUIRE_GITHUB_SHA256'] = 'MAYBE'
        result, _ = self.resolve(ok=False)
        self.assertIn('must be YES or NO', result.stderr)

    def test_strict_policy_accepts_published_digest(self):
        self.env['APEX_BLOG_REQUIRE_GITHUB_SHA256'] = 'YES'
        result, _ = self.resolve()
        self.assertIn('checksum=verified', result.stderr)

    def test_strict_policy_accepts_sidecar_sha256sums(self):
        self.env['APEX_BLOG_REQUIRE_GITHUB_SHA256'] = 'YES'
        self.env['MOCK_GITHUB_NO_DIGEST'] = '1'
        self.env['MOCK_GITHUB_WITH_SUMS'] = '1'
        self.resolve()

    def test_tag_must_be_reachable_from_master(self):
        self.env['MOCK_GITHUB_COMPARE_STATUS'] = 'diverged'
        result, _ = self.resolve(ok=False)
        self.assertIn('not an ancestor of master', result.stderr)

    def test_no_draft_prerelease_or_missing_asset(self):
        for key in ('MOCK_GITHUB_DRAFT', 'MOCK_GITHUB_PRERELEASE', 'MOCK_GITHUB_NO_ASSET'):
            with self.subTest(key=key):
                self.env[key] = '1'
                self.resolve(ok=False)
                del self.env[key]

    def test_rejects_asset_url_outside_official_release(self):
        self.env['MOCK_GITHUB_ASSET_URL'] = 'https://attacker.example/untrusted.zip'
        result, _ = self.resolve(ok=False)
        self.assertIn('Untrusted GitHub download URL', result.stderr)

    def test_rejects_tag_zip_version_mismatch(self):
        self.previous_zip(self.root / 'official-github-release.zip',
                          (self.repo / 'VERSION.txt').read_text().strip())
        result, _ = self.resolve(ok=False)
        self.assertIn('version disagrees', result.stderr)

    def test_formal_older_only_pretest_can_accept_equal(self):
        self.github_release((self.repo / 'VERSION.txt').read_text().strip())
        self.resolve(ok=False)
        self.resolve(equal=True)

    def test_unavailable_github_never_uses_a_local_fallback(self):
        self.env['MOCK_GITHUB_HTTP_FAIL'] = '1'
        result, _ = self.resolve(ok=False)
        self.assertIn('GitHub release request failed', result.stderr)
