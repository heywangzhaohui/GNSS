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

aarch64-linux-gnu-objdump -d -C \
  --start-address=0x710500 \
  --stop-address=0x710b88 \
  --no-show-raw-insn \
  "$sample" > "$out_dir/20_encrypt_helpers_disassembly.asm"

aarch64-linux-gnu-objdump -s -j .rodata \
  --start-address=0x9d1d10 \
  --stop-address=0x9d1e00 \
  "$sample" > "$out_dir/21_encrypt_constants_rodata.txt"

python3 - <<'PY' > "$out_dir/22_encrypt_constants_decoded.txt"
import struct
from pathlib import Path

sample = Path("mapenv_02changsha.bin")
data = sample.read_bytes()
offsets = [
    1960, 3264, 3272, 3280, 3288, 3296, 3304, 3312, 3320, 3328,
    3336, 3344, 3352, 3360, 3368, 3376, 3384, 3392, 3400, 3408,
    3416, 3424, 3432, 3440, 3448,
]

print("VA                 file_off   double_value")
for rel in offsets:
    va = 0x9D1000 + rel
    off = va - 0x400000
    raw = data[off:off + 8]
    val = struct.unpack("<d", raw)[0]
    print(f"0x{va:016x}  0x{off:06x}  {val:.17g}")

print("\nSelected immediates materialized in instructions:")
immediates = [
    ("10000000.0 scale", 0x416312D000000000),
    ("6378245.0 semi-major axis candidate", 0x415854C140000000),
    ("180.0 degrees", 0x4066800000000000),
    ("10.0", 0x4024000000000000),
    ("100000.0", 0x40F86A0000000000),
    ("1000000.0", 0x412E848000000000),
    ("105.0 lon offset", 0x405A400000000000),
    ("35.0 lat offset", 0x4041800000000000),
    ("500.0", 0x407F400000000000),
    ("1000.0", 0x408F400000000000),
]
for name, bits in immediates:
    val = struct.unpack("<d", bits.to_bytes(8, "little"))[0]
    print(f"{name}: {val:.17g}")
PY

echo "Done. Outputs are in $out_dir"
