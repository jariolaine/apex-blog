#!/usr/bin/env bash
# Pin the application frontend compiler/minifier in the automation image and CI.
# This is infrastructure setup, not a command for the application coding agent.
set -Eeuo pipefail
npm install --global --no-audit --no-fund less@4.9.1 esbuild@0.28.2
lessc --version
esbuild --version
