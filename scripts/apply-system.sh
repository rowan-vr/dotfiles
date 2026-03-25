#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

install -Dm644 "$ROOT_DIR/system/greetd/config.toml" /etc/greetd/config.toml
install -Dm644 "$ROOT_DIR/system/iwd/main.conf" /etc/iwd/main.conf
install -Dm644 "$ROOT_DIR/system/systemd/network/25-wireless.network" /etc/systemd/network/25-wireless.network

systemctl enable greetd.service
systemctl enable iwd.service
systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service

ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf