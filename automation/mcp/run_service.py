"""Start a persistent worker alongside the long-lived MCP HTTP server."""

from __future__ import annotations

import os
from pathlib import Path
import shutil
import signal
import subprocess
import sys
import threading

from .jobs import JobStore, REPO_ROOT


def install_sqlcl_profile() -> None:
    """Copy read-only mounted credentials to a private writable runtime home."""
    mounted = Path('/run/sqlcl-profile')
    if not mounted.is_dir():
        raise RuntimeError('Missing read-only DEV/TEST SQLcl profile mount')
    destination = Path.home() / '.dbtools'
    # Do not retain credentials removed from a previous version of the mount.
    if destination.exists():
        shutil.rmtree(destination)
    shutil.copytree(mounted, destination)
    for root, dirs, files in os.walk(destination):
        os.chmod(root, 0o700)
        for directory in dirs:
            os.chmod(Path(root) / directory, 0o700)
        for file in files:
            os.chmod(Path(root) / file, 0o600)


def main() -> None:
    install_sqlcl_profile()
    JobStore()
    worker = subprocess.Popen(
        [sys.executable, '-m', 'automation.mcp.worker'], cwd=REPO_ROOT,
        stdin=subprocess.DEVNULL,
    )
    stopping = threading.Event()

    def watch_worker() -> None:
        while not stopping.wait(1):
            if worker.poll() is not None:
                print('[apex-blog MCP] Worker exited; stopping API for restart',
                      file=sys.stderr)
                os.kill(os.getpid(), signal.SIGTERM)
                return

    threading.Thread(target=watch_worker, daemon=True).start()
    try:
        from .server import mcp
        mcp.run(transport='streamable-http')
    finally:
        stopping.set()
        if worker.poll() is None:
            worker.terminate()
            try:
                worker.wait(timeout=10)
            except subprocess.TimeoutExpired:
                worker.kill()
                worker.wait()


if __name__ == '__main__':
    main()
