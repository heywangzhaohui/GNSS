#!/usr/bin/env bash
set -euo pipefail

# Reproduce the static disassembly workflow for mapenv_02changsha.bin.
# Run from the repository root.

sample="mapenv_02changsha.bin"
out_dir="analysis/mapenv_02changsha"

mkdir -p "$out_dir"

if [[ ! -f "$sample" ]]; then
  git checkout origin/master -- "$sample"
fi

if ! command -v aarch64-linux-gnu-objdump >/dev/null 2>&1; then
  echo "Missing aarch64-linux-gnu-objdump."
  echo "On Ubuntu/Debian install it with:"
  echo "  sudo apt-get update && sudo apt-get install -y binutils-aarch64-linux-gnu"
  exit 1
fi

{
  printf '== file ==\n'
  file "$sample"
  printf '\n== hashes ==\n'
  sha256sum "$sample"
  sha1sum "$sample"
  md5sum "$sample"
  printf '\n== size ==\n'
  wc -c "$sample"
} > "$out_dir/00_identification.txt"

readelf -h "$sample" > "$out_dir/01_elf_header.txt"
readelf -l "$sample" > "$out_dir/02_program_headers.txt"
readelf -S "$sample" > "$out_dir/03_section_headers.txt"
readelf -d "$sample" > "$out_dir/04_dynamic.txt"
readelf -n "$sample" > "$out_dir/05_notes.txt"
hexdump -C -n 512 "$sample" > "$out_dir/09_header_hexdump_512.txt"

aarch64-linux-gnu-objdump -f -h -p "$sample" > "$out_dir/10_objdump_overview.txt"
aarch64-linux-gnu-objdump -d -C \
  --start-address=0x59cf00 \
  --stop-address=0x59d080 \
  --no-show-raw-insn \
  "$sample" > "$out_dir/13_entrypoint_window.asm"

aarch64-linux-gnu-objdump -d -C \
  --disassemble=main \
  --no-show-raw-insn \
  "$sample" > "$out_dir/14_main_disassembly.asm"

hexdump -C -s 0x5ae000 -n 0x600 "$sample" > "$out_dir/18_rodata_main_strings_window.txt"

aarch64-linux-gnu-objdump -d -C \
  --start-address=0x710b80 \
  --stop-address=0x711900 \
  --no-show-raw-insn \
  "$sample" > "$out_dir/19_encrypt_disassembly.asm"

echo "Done. Outputs are in $out_dir"
