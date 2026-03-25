#!/usr/bin/env bash
set -euo pipefail

echo "[deploy] Applying user configuration..."
chezmoi apply

echo "[deploy] Reloading user systemd..."
systemctl --user daemon-reload

echo "[deploy] Done."