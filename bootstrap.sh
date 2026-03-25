#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

./scripts/install-packages.sh
chezmoi init --apply "$REPO_DIR"
sudo ./scripts/apply-system.sh
./scripts/verify.sh