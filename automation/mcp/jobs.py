"""Durable, allowlisted automation jobs; only pretest has a validated option."""

from __future__ import annotations

import asyncio
from contextlib import contextmanager
from dataclasses import asdict, dataclass
import os
from pathlib import Path
import re
import sqlite3
import time
import uuid
from typing import Literal

REPO_ROOT = Path(__file__).resolve().parents[2]
DEFAULT_JOB_DIR = Path(os.environ.get('AUTOMATION_JOB_DIR', '/var/lib/apex-blog/jobs'))

# This registry is the single source of truth for the MCP allowlist and its
# discoverable metadata. Make/scripts remain authoritative for execution and
# their actual environment preflight checks. Keep this list intentionally narrow.
@dataclass(frozen=True)
class TargetSpec:
    description: str
    category: Literal['offline', 'source', 'generation', 'database'] = 'offline'
    database_effect: Literal['none', 'read_dev', 'write_dev', 'reset_test'] = 'none'
    local_source_effect: Literal['none', 'may_overwrite_apx', 'generated_assets'] = 'none'
    authorization: Literal['none', 'before_overwriting_uncommitted_changes',
                           'required'] = 'none'


def _database_target(description: str, effect: Literal['write_dev', 'reset_test']) -> TargetSpec:
    # Dedicated TEST is explicitly disposable and does not need an approval
    # prompt. DEV writes and promotions retain their separate authorization.
    return TargetSpec(description, category='database', database_effect=effect,
                      authorization='none' if effect == 'reset_test' else 'required')


TARGET_SPECS: dict[str, TargetSpec] = {
    'lint': TargetSpec('Check repository formatting and lint rules.'),
    'assets': TargetSpec(
        'Generate application CSS/JS from frontend/; writes application static files.',
        category='generation', local_source_effect='generated_assets',
    ),
    'check-assets': TargetSpec('Check generated application CSS/JS matches frontend sources without changing files.'),
    'test': TargetSpec('Run application tests.'),
    'check-schema': TargetSpec('Check database source lists, installation metadata, and deinstall SQL.'),
    'check-source': TargetSpec('Check references in local APEXLang source.'),
    'validate': TargetSpec('Validate local APEXLang without a database connection.'),
    'check': TargetSpec('Run the full set of local project quality checks.'),
    'source': TargetSpec(
        'Export DEV APEXLang into applications/; may overwrite local .apx edits.',
        category='source', database_effect='read_dev',
        local_source_effect='may_overwrite_apx',
        authorization='before_overwriting_uncommitted_changes',
    ),
    'sync-dev': _database_target('Import local APEXLang application definitions into DEV.',
                                 'write_dev'),
    'pretest': _database_target(
        'Test current DEV applications on disposable TEST; resets TEST objects and data. No release candidate.',
        'reset_test'),
    'test-release': _database_target('Test a saved release candidate on disposable TEST; resets TEST objects and data.',
                                     'reset_test'),
}

OFFLINE_TARGETS = frozenset(name for name, spec in TARGET_SPECS.items()
                            if spec.category == 'offline')
SOURCE_TARGETS = frozenset(name for name, spec in TARGET_SPECS.items()
                           if spec.category == 'source')
DATABASE_TARGETS = frozenset(name for name, spec in TARGET_SPECS.items()
                             if spec.category == 'database')
ALLOWED_TARGETS = frozenset(TARGET_SPECS)


def capabilities() -> dict:
    """Return public metadata for MCP clients, without creating a job."""
    targets = []
    for name, spec in sorted(TARGET_SPECS.items()):
        details = asdict(spec)
        details.update({
            'name': name,
            'cancellable': name in OFFLINE_TARGETS,
            'modifies_database': spec.database_effect in ('write_dev', 'reset_test'),
            'modifies_local_source': spec.local_source_effect != 'none',
        })
        if name == 'pretest':
            details['allowed_test_values'] = sorted(PRETEST_SELECTIONS)
        targets.append(details)
    return {
        'targets': targets,
        'authorization_enforced_by_mcp': False,
        'authorization_policy': 'Follow AGENTS.md for DEV writes and local source overwrites; disposable TEST resets are preauthorized.',
        'terminal_states': sorted(FINISHED),
        'active_states': ['queued', 'running'],
    }


PRETEST_SELECTIONS = frozenset({'install', 'upgrade', 'deinstall'})
JOB_ID = re.compile(r'^[0-9a-f]{24}$')
FINISHED = frozenset({'succeeded', 'failed', 'cancelled', 'interrupted'})
DEFAULT_START_WAIT_SECONDS = 30
MAX_START_WAIT_SECONDS = 60
DEFAULT_RESULT_TIMEOUT_SECONDS = 120
MAX_RESULT_TIMEOUT_SECONDS = 300
RESULT_POLL_INTERVAL_SECONDS = 1.0


class JobStore:
    def __init__(self, directory: Path | str = DEFAULT_JOB_DIR):
        self.directory = Path(directory).resolve()
        self.directory.mkdir(mode=0o700, parents=True, exist_ok=True)
        self.directory.chmod(0o700)
        self.db_path = self.directory / 'jobs.sqlite3'
        with self.connect() as connection:
            connection.execute('''
                CREATE TABLE IF NOT EXISTS jobs (
                    id TEXT PRIMARY KEY,
                    target TEXT NOT NULL,
                    state TEXT NOT NULL,
                    submitted_at REAL NOT NULL,
                    started_at REAL,
                    finished_at REAL,
                    updated_at REAL NOT NULL,
                    exit_code INTEGER,
                    pid INTEGER,
                    cancel_requested INTEGER NOT NULL DEFAULT 0,
                    note TEXT,
                    test_selection TEXT
                )
            ''')
            # Existing persisted jobs gain the optional selector without data loss.
            columns = {row[1] for row in connection.execute('PRAGMA table_info(jobs)')}
            if 'test_selection' not in columns:
                connection.execute('ALTER TABLE jobs ADD COLUMN test_selection TEXT')
            # Old queued targets no longer in the allowlist must not execute.
            obsolete = sorted({row[0] for row in connection.execute(
                "SELECT DISTINCT target FROM jobs WHERE state = 'queued'"
            )} - ALLOWED_TARGETS)
            if obsolete:
                placeholders = ','.join('?' for _ in obsolete)
                now = time.time()
                connection.execute(
                    f"UPDATE jobs SET state='cancelled', finished_at=?, updated_at=?, "
                    f"note='Target removed from MCP allowlist; resubmit explicitly' "
                    f"WHERE state='queued' AND target IN ({placeholders})",
                    (now, now, *obsolete),
                )
            # Existing approval-era jobs were never authorized for execution.
            # Cancel them on upgrade rather than silently running them.
            connection.execute('''
                UPDATE jobs SET state = 'cancelled', finished_at = ?,
                    updated_at = ?, note =
                    'Legacy MCP approval job cancelled by upgrade; resubmit explicitly'
                WHERE state = 'awaiting_approval'
            ''', (time.time(), time.time()))
        if self.db_path.exists():
            self.db_path.chmod(0o600)

    @contextmanager
    def connect(self):
        connection = sqlite3.connect(str(self.db_path), timeout=30)
        try:
            connection.row_factory = sqlite3.Row
            connection.execute('PRAGMA busy_timeout=30000')
            with connection:
                yield connection
        finally:
            connection.close()

    def submit(self, target: str, *, test: str | None = None) -> dict:
        if target not in ALLOWED_TARGETS:
            raise ValueError('Unknown or disallowed Make target; no arbitrary commands or variables')
        if test is not None and (target != 'pretest' or type(test) is not str
                                 or test not in PRETEST_SELECTIONS):
            raise ValueError('test selector is allowed only for pretest: install, upgrade or deinstall')
        job_id = uuid.uuid4().hex[:24]
        state = 'queued'
        timestamp = time.time()
        job_path = self.job_dir(job_id)
        job_path.mkdir(mode=0o700)
        with self.connect() as connection:
            connection.execute('''
                INSERT INTO jobs (id, target, state, submitted_at, updated_at, test_selection)
                VALUES (?, ?, ?, ?, ?, ?)
            ''', (job_id, target, state, timestamp, timestamp, test))
        return self.get(job_id)

    def job_dir(self, job_id: str) -> Path:
        if not JOB_ID.fullmatch(job_id):
            raise ValueError('Invalid job ID')
        return self.directory / job_id

    def get(self, job_id: str) -> dict:
        self.job_dir(job_id)
        with self.connect() as connection:
            row = connection.execute('SELECT * FROM jobs WHERE id = ?', (job_id,)).fetchone()
        if row is None:
            raise ValueError('Unknown job ID')
        return self._to_dict(row)

    @staticmethod
    def _to_dict(row: sqlite3.Row) -> dict:
        result = dict(row)
        result['cancel_requested'] = bool(result['cancel_requested'])
        return result

    def list_recent(self, limit: int = 20) -> list[dict]:
        if not 1 <= limit <= 50:
            raise ValueError('limit must be between 1 and 50')
        with self.connect() as connection:
            rows = connection.execute(
                'SELECT * FROM jobs ORDER BY submitted_at DESC LIMIT ?', (limit,),
            ).fetchall()
        return [self._to_dict(row) for row in rows]

    def request_cancel(self, job_id: str) -> dict:
        job = self.get(job_id)
        if job['target'] not in OFFLINE_TARGETS:
            raise ValueError('Cancellation is disabled for file-generating, source and database operations')
        with self.connect() as connection:
            connection.execute('''
                UPDATE jobs SET state = CASE WHEN state = 'queued'
                                            THEN 'cancelled' ELSE state END,
                    finished_at = CASE WHEN state = 'queued' THEN ? ELSE finished_at END,
                    cancel_requested = CASE WHEN state = 'running' THEN 1 ELSE cancel_requested END,
                    updated_at = ?
                WHERE id = ? AND state IN ('queued', 'running')
            ''', (time.time(), time.time(), job_id))
        return self.get(job_id)

    def recover_interrupted(self) -> None:
        # Only the worker calls this, AFTER acquiring the exclusive worker lock.
        with self.connect() as connection:
            connection.execute('''
                UPDATE jobs SET state = 'interrupted', finished_at = ?,
                    updated_at = ?, note = 'Worker exited before job completion; inspect target state before retrying'
                WHERE state = 'running'
            ''', (time.time(), time.time()))

    def claim_next(self) -> dict | None:
        with self.connect() as connection:
            connection.execute('BEGIN IMMEDIATE')
            row = connection.execute('''
                SELECT * FROM jobs WHERE state = 'queued'
                ORDER BY submitted_at, id LIMIT 1
            ''').fetchone()
            if row is None:
                return None
            connection.execute('''
                UPDATE jobs SET state = 'running', started_at = ?, updated_at = ?
                WHERE id = ? AND state = 'queued'
            ''', (time.time(), time.time(), row['id']))
        return self.get(row['id'])

    def set_pid(self, job_id: str, pid: int) -> None:
        with self.connect() as connection:
            connection.execute('UPDATE jobs SET pid = ?, updated_at = ? WHERE id = ?',
                               (pid, time.time(), job_id))

    def finish(self, job_id: str, state: str, exit_code: int | None, note: str = '') -> None:
        if state not in FINISHED:
            raise ValueError('Invalid finished state')
        with self.connect() as connection:
            connection.execute('''
                UPDATE jobs SET state = ?, exit_code = ?, finished_at = ?,
                    updated_at = ?, note = ? WHERE id = ? AND state = 'running'
            ''', (state, exit_code, time.time(), time.time(), note, job_id))

    @staticmethod
    def _read_log(path: Path, offset: int, max_bytes: int) -> dict:
        if offset < 0 or not 1 <= max_bytes <= 16384:
            raise ValueError('Invalid log offset or max_bytes')
        if not path.is_file():
            return {'text': '', 'next_offset': 0, 'end_of_log': True}
        size = path.stat().st_size
        offset = min(offset, size)
        with path.open('rb') as log_file:
            log_file.seek(offset)
            data = log_file.read(max_bytes)
        next_offset = offset + len(data)
        return {
            'text': data.decode('utf-8', errors='replace'),
            'next_offset': next_offset, 'end_of_log': next_offset == size,
        }

    def logs(self, job_id: str, offset: int = 0, max_bytes: int = 8192,
             sqlcl_file: str | None = None) -> dict:
        if sqlcl_file is not None:
            return self.sqlcl_logs(job_id, sqlcl_file, offset, max_bytes)
        self.get(job_id)
        return {'job_id': job_id, **self._read_log(
            self.job_dir(job_id) / 'output.log', offset, max_bytes,
        )}

    def sqlcl_files(self, job_id: str) -> list[str]:
        self.get(job_id)
        directory = self.job_dir(job_id) / 'sqlcl'
        if not directory.is_dir():
            return []
        return sorted(path.name for path in directory.iterdir()
                      if path.is_file() and not path.is_symlink())[:200]

    def sqlcl_logs(self, job_id: str, name: str,
                   offset: int = 0, max_bytes: int = 8192) -> dict:
        if name not in self.sqlcl_files(job_id):
            raise ValueError('Unknown SQLcl log file')
        path = self.job_dir(job_id) / 'sqlcl' / name
        return {'job_id': job_id, 'name': name, **self._read_log(
            path, offset, max_bytes,
        )}

    def status(self, job_id: str) -> dict:
        job = self.get(job_id)
        job['is_terminal'] = job['state'] in FINISHED
        job['successful'] = (
            job['state'] == 'succeeded' and job['exit_code'] == 0
        ) if job['is_terminal'] else None
        path = self.job_dir(job_id) / 'output.log'
        if path.is_file():
            with path.open('rb') as log_file:
                log_file.seek(max(0, path.stat().st_size - 16000))
                lines = log_file.read().decode('utf-8', errors='replace').splitlines()
            markers = [line.strip()[:180] for line in lines
                       if line.startswith('[apex-blog]') or line.startswith('[MCP job]')]
            if markers:
                job['last_stage'] = markers[-1]
        if job['started_at'] is not None:
            end = job['finished_at'] or time.time()
            job['elapsed_seconds'] = round(max(0, end - job['started_at']), 1)
        return job

    def result(self, job_id: str) -> dict:
        job = self.status(job_id)
        path = self.job_dir(job_id) / 'output.log'
        if path.is_file():
            with path.open('rb') as log_file:
                log_file.seek(max(0, path.stat().st_size - 12000))
                job['log_tail'] = log_file.read().decode('utf-8', errors='replace')
        else:
            job['log_tail'] = ''
        job['sqlcl_log_files'] = self.sqlcl_files(job_id)
        return job

    async def submit_and_wait(
        self, target: str, wait_seconds: int = DEFAULT_START_WAIT_SECONDS,
        *, test: str | None = None,
    ) -> dict:
        """Submit once, then reuse result waiting without tying the job to the request.

        Validate the short wait BEFORE submission so invalid options never
        leave a newly queued job behind. Cancelling the wait leaves the job
        in the durable worker queue.
        """
        if (type(wait_seconds) is not int
                or not 0 <= wait_seconds <= MAX_START_WAIT_SECONDS):
            raise ValueError(
                f'wait_seconds must be between 0 and {MAX_START_WAIT_SECONDS}'
            )

        job = self.submit(target, test=test)
        return await self.wait_for_result(job['id'], timeout_seconds=wait_seconds)

    async def wait_for_result(
        self, job_id: str, timeout_seconds: int = DEFAULT_RESULT_TIMEOUT_SECONDS,
    ) -> dict:
        """Wait for an outcome without cancelling or blocking the worker.

        Return the full result once terminal, or just current progress when the
        requested wait expires. A zero timeout performs an immediate check.
        Cancelling this coroutine never changes the underlying job state.
        """
        if (type(timeout_seconds) is not int
                or not 0 <= timeout_seconds <= MAX_RESULT_TIMEOUT_SECONDS):
            raise ValueError(
                f'timeout_seconds must be between 0 and {MAX_RESULT_TIMEOUT_SECONDS}'
            )

        started = time.monotonic()
        deadline = started + timeout_seconds
        while True:
            status = self.status(job_id)
            if status['is_terminal']:
                outcome = self.result(job_id)
                outcome['wait_timed_out'] = False
                outcome['waited_seconds'] = round(time.monotonic() - started, 2)
                return outcome

            remaining = deadline - time.monotonic()
            if remaining <= 0:
                status['wait_timed_out'] = True
                status['waited_seconds'] = round(time.monotonic() - started, 2)
                return status

            await asyncio.sleep(min(RESULT_POLL_INTERVAL_SECONDS, remaining))
