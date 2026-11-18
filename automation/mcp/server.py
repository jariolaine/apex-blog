"""Streamable HTTP MCP tools for allowlisted Make jobs; no MCP approval queue."""

from enum import StrEnum
from typing import Annotated

from mcp.server.fastmcp import FastMCP
from pydantic import Field

from .jobs import (
    ALLOWED_TARGETS, DEFAULT_START_WAIT_SECONDS, MAX_START_WAIT_SECONDS,
    DEFAULT_RESULT_TIMEOUT_SECONDS, MAX_RESULT_TIMEOUT_SECONDS,
    JobStore, capabilities,
)

mcp = FastMCP(
    'APEX Blog Automation', host='0.0.0.0', port=8765,
    stateless_http=True, json_response=True,
)

# MCP clients (including Cline) read tool argument metadata from inputSchema,
# not just the function docstrings. Derive the target enum from the actual
# allowlist so visible choices cannot drift from runtime validation.
AutomationTarget = StrEnum(
    'AutomationTarget',
    {name.upper().replace('-', '_'): name for name in sorted(ALLOWED_TARGETS)},
)
JobId = Annotated[
    str,
    Field(
        pattern=r'^[0-9a-f]{24}$',
        description='Exact 24-character lowercase hexadecimal ID returned by '
                    'automation_start or automation_list. Not a Make target or path.',
    ),
]
LogOffset = Annotated[
    int,
    Field(
        ge=0,
        description='Zero-based BYTE offset into the saved log, not a character index. '
                    'Use 0 for the first read; resume with the previous next_offset.',
    ),
]
LogMaxBytes = Annotated[
    int,
    Field(
        ge=1, le=16384,
        description='Maximum log bytes to read in this call (1-16384, default 8192). '
                    'Continue with next_offset for additional output.',
    ),
]


def store() -> JobStore:
    return JobStore()


@mcp.tool()
def automation_capabilities() -> dict:
    """Discover MCP-supported Make targets and their side effects; does not run jobs.

    Call when choosing an execution channel or when unsure whether a target is
    supported. The result includes target descriptions, DEV/TEST effects,
    authorization policy, cancellation support, and terminal job states.
    Target metadata and automation_start's accepted values use one registry.

    This MCP API accepts no Make variables. It does NOT enforce human approval;
    follow AGENTS.md before database changes or overwriting local source.
    Unsupported targets/options require a documented project command under
    the same authorization rules, or must be reported as unavailable.
    """
    return capabilities()


@mcp.tool()
async def automation_start(
    target: Annotated[
        AutomationTarget,
        Field(
            description='Exact allowlisted Make target (select an enum value). '
                        'Use automation_capabilities for effects and authorization. '
                        'No Make variables, shell commands, custom paths, or deployment '
                        'targets are accepted. DEV/TEST changes '
                        'require prior human authorization as specified in AGENTS.md.',
        ),
    ],
    wait_seconds: Annotated[
        int,
        Field(
            ge=0, le=MAX_START_WAIT_SECONDS,
            description='Maximum seconds to wait after submitting the job (0-60; '
                        'default 30). Returns early if the job completes. '
                        '0 queues the job and returns immediately. If still active '
                        'after the wait, use automation_result with the returned id. '
                        'A timeout or cancelled request does not cancel the job.',
        ),
    ] = DEFAULT_START_WAIT_SECONDS,
) -> dict:
    """Submit an allowlisted Make target and briefly wait for its outcome.

    Before calling, check target effects via automation_capabilities and follow
    AGENTS.md authorization rules. For 'source', check local uncommitted .apx
    changes first; DEV/TEST-changing jobs require explicit approval. The job
    queue does not implement an additional approval step.

    Waits up to 30 seconds by default (maximum 60), returning early when
    finished. Always returns 'id' plus state/is_terminal. Terminal results
    contain exit_code, successful, log_tail and SQLcl diagnostic filenames.
    If still queued/running, pass the returned 'id' as 'job_id' to
    automation_result, which waits longer. Set wait_seconds=0 to submit and
    return immediately. Cancelling this request never cancels the queued job;
    recover its ID with automation_list if the client loses the response.

    Never blindly retry interrupted database work. Unsupported Make options
    require a documented project command, not shell arguments here.
    """
    return await store().submit_and_wait(target.value, wait_seconds)


@mcp.tool()
def automation_logs(
    job_id: JobId,
    offset: LogOffset = 0,
    max_bytes: LogMaxBytes = 8192,
    sqlcl_file: Annotated[
        str | None,
        Field(
            min_length=1,
            description='Optional exact SQLcl diagnostic filename from a completed '
                        'automation_result.sqlcl_log_files list. Omit to read the '
                        "job's combined stdout/stderr. Paths and unlisted names "
                        'are rejected.',
        ),
    ] = None,
) -> dict:
    """Read combined job output or a retained SQLcl diagnostic log.

    Omit sqlcl_file for stdout/stderr; pass an exact filename returned in
    automation_result.sqlcl_log_files to read its SQLcl diagnostic output.
    SQLcl filenames are validated against files retained for this job.

    Start at byte offset 0 and pass next_offset for subsequent chunks.
    end_of_log=true means the current file end was reached, NOT that the job
    completed; use automation_result to check job state. UTF-8 bytes split
    across chunks may display replacement characters. Logs may be sensitive.
    """
    return store().logs(job_id, offset, max_bytes, sqlcl_file=sqlcl_file)


@mcp.tool()
async def automation_result(
    job_id: JobId,
    timeout_seconds: Annotated[
        int,
        Field(
            ge=0, le=MAX_RESULT_TIMEOUT_SECONDS,
            description='Maximum seconds to wait for completion (0-300; default 120). '
                        '0 returns current status immediately. The request returns early '
                        'when the job finishes; a timeout does not cancel the job.',
        ),
    ] = DEFAULT_RESULT_TIMEOUT_SECONDS,
) -> dict:
    """Wait for a queued/running automation job and return its outcome or progress.

    Call when automation_start returns is_terminal=false, using its 'id' as
    'job_id'. Waits up to 120 seconds by default (maximum 300), returning
    early on completion.
    Terminal states are succeeded, failed, cancelled and interrupted; the
    completed response includes exit_code, log_tail and sqlcl_log_files.
    Success requires state='succeeded' and exit_code=0 (successful=true).

    If the deadline expires while queued/running, returns current state,
    last_stage and is_terminal=false, with wait_timed_out=true and no log tail.
    Call automation_result again with the same job_id; timeout_seconds=0
    performs a non-waiting status check. Disconnecting/cancelling the request
    does not cancel the background job. Do not use shell sleep to wait.

    For failures, inspect automation_logs. SQLcl filenames are supplied in
    the terminal result's sqlcl_log_files field and can be read through
    automation_logs(sqlcl_file=...).
    Never automatically retry interrupted DEV/TEST jobs without inspecting
    their external state first. Configure the MCP client's request timeout
    above the maximum requested wait duration.
    """
    return await store().wait_for_result(job_id, timeout_seconds)


@mcp.tool()
def automation_list(
    limit: Annotated[
        int,
        Field(ge=1, le=50, description='Maximum recent jobs (1-50; default 20). '
              'Results are ordered newest submitted first; use to recover job IDs.'),
    ] = 20,
) -> list[dict]:
    """List recent jobs, including their IDs and current states.

    Useful after a client reconnects or loses a job ID. Call automation_result
    with timeout_seconds=0 for immediate progress or the default for a wait.
    Does not accept arbitrary paths and does not start a job.
    """
    return store().list_recent(limit)


@mcp.tool()
def automation_cancel(job_id: JobId) -> dict:
    """Request cancellation of an offline job only; never cancels DEV/TEST jobs.

    A queued offline job is marked cancelled immediately. For a running
    offline job, cancellation is requested and the worker stops it
    asynchronously; call automation_result to confirm the terminal state.
    'source' and database-changing targets cannot be cancelled using this tool.
    """
    return store().request_cancel(job_id)
