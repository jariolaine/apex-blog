"""Contract tests for the MCP target allowlist, metadata and job state API."""

import asyncio
from pathlib import Path

import pytest

from automation.mcp.jobs import (
    ALLOWED_TARGETS, DATABASE_TARGETS, FINISHED, OFFLINE_TARGETS,
    SOURCE_TARGETS, TARGET_SPECS, JobStore, capabilities,
)

# Intentional independent contract: a new MCP command must be a deliberate
# review, not an accidental side effect of editing metadata.
EXPECTED_OFFLINE = {
    'doctor', 'lint', 'test-fast', 'test', 'check-schema', 'check-source',
    'validate', 'check',
}
EXPECTED_SOURCE = {'source'}
EXPECTED_DATABASE = {
    'sync-dev', 'test-release', 'test-install', 'test-upgrade', 'test-deinstall',
}


def test_allowlist_categories_are_consistent_and_unchanged():
    assert OFFLINE_TARGETS == EXPECTED_OFFLINE
    assert SOURCE_TARGETS == EXPECTED_SOURCE
    assert DATABASE_TARGETS == EXPECTED_DATABASE
    assert ALLOWED_TARGETS == set(TARGET_SPECS)
    assert ALLOWED_TARGETS == EXPECTED_OFFLINE | EXPECTED_SOURCE | EXPECTED_DATABASE
    assert all(TARGET_SPECS[name].category == 'offline' for name in OFFLINE_TARGETS)
    assert all(TARGET_SPECS[name].category == 'source' for name in SOURCE_TARGETS)
    assert all(TARGET_SPECS[name].category == 'database' for name in DATABASE_TARGETS)


def test_discovery_is_derived_from_runtime_allowlist():
    result = capabilities()
    targets = {item['name']: item for item in result['targets']}
    assert set(targets) == ALLOWED_TARGETS
    assert result['mcp_accepts_make_variables'] is False
    assert result['authorization_enforced_by_mcp'] is False
    assert set(result['terminal_states']) == FINISHED
    assert set(result['active_states']) == {'queued', 'running'}
    for name, entry in targets.items():
        assert entry['description']
        assert entry['mcp_make_variables'] == []
        assert entry['cancellable'] == (name in OFFLINE_TARGETS)
        assert entry['modifies_database'] == (name in DATABASE_TARGETS)
        assert entry['modifies_local_source'] == (name in SOURCE_TARGETS)
        assert entry['authorization'] == TARGET_SPECS[name].authorization

    assert targets['source']['database_effect'] == 'read_dev'
    assert targets['source']['authorization'] == 'before_overwriting_uncommitted_changes'
    assert targets['sync-dev']['database_effect'] == 'write_dev'
    assert all(targets[name]['database_effect'] == 'reset_test'
               for name in DATABASE_TARGETS - {'sync-dev'})


def test_only_allowed_commands_can_be_submitted(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    for value in ('build', 'qa', 'production', 'check-release', 'verify-release',
                  'release-check', 'check OBJECTS=NO', 'lint; echo BAD'):
        with pytest.raises(ValueError, match='disallowed'):
            store.submit(value)
    submitted = store.submit('doctor')
    assert submitted['target'] == 'doctor'
    assert submitted['state'] == 'queued'
    assert len(submitted['id']) == 24


def test_status_and_result_distinguish_queued_from_success(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    job = store.submit('lint')
    job_id = job['id']
    queued = store.status(job_id)
    assert queued['is_terminal'] is False
    assert queued['successful'] is None
    assert store.result(job_id)['successful'] is None

    claimed = store.claim_next()
    assert claimed['id'] == job_id
    assert store.status(job_id)['state'] == 'running'
    store.finish(job_id, 'succeeded', 0)
    completed = store.result(job_id)
    assert completed['state'] == 'succeeded'
    assert completed['is_terminal'] is True
    assert completed['successful'] is True
    assert completed['exit_code'] == 0


def test_failed_cancelled_and_interrupted_are_not_success(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    failed = store.submit('doctor')['id']
    store.claim_next()
    store.finish(failed, 'failed', 2)
    assert store.status(failed)['successful'] is False

    cancelled = store.submit('check')['id']
    assert store.request_cancel(cancelled)['state'] == 'cancelled'
    assert store.status(cancelled)['is_terminal'] is True
    assert store.status(cancelled)['successful'] is False

    interrupted = store.submit('test-upgrade')['id']
    store.claim_next()
    store.recover_interrupted()
    assert store.status(interrupted)['state'] == 'interrupted'
    assert store.status(interrupted)['successful'] is False
    with pytest.raises(ValueError, match='disabled'):
        store.request_cancel(interrupted)


def test_end_of_log_does_not_mean_job_is_complete(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    job_id = store.submit('doctor')['id']
    empty = store.logs(job_id)
    assert empty['end_of_log'] is True
    assert store.status(job_id)['is_terminal'] is False

    content = 'abc\u00e4'.encode('utf-8')
    (store.job_dir(job_id) / 'output.log').write_bytes(content)
    first = store.logs(job_id, offset=0, max_bytes=3)
    second = store.logs(job_id, offset=first['next_offset'], max_bytes=8)
    assert first['text'] == 'abc'
    assert first['next_offset'] == 3
    assert first['end_of_log'] is False
    assert second['text'] == '\u00e4'
    assert second['next_offset'] == len(content)
    assert second['end_of_log'] is True
    assert store.status(job_id)['is_terminal'] is False


def test_start_immediate_response_has_id_and_current_state(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    response = asyncio.run(store.submit_and_wait('lint', wait_seconds=0))
    assert len(response['id']) == 24
    assert response['target'] == 'lint'
    assert response['state'] == 'queued'
    assert response['is_terminal'] is False
    assert response['successful'] is None
    assert response['wait_timed_out'] is True
    assert 'log_tail' not in response
    assert 'sqlcl_log_files' not in response
    assert len(store.list_recent()) == 1


@pytest.mark.parametrize(('terminal_state', 'exit_code', 'successful'), [
    ('succeeded', 0, True),
    ('failed', 3, False),
])
def test_start_wait_returns_early_with_final_result(
    tmp_path: Path, monkeypatch, terminal_state: str, exit_code: int,
    successful: bool,
):
    from automation.mcp import jobs

    monkeypatch.setattr(jobs, 'RESULT_POLL_INTERVAL_SECONDS', 0.01)
    store = JobStore(tmp_path / 'jobs')

    async def scenario():
        waiting = asyncio.create_task(store.submit_and_wait('test', wait_seconds=30))
        await asyncio.sleep(0.04)
        assert not waiting.done()
        job = store.claim_next()
        assert job is not None and job['target'] == 'test'
        (store.job_dir(job['id']) / 'output.log').write_text('application tests complete')
        store.finish(job['id'], terminal_state, exit_code)
        return await waiting

    result = asyncio.run(scenario())
    assert result['is_terminal'] is True
    assert result['state'] == terminal_state
    assert result['successful'] is successful
    assert result['exit_code'] == exit_code
    assert result['wait_timed_out'] is False
    assert result['waited_seconds'] < 30
    assert 'application tests complete' in result['log_tail']
    assert result['sqlcl_log_files'] == []
    assert store.get(result['id'])['state'] == terminal_state
    assert len(store.list_recent()) == 1  # no duplicate submission on completion


@pytest.mark.parametrize(('requested', 'effective'), [
    (None, 30),
    (60, 60),
])
def test_start_default_and_max_wait_are_forwarded(
    tmp_path: Path, monkeypatch, requested, effective,
):
    store = JobStore(tmp_path / 'jobs')

    async def fake_wait_for_result(job_id: str, timeout_seconds: int):
        return {'id': job_id, 'timeout_used': timeout_seconds}

    monkeypatch.setattr(store, 'wait_for_result', fake_wait_for_result)
    if requested is None:
        response = asyncio.run(store.submit_and_wait('check'))
    else:
        response = asyncio.run(store.submit_and_wait('check', wait_seconds=requested))
    assert response['timeout_used'] == effective
    assert len(response['id']) == 24
    assert len(store.list_recent()) == 1


def test_start_wait_timeout_keeps_background_job(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    result = asyncio.run(store.submit_and_wait('test-upgrade', wait_seconds=1))
    assert result['state'] == 'queued'
    assert result['is_terminal'] is False
    assert result['wait_timed_out'] is True
    assert result['waited_seconds'] >= 0.95
    assert 'log_tail' not in result
    assert store.get(result['id'])['cancel_requested'] is False
    assert len(store.list_recent()) == 1


def test_cancelling_start_wait_does_not_cancel_submitted_job(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')

    async def scenario():
        waiting = asyncio.create_task(store.submit_and_wait('sync-dev', wait_seconds=60))
        await asyncio.sleep(0.02)
        job_id = store.list_recent(limit=1)[0]['id']
        waiting.cancel()
        with pytest.raises(asyncio.CancelledError):
            await waiting
        return job_id

    job_id = asyncio.run(scenario())
    assert store.get(job_id)['state'] == 'queued'
    assert store.get(job_id)['cancel_requested'] is False


@pytest.mark.parametrize('invalid', [-1, 61, 0.5, True, False, None, '30'])
def test_start_wait_rejects_invalid_seconds_without_submitting(tmp_path: Path, invalid):
    store = JobStore(tmp_path / 'jobs')
    with pytest.raises(ValueError, match='wait_seconds must be between 0 and 60'):
        asyncio.run(store.submit_and_wait('lint', invalid))
    assert store.list_recent() == []


def test_start_wait_rejects_unsupported_target_without_submitting(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    with pytest.raises(ValueError, match='disallowed'):
        asyncio.run(store.submit_and_wait('build', wait_seconds=0))
    assert store.list_recent() == []


def test_result_immediate_check_is_progress_only(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    job_id = store.submit('doctor')['id']
    status = asyncio.run(store.wait_for_result(job_id, timeout_seconds=0))
    assert status['state'] == 'queued'
    assert status['is_terminal'] is False
    assert status['successful'] is None
    assert status['wait_timed_out'] is True
    assert status['waited_seconds'] >= 0
    assert 'log_tail' not in status
    assert 'sqlcl_log_files' not in status
    assert store.get(job_id)['state'] == 'queued'


def test_result_wait_returns_early_with_final_diagnostics(tmp_path: Path, monkeypatch):
    from automation.mcp import jobs

    monkeypatch.setattr(jobs, 'RESULT_POLL_INTERVAL_SECONDS', 0.01)
    store = JobStore(tmp_path / 'jobs')
    job_id = store.submit('test')['id']

    async def scenario():
        task = asyncio.create_task(store.wait_for_result(job_id, timeout_seconds=10))
        await asyncio.sleep(0.05)
        assert not task.done()  # The event loop is not blocked by waiting.
        assert store.claim_next()['id'] == job_id
        (store.job_dir(job_id) / 'output.log').write_text('all tests passed')
        store.finish(job_id, 'succeeded', 0)
        return await task

    result = asyncio.run(scenario())
    assert result['is_terminal'] is True
    assert result['successful'] is True
    assert result['wait_timed_out'] is False
    assert result['waited_seconds'] < 10
    assert result['exit_code'] == 0
    assert 'all tests passed' in result['log_tail']
    assert result['sqlcl_log_files'] == []


def test_result_wait_timeout_does_not_cancel_job(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    job_id = store.submit('test-upgrade')['id']
    outcome = asyncio.run(store.wait_for_result(job_id, timeout_seconds=1))
    assert outcome['wait_timed_out'] is True
    assert outcome['is_terminal'] is False
    assert outcome['state'] == 'queued'
    assert outcome['waited_seconds'] >= 0.95
    assert 'log_tail' not in outcome
    assert store.get(job_id)['cancel_requested'] is False
    assert store.get(job_id)['state'] == 'queued'


@pytest.mark.parametrize(('terminal_state', 'exit_code', 'expected_success'), [
    ('succeeded', 0, True),
    ('failed', 7, False),
    ('cancelled', None, False),
    ('interrupted', None, False),
])
def test_result_wait_all_terminal_states(tmp_path: Path, terminal_state, exit_code,
                                         expected_success):
    store = JobStore(tmp_path / 'jobs')
    job_id = store.submit('doctor')['id']
    if terminal_state == 'cancelled':
        store.request_cancel(job_id)
    else:
        store.claim_next()
        if terminal_state == 'interrupted':
            store.recover_interrupted()
        else:
            store.finish(job_id, terminal_state, exit_code)

    outcome = asyncio.run(store.wait_for_result(job_id, timeout_seconds=0))
    assert outcome['state'] == terminal_state
    assert outcome['is_terminal'] is True
    assert outcome['successful'] is expected_success
    assert outcome['wait_timed_out'] is False
    assert 'log_tail' in outcome
    assert 'sqlcl_log_files' in outcome


def test_cancelling_result_request_does_not_cancel_job(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    job_id = store.submit('sync-dev')['id']

    async def scenario():
        task = asyncio.create_task(store.wait_for_result(job_id, timeout_seconds=300))
        await asyncio.sleep(0.02)
        task.cancel()
        with pytest.raises(asyncio.CancelledError):
            await task

    asyncio.run(scenario())
    assert store.get(job_id)['state'] == 'queued'
    assert store.get(job_id)['cancel_requested'] is False


@pytest.mark.parametrize('invalid', [-1, 301, 1.5, True, False, None, '120'])
def test_result_wait_rejects_invalid_timeout(tmp_path: Path, invalid):
    store = JobStore(tmp_path / 'jobs')
    job_id = store.submit('lint')['id']
    with pytest.raises(ValueError, match='between 0 and 300'):
        asyncio.run(store.wait_for_result(job_id, invalid))
    assert store.get(job_id)['state'] == 'queued'


def test_result_wait_rejects_invalid_job_id(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    with pytest.raises(ValueError, match='Invalid job ID'):
        asyncio.run(store.wait_for_result('../bad', timeout_seconds=0))


def test_unified_logs_support_normal_and_sqlcl_output(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    job_id = store.submit('validate')['id']
    job_dir = store.job_dir(job_id)
    (job_dir / 'output.log').write_text('combined output', encoding='utf-8')
    sqlcl_dir = job_dir / 'sqlcl'
    sqlcl_dir.mkdir()
    (sqlcl_dir / 'validate.log').write_text('sqlcl diagnostic', encoding='utf-8')
    (sqlcl_dir / 'other.log').write_text('other', encoding='utf-8')

    combined = store.logs(job_id, max_bytes=8)
    assert combined['text'] == 'combined'
    assert combined['next_offset'] == 8
    assert store.logs(job_id, offset=8)['text'] == ' output'

    diagnostic = store.logs(job_id, max_bytes=5, sqlcl_file='validate.log')
    assert diagnostic['text'] == 'sqlcl'
    assert diagnostic['name'] == 'validate.log'
    assert diagnostic['next_offset'] == 5
    assert store.logs(job_id, offset=5, sqlcl_file='validate.log')['text'] == ' diagnostic'
    assert store.result(job_id)['sqlcl_log_files'] == ['other.log', 'validate.log']
    assert store.logs(job_id)['text'] == 'combined output'


@pytest.mark.parametrize('invalid_name', [
    '', '../output.log', '../../jobs.sqlite3', '/tmp/other.log', 'missing.log',
])
def test_unified_logs_reject_unlisted_sqlcl_names(tmp_path: Path, invalid_name: str):
    store = JobStore(tmp_path / 'jobs')
    job_id = store.submit('doctor')['id']
    sqlcl_dir = store.job_dir(job_id) / 'sqlcl'
    sqlcl_dir.mkdir()
    (sqlcl_dir / 'known.log').write_text('ok', encoding='utf-8')
    with pytest.raises(ValueError, match='Unknown SQLcl log file'):
        store.logs(job_id, sqlcl_file=invalid_name)


def test_unified_logs_reject_sqlcl_symlink(tmp_path: Path):
    store = JobStore(tmp_path / 'jobs')
    job_id = store.submit('doctor')['id']
    job_dir = store.job_dir(job_id)
    sqlcl_dir = job_dir / 'sqlcl'
    sqlcl_dir.mkdir()
    (job_dir / 'output.log').write_text('do not expose via symlink', encoding='utf-8')
    (sqlcl_dir / 'alias.log').symlink_to(job_dir / 'output.log')
    assert store.sqlcl_files(job_id) == []
    with pytest.raises(ValueError, match='Unknown SQLcl log file'):
        store.logs(job_id, sqlcl_file='alias.log')
