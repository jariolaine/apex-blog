"""Streamable HTTP MCP tools: allowlisted jobs, no extra approval queue."""

from typing import Annotated

from mcp.server.fastmcp import FastMCP
from pydantic import Field

from .jobs import JobStore

mcp = FastMCP(
    'APEX Blog Automation', host='0.0.0.0', port=8765,
    stateless_http=True, json_response=True,
)

# MCP clients such as Cline read argument descriptions from each tool's
# inputSchema.properties. Function docstrings describe the *tool*, not its
# individual arguments, so keep these Field descriptions explicit.
JobId = Annotated[
    str,
    Field(
        pattern=r'^[0-9a-f]{24}$',
        description='24-character lowercase hexadecimal job ID returned by automation_start '
                    'or automation_list; use the exact ID, not a Make target or filename.',
    ),
]
LogOffset = Annotated[
    int,
    Field(
        ge=0,
        description='Zero-based byte offset in the saved log. Start at 0, then pass the '
                    'previous response\'s next_offset to read the next chunk.',
    ),
]
LogMaxBytes = Annotated[
    int,
    Field(
        ge=1, le=16384,
        description='Maximum number of log bytes to return in this call (1–16384). '
                    'Default is 8192; fetch additional chunks using next_offset.',
    ),
]


def store() -> JobStore:
    return JobStore()


@mcp.tool()
def automation_start(
    target: Annotated[
        str,
        Field(
            description='Exact allowlisted Make target to execute. Offline: doctor, lint, '
                        'test-fast, test, check-schema, check-source, validate, check. '
                        'source reads DEV and can replace local .apx files. '
                        'sync-dev, test-release, test-install, test-upgrade and '
                        'test-deinstall queue immediately after normal Cline/user authorization. '
                        'No shell commands, Make variables, QA or PROD targets.',
        ),
    ],
) -> dict:
    """Queue an allowlisted Make target for execution by the Docker worker.

    Get human authorization before requesting DEV imports or disposable TEST
    resets as required by AGENTS.md. There is no separate MCP approval step.
    `source` reads DEV and may overwrite local .apx source. Do not call blindly.
    Commands like build, qa, production, and hotfix are NOT exposed.
    """
    return store().submit(target)


@mcp.tool()
def automation_status(job_id: JobId) -> dict:
    """Get execution state, timestamps and latest preflight/automation stage."""
    return store().status(job_id)


@mcp.tool()
def automation_logs(
    job_id: JobId,
    offset: LogOffset = 0,
    max_bytes: LogMaxBytes = 8192,
) -> dict:
    """Read saved stdout/stderr by byte offset; use next_offset for the next poll."""
    return store().logs(job_id, offset, max_bytes)


@mcp.tool()
def automation_result(job_id: JobId) -> dict:
    """Get final exit code, diagnostic tail and location of retained SQLcl logs."""
    return store().result(job_id)


@mcp.tool()
def automation_list(
    limit: Annotated[
        int,
        Field(ge=1, le=50, description='Number of most recent jobs to return, from 1 '
              'to 50. Defaults to 20; newest submitted jobs appear first.'),
    ] = 20,
) -> list[dict]:
    """List up to 50 recent automation jobs without accessing an arbitrary path."""
    return store().list_recent(limit)


@mcp.tool()
def automation_cancel(job_id: JobId) -> dict:
    """Request cancellation of an offline-only check; database jobs cannot be cancelled here."""
    return store().request_cancel(job_id)


@mcp.tool()
def automation_sqlcl_files(job_id: JobId) -> list[str]:
    """List retained SQLcl diagnostic files for a job (may contain sensitive DB data)."""
    return store().sqlcl_files(job_id)


@mcp.tool()
def automation_sqlcl_log(
    job_id: JobId,
    name: Annotated[
        str,
        Field(
            min_length=1,
            description='Exact SQLcl diagnostic filename returned by '
                        'automation_sqlcl_files for this job ID. Not a path; '
                        'do not include directories or file content.',
        ),
    ],
    offset: LogOffset = 0,
    max_bytes: LogMaxBytes = 8192,
) -> dict:
    """Read one retained SQLcl diagnostic file by its returned filename and offset."""
    return store().sqlcl_logs(job_id, name, offset, max_bytes)
