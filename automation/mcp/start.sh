#!/usr/bin/env bash
# Dependencies are already installed in Dockerfile.mcp. Do not access package
# registries, install hooks, or mutate a mounted checkout at startup.
# Use system Python for the MCP SDK: PATH starts with the separate lint venv.
set -Eeuo pipefail
# Optional external CA trust is prepared before the worker and HTTP server.
bash /usr/local/lib/apex-blog/prepare_trust.sh
exec /usr/local/bin/python3 -m automation.mcp.run_service
