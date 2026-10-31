#!/usr/bin/env bash
# Compatibility shim for scripts that still source read_variables.sh.
source "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)/variables.sh"
