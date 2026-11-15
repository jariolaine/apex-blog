"""Offline contract tests for MCP's durable worker (never runs real Make targets)."""

import os
from pathlib import Path
import tempfile
import threading
import time
import unittest
from unittest.mock import patch

from automation.mcp.jobs import ALLOWED_TARGETS, JobStore
from automation.mcp import worker


class MCPJobTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.store = JobStore(self.root / 'jobs')

    def test_allowlist_rejects_shell_and_production(self):
        for target in ('production', 'qa', 'build', 'hotfix-production',
                       'source; echo hello', '--eval', 'sync-dev RELEASE_DIR=foo'):
            with self.subTest(target=target), self.assertRaises(ValueError):
                self.store.submit(target)
        self.assertIn('source', ALLOWED_TARGETS)

    def test_dev_and_test_queue_immediately(self):
        for target in ('sync-dev', 'test-release', 'test-upgrade',
                       'test-install', 'test-deinstall'):
            with self.subTest(target=target):
                job = self.store.submit(target)
                self.assertEqual(job['state'], 'queued')
                self.assertNotIn('approval_required', job)
                self.assertEqual(self.store.claim_next()['id'], job['id'])

    def test_legacy_pending_jobs_are_cancelled_without_execution(self):
        old = self.store.submit('sync-dev')
        queued = self.store.submit('doctor')
        with self.store.connect() as connection:
            # Old SQLite databases had an approved_by column. It must not
            # prevent startup after the new schema drops that column.
            connection.execute('ALTER TABLE jobs ADD COLUMN approved_by TEXT')
            connection.execute("UPDATE jobs SET state = 'awaiting_approval' WHERE id = ?",
                               (old['id'],))
        reopened = JobStore(self.store.directory)
        previous = reopened.get(old['id'])
        self.assertEqual(previous['state'], 'cancelled')
        self.assertIn('resubmit explicitly', previous['note'])
        self.assertIsNotNone(previous['finished_at'])
        self.assertEqual(reopened.claim_next()['id'], queued['id'])
        # A new request is a regular job, not silently revived old work.
        new = reopened.submit('sync-dev')
        self.assertEqual(new['state'], 'queued')
        self.assertEqual(reopened.claim_next()['id'], new['id'])

    def test_worker_executes_database_target_without_mcp_approval(self):
        fake_make = self.root / 'fake-make'
        fake_make.write_text('#!/bin/sh\nprintf "[apex-blog] %s\n" "$2"\nexit 0\n')
        fake_make.chmod(0o755)
        job = self.store.submit('sync-dev')
        with patch.object(worker, 'REPO_ROOT', self.root):
            self.assertTrue(worker.process_next(self.store, str(fake_make)))
        result = self.store.result(job['id'])
        self.assertEqual(result['state'], 'succeeded')
        self.assertEqual(result['exit_code'], 0)
        self.assertIn('sync-dev', result['log_tail'])

    def test_log_chunks_and_path_validation(self):
        job = self.store.submit('doctor')
        path = self.store.job_dir(job['id']) / 'output.log'
        path.write_text('hello world', encoding='utf-8')
        part = self.store.logs(job['id'], 0, 5)
        self.assertEqual(part['text'], 'hello')
        self.assertEqual(self.store.logs(job['id'], part['next_offset'], 6)['text'], ' world')
        with self.assertRaises(ValueError):
            self.store.logs('../not-a-job')
        with self.assertRaises(ValueError):
            self.store.logs(job['id'], max_bytes=1000000)

    def test_sqlcl_log_filenames_are_allowlisted(self):
        job = self.store.submit('validate')
        directory = self.store.job_dir(job['id']) / 'sqlcl'
        directory.mkdir()
        (directory / 'validate-0.log.12345678').write_text('diagnostic', encoding='utf-8')
        self.assertEqual(self.store.sqlcl_files(job['id']), ['validate-0.log.12345678'])
        result = self.store.sqlcl_logs(job['id'], 'validate-0.log.12345678', 0, 4)
        self.assertEqual(result['text'], 'diag')
        with self.assertRaises(ValueError):
            self.store.sqlcl_logs(job['id'], '../../jobs.sqlite3')

    def test_worker_records_output_and_success(self):
        fake_make = self.root / 'fake-make'
        fake_make.write_text('#!/bin/sh\necho "[apex-blog] Preflight: lint"\nexit 0\n')
        fake_make.chmod(0o755)
        job = self.store.submit('check')
        with patch.object(worker, 'REPO_ROOT', self.root):
            self.assertTrue(worker.process_next(self.store, str(fake_make)))
        result = self.store.result(job['id'])
        self.assertEqual(result['state'], 'succeeded')
        self.assertEqual(result['exit_code'], 0)
        self.assertIn('Preflight: lint', result['log_tail'])
        self.assertEqual(result['last_stage'], '[MCP job] succeeded, exit_code=0')
        self.assertTrue((self.store.job_dir(job['id']) / 'sqlcl').is_dir())

    def test_worker_records_nonzero_exit(self):
        fake_make = self.root / 'fake-make'
        fake_make.write_text('#!/bin/sh\necho "[apex-blog] ERROR: failed"\nexit 7\n')
        fake_make.chmod(0o755)
        job = self.store.submit('test')
        with patch.object(worker, 'REPO_ROOT', self.root):
            worker.process_next(self.store, str(fake_make))
        self.assertEqual(self.store.get(job['id'])['state'], 'failed')
        self.assertEqual(self.store.get(job['id'])['exit_code'], 7)

    def test_cancel_offline_only_and_restart_is_not_retry(self):
        offline = self.store.submit('test-fast')
        self.assertEqual(self.store.request_cancel(offline['id'])['state'], 'cancelled')
        self.assertIsNone(self.store.claim_next())
        protected = self.store.submit('test-release')
        with self.assertRaises(ValueError):
            self.store.request_cancel(protected['id'])
        self.assertEqual(self.store.claim_next()['id'], protected['id'])
        self.store.recover_interrupted()
        self.assertEqual(self.store.get(protected['id'])['state'], 'interrupted')
        self.assertIsNone(self.store.claim_next())

    def test_running_offline_process_can_be_cancelled(self):
        fake_make = self.root / 'fake-make'
        fake_make.write_text('#!/bin/sh\necho "[apex-blog] running"\nsleep 30\n')
        fake_make.chmod(0o755)
        job = self.store.submit('test-fast')
        with patch.object(worker, 'REPO_ROOT', self.root):
            thread = threading.Thread(
                target=worker.process_next, args=(self.store, str(fake_make)),
            )
            thread.start()
            for _ in range(100):
                if self.store.get(job['id'])['pid'] is not None:
                    break
                time.sleep(0.02)
            self.assertIsNotNone(self.store.get(job['id'])['pid'])
            self.store.request_cancel(job['id'])
            thread.join(timeout=5)
            self.assertFalse(thread.is_alive())
            self.assertEqual(self.store.get(job['id'])['state'], 'cancelled')

    def test_retain_sqlcl_logs_outside_temporary_run_dir(self):
        import subprocess

        source_log = self.root / 'transient.log'
        source_log.write_text('SQLcl output', encoding='utf-8')
        persistent = self.root / 'sqlcl'
        env = os.environ.copy()
        env['AUTOMATION_SQLCL_LOG_DIR'] = str(persistent)
        command = (
            'set -Eeuo pipefail; '
            'source automation/lib/common.sh; '
            'persist_sqlcl_log "$1"'
        )
        subprocess.run(
            ['bash', '-c', command, '_', str(source_log)],
            cwd=Path(__file__).resolve().parents[2], env=env, check=True,
        )
        source_log.unlink()
        saved = list(persistent.iterdir())
        self.assertEqual(len(saved), 1)
        self.assertEqual(saved[0].read_text(encoding='utf-8'), 'SQLcl output')


if __name__ == '__main__':
    unittest.main()
