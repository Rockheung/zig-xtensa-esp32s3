#!/usr/bin/env bash
set -euo pipefail
LLVM_VERSION="${LLVM_VERSION:-23.1.6}"
LLVM_SHA256="${LLVM_SHA256:-d3b86ab29cfb4445a6652e5c2642ccc75e04e38084dde3701d323320f35a31da}"
WORK="${WORK:?set WORK to a directory with at least 20 GB free}"
PREFIX="${PREFIX:-$WORK/llvm-$LLVM_VERSION-xtensa}"

mkdir -p "$WORK" && cd "$WORK"
tarball="llvm-project-$LLVM_VERSION.src.tar.xz"
[ -f "$tarball" ] || curl -fL -o "$tarball" "https://github.com/llvm/llvm-project/releases/download/llvmorg-$LLVM_VERSION/$tarball"
echo "$LLVM_SHA256  $tarball" | shasum -a 256 -c -
[ -d "llvm-project-$LLVM_VERSION.src" ] || tar xf "$tarball"

cmake -G Ninja -S "llvm-project-$LLVM_VERSION.src/llvm" -B "llvm-build-$LLVM_VERSION" \
  -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DLLVM_ENABLE_PROJECTS="clang;lld" -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=Xtensa \
  -DLLVM_ENABLE_ASSERTIONS=OFF -DLLVM_ENABLE_LIBXML2=OFF -DLLVM_ENABLE_ZSTD=OFF -DLLVM_ENABLE_ZLIB=OFF \
  -DLLVM_ENABLE_BINDINGS=OFF -DLLVM_ENABLE_LIBEDIT=OFF -DLLVM_ENABLE_LIBPFM=OFF -DLLVM_ENABLE_OCAMLDOC=OFF \
  -DLLVM_ENABLE_PLUGINS=OFF -DLLVM_ENABLE_Z3_SOLVER=OFF \
  -DLLVM_INCLUDE_TESTS=OFF -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_INCLUDE_BENCHMARKS=OFF -DLLVM_INCLUDE_DOCS=OFF \
  -DCLANG_INCLUDE_TESTS=OFF -DCLANG_ENABLE_ARCMT=OFF -DCLANG_ENABLE_STATIC_ANALYZER=OFF -DCLANG_PLUGIN_SUPPORT=OFF
ninja -C "llvm-build-$LLVM_VERSION" install
"$PREFIX/bin/llvm-config" --version --targets-built
