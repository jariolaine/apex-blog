"""Single persistent worker executing queued, allowlisted Make targets."""

from __future__ import annotations

import fcntl
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

from .jobs import JobStore, OFFLINE_TARGETS, REPO_ROOT

STOP = False


def request_stop(_signal_number: int, _frame: object) -> None:
    global STOP
    STOP = True


def stop_process_group(process: subprocess.Popen, grace_seconds: float = 5) -> None:
    if process.poll() is not None:
        return
    try:
        os.killpg(process.pid, signal.SIGTERM)
    except ProcessLookupError:
        return
    try:
        process.wait(timeout=grace_seconds)
    except subprocess.TimeoutExpired:
        try:
            os.killpg(process.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        process.wait()


def process_next(store: JobStore, make_executable: str = 'make') -> bool:
    job = store.claim_next()
    if job is None:
        return False
    job_id, target = job['id'], job['target']
    directory = store.job_dir(job_id)
    log_path = directory / 'output.log'
    sqlcl_path = directory / 'sqlcl'
    sqlcl_path.mkdir(mode=0o700, exist_ok=True)
    env = os.environ.copy()
    env['AUTOMATION_SQLCL_LOG_DIR'] = str(sqlcl_path)
    process = None
    state, exit_code, note = 'interrupted', None, 'Worker stopped unexpectedly'
    try:
        with log_path.open('ab', buffering=0) as output:
            os.chmod(log_path, 0o600)
            output.write(f'[MCP job] Starting make {target}\n'.encode())
            process = subprocess.Popen(
                [make_executable, '--no-print-directory', target],
                cwd=REPO_ROOT, env=env, stdin=subprocess.DEVNULL,
                stdout=output, stderr=subprocess.STDOUT,
                start_new_session=True,
            )
            store.set_pid(job_id, process.pid)
            while process.poll() is None:
                if STOP:
                    stop_process_group(process)
                    note = 'Worker shutdown; inspect database state before a retry'
                    break
                if target in OFFLINE_TARGETS and store.get(job_id)['cancel_requested']:
                    stop_process_group(process)
                    state = 'cancelled'
                    note = 'Cancellation requested for offline job'
                    break
                time.sleep(0.25)
            exit_code = process.wait()
            if not STOP and state != 'cancelled':
                state = 'succeeded' if exit_code == 0 else 'failed'
                note = ''
            output.write(f'[MCP job] {state}, exit_code={exit_code}\n'.encode())
    except Exception as exc:
        if process is not None:
            stop_process_group(process)
        note = f'Worker error: {type(exc).__name__}'
        try:
            with log_path.open('ab') as output:
                output.write(f'[MCP job] {note}\n'.encode())
        except OSError:
            pass
    finally:
        store.finish(job_id, state, exit_code, note)
    return True


def run_worker() -> None:
    signal.signal(signal.SIGTERM, request_stop)
    signal.signal(signal.SIGINT, request_stop)
    store = JobStore()
    lock_path = Path(store.directory) / '.worker.lock'
    with lock_path.open('a+') as lock_file:
        try:
            fcntl.flock(lock_file, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            sys.exit('Another automation worker is already active')
        store.recover_interrupted()
        while not STOP:
            if not process_next(store):
                time.sleep(0.4)


if __name__ == '__main__':
    run_worker()
