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
        for target in ('sync-dev', 'pretest', 'test-release'):
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

    def test_pretest_option_persists_and_worker_passes_only_validated_make_argument(self):
        fake_make = self.root / 'fake-make'
        fake_make.write_text('#!/bin/sh\nprintf "%s\n" "$@"\n', encoding='utf-8')
        fake_make.chmod(0o755)
        job = self.store.submit('pretest', test='upgrade')
        self.assertEqual(self.store.get(job['id'])['test_selection'], 'upgrade')
        reopened = JobStore(self.store.directory)
        with patch.object(worker, 'REPO_ROOT', self.root):
            worker.process_next(reopened, str(fake_make))
        self.assertIn('TEST=upgrade', reopened.result(job['id'])['log_tail'])
        default = reopened.submit('pretest')
        with patch.object(worker, 'REPO_ROOT', self.root):
            worker.process_next(reopened, str(fake_make))
        self.assertNotIn('TEST=', reopened.result(default['id'])['log_tail'])
        for target, selected in (('check', 'install'), ('pretest', 'all'),
                                 ('pretest', 'upgrade; id'), ('pretest', 7)):
            with self.subTest(target=target, selected=selected), self.assertRaises(ValueError):
                reopened.submit(target, test=selected)

    def test_old_jobs_schema_migrates_and_retired_targets_are_cancelled(self):
        # Simulate a database created before the test selector existed.
        with self.store.connect() as connection:
            connection.execute('ALTER TABLE jobs RENAME TO newer_jobs')
            connection.execute("""CREATE TABLE jobs (
                id TEXT PRIMARY KEY, target TEXT NOT NULL, state TEXT NOT NULL,
                submitted_at REAL NOT NULL, started_at REAL, finished_at REAL,
                updated_at REAL NOT NULL, exit_code INTEGER, pid INTEGER,
                cancel_requested INTEGER NOT NULL DEFAULT 0, note TEXT
            )""")
            connection.execute("""INSERT INTO jobs (id,target,state,submitted_at,updated_at)
                                  VALUES ('aaaaaaaaaaaaaaaaaaaaaaaa','test-upgrade','queued',1,1)""")
            connection.execute('DROP TABLE newer_jobs')
        reopened = JobStore(self.store.directory)
        self.assertEqual(reopened.get('aaaaaaaaaaaaaaaaaaaaaaaa')['state'], 'cancelled')
        self.assertIsNone(reopened.get('aaaaaaaaaaaaaaaaaaaaaaaa')['test_selection'])
        with self.assertRaises(ValueError):
            reopened.submit('test-upgrade')

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
        offline = self.store.submit('test')
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
        job = self.store.submit('test')
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
