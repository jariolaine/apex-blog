#!/usr/bin/env bash
# Docker image startup; preserve MCP worker and its immutable Make safety gates.
set -Eeuo pipefail
bash automation/mcp/ensure_dependencies.sh
exec python3 -m automation.mcp.run_service
