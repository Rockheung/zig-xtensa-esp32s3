#!/usr/bin/env bash
set -euo pipefail
ZIG_URL="${ZIG_URL:?tarball URL from https://ziglang.org/download/index.json}"
ZIG_SHA256="${ZIG_SHA256:?shasum for that tarball from index.json}"
WORK="${WORK:?same directory as build-llvm.sh}"
LLVM_PREFIX="${LLVM_PREFIX:?install prefix printed by build-llvm.sh}"
PREFIX="${PREFIX:-$WORK/zig-xtensa}"

mkdir -p "$WORK" && cd "$WORK"
tarball="$(basename "$ZIG_URL")"
[ -f "$tarball" ] || curl -fL -o "$tarball" "$ZIG_URL"
echo "$ZIG_SHA256  $tarball" | shasum -a 256 -c -
mkdir -p zig-src && tar xf "$tarball" -C zig-src --strip-components=1

cmake -G Ninja -S zig-src -B zig-build -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH="$LLVM_PREFIX" -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DZIG_EXTRA_BUILD_ARGS="-Dllvm-has-xtensa=true"
ninja -C zig-build install
"$PREFIX/bin/zig" version
