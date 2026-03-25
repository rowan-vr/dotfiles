#!/usr/bin/env bash
set -euo pipefail

echo "Checking required binaries..."
for cmd in Hyprland waybar dunst rofi hyprpaper tuigreet greetd; do
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "  OK  $cmd"
  else
    echo "  MISSING  $cmd"
  fi
done

echo
echo "Checking system services..."
systemctl is-enabled greetd.service || true
systemctl is-enabled iwd.service || true
systemctl is-enabled systemd-networkd.service || true
systemctl is-enabled systemd-resolved.service || true

echo
echo "Checking user unit files..."
systemctl --user daemon-reload
systemctl --user list-unit-files | grep -E 'waybar|dunst|hyprpaper|hyprland-session' || true