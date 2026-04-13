#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$ROOT_DIR/bin"

APPS=(
  "pos2kml"
  "str2str"
  "rnx2rtkp"
  "convbin"
  "rtkrcv"
)

mkdir -p "$BIN_DIR"

for app in "${APPS[@]}"; do
  app_dir="$ROOT_DIR/app/$app/gcc"

  echo "==> building $app"
  make -C "$app_dir" clean >/dev/null
  make -C "$app_dir"
  install -m 755 "$app_dir/$app" "$BIN_DIR/$app"

  if [[ "$app" == "rtkrcv" ]]; then
    install -m 644 "$app_dir/rtkrcv.conf" "$BIN_DIR/rtkrcv.conf"
  fi

  make -C "$app_dir" clean >/dev/null
done

echo
echo "Linux CUI binaries are available in: $BIN_DIR"
