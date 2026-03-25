#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PKG_DIR="$ROOT_DIR/packages"

mapfile -t packages < <(
  printf "%s\n" \
    "$(cat "$PKG_DIR/base.txt")" \
    "$(cat "$PKG_DIR/ui.txt")" \
    "$(cat "$PKG_DIR/fonts.txt")" \
    "$(cat "$PKG_DIR/tools.txt")" \
    "$(cat "$PKG_DIR/boot.txt")" \
  | sed 's/#.*//' \
  | awk 'NF' \
  | sort -u
)

if [ "${#packages[@]}" -eq 0 ]; then
  echo "No packages found."
  exit 0
fi

sudo pacman -Syu --needed --noconfirm "${packages[@]}"