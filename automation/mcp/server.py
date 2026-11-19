"""Streamable HTTP MCP tools for allowlisted Make jobs; no MCP approval queue."""

from enum import StrEnum
from typing import Annotated, Literal

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
        description='Exact id returned by automation_start or automation_list.',
    ),
]
LogOffset = Annotated[
    int,
    Field(
        ge=0,
        description='Log byte offset. Use 0 initially, then the previous next_offset.',
    ),
]
LogMaxBytes = Annotated[
    int,
    Field(
        ge=1, le=16384,
        description='Maximum number of log bytes to return.',
    ),
]


def store() -> JobStore:
    return JobStore()


@mcp.tool()
def automation_capabilities() -> dict:
    """List project operations, their file and database effects, and authorization requirements.

    Does not start work. Follow AGENTS.md for authorization.
    """
    return capabilities()


@mcp.tool()
async def automation_start(
    target: Annotated[
        AutomationTarget,
        Field(
            description='Project operation to run. Use automation_capabilities for '
                        'effects and authorization requirements.',
        ),
    ],
    wait_seconds: Annotated[
        int,
        Field(
            ge=0, le=MAX_START_WAIT_SECONDS,
            description='Maximum seconds to wait for an initial outcome; returns early '
                        'when finished. Use 0 to return immediately.',
        ),
    ] = DEFAULT_START_WAIT_SECONDS,
    test: Annotated[
        Literal['install', 'upgrade', 'deinstall'] | None,
        Field(
            description='Stage to run with pretest: install, upgrade, or deinstall. '
                        'Omit to run all stages. Invalid for other operations.',
        ),
    ] = None,
) -> dict:
    """Start a supported project operation and return its id and status.

    Follow AGENTS.md authorization rules. If is_terminal=false, pass id as
    job_id to automation_result; do not submit another job to wait. A timeout
    or disconnected request does not cancel the job. Recover a lost id with
    automation_list. Only successful=true confirms success.
    """
    return await store().submit_and_wait(target.value, wait_seconds, test=test)


@mcp.tool()
def automation_logs(
    job_id: JobId,
    offset: LogOffset = 0,
    max_bytes: LogMaxBytes = 8192,
    sqlcl_file: Annotated[
        str | None,
        Field(
            min_length=1,
            description='Exact filename from sqlcl_log_files in a completed start or '
                        'result response. Omit to read the combined job output.',
        ),
    ] = None,
) -> dict:
    """Read job output or a SQLcl diagnostic log.

    Continue with next_offset. end_of_log marks the current end of the log,
    not job completion. Logs may contain sensitive application data.
    """
    return store().logs(job_id, offset, max_bytes, sqlcl_file=sqlcl_file)


@mcp.tool()
async def automation_result(
    job_id: JobId,
    timeout_seconds: Annotated[
        int,
        Field(
            ge=0, le=MAX_RESULT_TIMEOUT_SECONDS,
            description='Maximum seconds to wait for completion; returns early when '
                        'finished. Use 0 for immediate status.',
        ),
    ] = DEFAULT_RESULT_TIMEOUT_SECONDS,
) -> dict:
    """Wait for a job result or return its current status.

    If is_terminal=false, check the same job_id again. Only successful=true
    confirms success. A wait timeout does not cancel the job. Use
    automation_logs for diagnostics; do not resubmit interrupted database
    operations without checking the outcome.
    """
    return await store().wait_for_result(job_id, timeout_seconds)


@mcp.tool()
def automation_list(
    limit: Annotated[
        int,
        Field(ge=1, le=50, description='Maximum number of recent jobs, newest first.'),
    ] = 20,
) -> list[dict]:
    """List recent jobs and their states; recover an id after losing a response."""
    return store().list_recent(limit)


@mcp.tool()
def automation_cancel(job_id: JobId) -> dict:
    """Request cancellation of a job marked cancellable by automation_capabilities.

    Use automation_result to confirm the outcome.
    """
    return store().request_cancel(job_id)
