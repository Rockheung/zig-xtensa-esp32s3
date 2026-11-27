#!/usr/bin/env bash
set -euo pipefail
MODE="${1:?Debug|ReleaseSafe|ReleaseFast|ReleaseSmall}"
OUT="${2:?출력 파일}"
HERE="$(cd "$(dirname "$0")" && pwd)"
cd "$HERE"
B="build-qemu-$MODE"
idf.py -B "$B" -D SDKCONFIG="$B/sdkconfig" -D "SDKCONFIG_DEFAULTS=sdkconfig.defaults;sdkconfig.qemu" -D ZIG_OPT="$MODE" build > "$B.log" 2>&1
( cd "$B" && python3 -m esptool --chip esp32s3 merge_bin --fill-flash-size 4MB -o flash.bin @flash_args > /dev/null )
python3 run_qemu.py "$B/flash.bin" "$OUT"
