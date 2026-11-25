# Zig for ESP32-S3 (Xtensa) from upstream sources

Notes and scripts from building Zig and LLVM from their upstream sources (no third-party Zig binary) and running a Zig object inside an ESP-IDF app on an ESP32-S3. Everything below was observed on one machine (macOS, arm64); anything not listed under "Observed" was not tested.

## Why this exists
Zig's prebuilt releases do not ship the Xtensa backend. The Zig issue "Xtensa Support" (ziglang/zig#5467) was closed on 2026-05-06 with: "The Xtensa backend is wired up in 0.17.0. But as it's still experimental in LLVM, you will need to build both LLVM and Zig from source to use it." This repository records that build and what happened.

## Observed
| Zig | LLVM | `std.fmt.bufPrint` object for `-mcpu=esp32` |
|---|---|---|
| 0.17.0 (source tarball) | 22.1.8 + experimental Xtensa | fails: `error: <unknown>:0: fixup value must be 4-byte aligned` |
| 0.18.0-dev.1279+81de6a1c6 (master, 2026-11-23) | 23.1.6 + experimental Xtensa | builds with `-fno-PIC`; without it: `PIC relocations are not supported` |

- The same bitcode (`repro/bufprint.bc`, emitted by the Zig 0.17.0 build above from `repro/bufprint.zig` with `-mcpu=esp32 -O ReleaseSmall`) run through standalone `llc -mtriple=xtensa -mcpu=esp32 -O2 -filetype=obj` fails on 22.1.8 and produces a 7820-byte object on 23.1.6, so the failure is in the LLVM Xtensa backend, not in Zig. Smaller examples (`switch`, `f32`, `u64`, `std.hash.Wyhash`) compile on 22.1.8. The change in LLVM between 22.1.8 and 23.1.6 that fixes it was not identified.
- Neither LLVM 22.1.8 nor 23.1.6 recognizes `esp32s3`; the CPU list in Zig 0.17.0 is `esp32`, `esp8266`, `generic`, and in the master build `esp32`, `esp32s2`, `esp8266`, `xtensa`. The ESP32-S3 object in the example below was built with `-mcpu=esp32`.
- `example/` is an ESP-IDF 5.5.5 project whose `app_main` is written in Zig. Built with the master Zig above, flashed to an ESP32-S3 board, it printed `zig says hello 0` through `9` on the serial console.
- Build times on a 14-core, 48 GiB machine: LLVM 23.1.6 (clang, lld, all default targets plus Xtensa) 881 s, Zig master 552 s. LLVM 22.1.8: 698 s, Zig 0.17.0: 2359 s. Disk use for LLVM 22.1.8: 5.0 GB build tree, 3.6 GB install.

## Source checksums
| File | SHA-256 |
|---|---|
| `zig-0.17.0.tar.xz` | `b6c7f1728f043700d6529bac980800792f824256a9d2f1839b3d62beed0b8abd` (matches ziglang.org `index.json`) |
| `llvm-project-22.1.8.src.tar.xz` | `922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888` |
| `llvm-project-23.1.6.src.tar.xz` | `d3b86ab29cfb4445a6652e5c2642ccc75e04e38084dde3701d323320f35a31da` |
| `zig-0.18.0-dev.1279+81de6a1c6.tar.xz` | `8bc295332599ee71…` (first 16 hex digits recorded; the full value is in `index.json`) |

LLVM publishes no checksums for its release tarballs; the values above are what the download produced.

## Build
```
export WORK=/path/with/free/space
scripts/build-llvm.sh                                  # LLVM + Clang + LLD with the experimental Xtensa target
ZIG_URL=... ZIG_SHA256=... LLVM_PREFIX=$WORK/llvm-23.1.6-xtensa scripts/build-zig.sh
```
Zig 0.17.x needs LLVM 22.x, Zig master (0.18.0-dev) needs LLVM 23.x (`find_package(llvm N)` in each `CMakeLists.txt`); set `LLVM_VERSION` and `LLVM_SHA256` for `build-llvm.sh` accordingly. The scripts repeat the commands that were run, but they were not re-run as scripts.

## Not tested
- Anything beyond `app_main` printing text: no I2C, SPI, display, Wi-Fi, BLE, deep or light sleep from Zig code.
- Whether code built with `-mcpu=esp32` is correct on ESP32-S3 in general (the S3 differs from the ESP32).
- Other hosts than macOS arm64, other ESP32 variants, ESP-IDF versions other than 5.5.5.
- `kassane/zig-esp-idf-sample`: its `build.zig` targets Zig 0.17 and fails on the master build (`Target.riscv.cpu` has no member `generic_rv32`).

## Related
- Espressif's LLVM fork has a larger Xtensa backend than upstream (43 files, 878 KB vs 33 files, 433 KB in `llvm/lib/Target/Xtensa` when measured) and is what third-party prebuilt Zig/Xtensa releases use. This repository does not use it.
