#!/usr/bin/env bash
set -euo pipefail
BUILD_DIR="${BUILD_DIR:?ESP-IDF build directory of a project that compiles main/shim.c}"
ZIG="${ZIG:?path to zig}"
TOOLCHAIN="${TOOLCHAIN:?xtensa-esp-elf toolchain root, e.g. ~/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20260121/xtensa-esp-elf}"
OUT="${OUT:-main/c.zig}"
HERE="$(cd "$(dirname "$0")" && pwd)"
tmp="$(mktemp -d)"
python3 - "$BUILD_DIR/compile_commands.json" "$tmp/cflags.txt" <<'PY'
import json,shlex,sys
cc=json.load(open(sys.argv[1]))
e=[c for c in cc if c['file'].endswith('main/shim.c')][0]
a=shlex.split(e['command'])
open(sys.argv[2],'w').write('\n'.join(x for x in a if x.startswith(('-I','-D'))))
PY
"$TOOLCHAIN/bin/xtensa-esp32s3-elf-gcc" -dM -E -x c /dev/null | grep -v '__has_include\|__has_cpp_attribute\|__FILE__\|__LINE__\|__DATE__\|__TIME__\|__COUNTER__\|__INCLUDE_LEVEL__\|__BASE_FILE__\|__TIMESTAMP__' > "$tmp/gccdefs.h"
printf '#include "gccdefs.h"\ntypedef unsigned int wint_t;\n#include "driver/i2c_master.h"\n' > "$tmp/idf.h"
"$ZIG" translate-c -target xtensa-freestanding-none -mcpu=esp32 -I"$tmp" \
  -isystem "$TOOLCHAIN/lib/gcc/xtensa-esp-elf/14.2.0/include" -isystem "$TOOLCHAIN/xtensa-esp-elf/include" \
  $(tr '\n' ' ' < "$tmp/cflags.txt") "$tmp/idf.h" > "$HERE/$OUT"
