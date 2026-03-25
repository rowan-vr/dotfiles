#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${HOME}/.local/share/chezmoi"
cd "$REPO_DIR"

echo "[bootstrap] Installing packages..."
./scripts/install-packages.sh

echo "[bootstrap] Applying system configuration..."
sudo ./scripts/apply-system.sh

echo "[bootstrap] Running deploy..."
./scripts/deploy.sh

echo "[bootstrap] Verifying setup..."
./scripts/verify.sh

echo "[bootstrap] Done."