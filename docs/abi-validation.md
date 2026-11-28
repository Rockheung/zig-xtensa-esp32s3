# ABI validation: Zig (Xtensa) against ESP-IDF GCC

Everything here was observed with the Zig 0.18.0-dev.1279+81de6a1c6 build from this repository's scripts (LLVM 23.1.6 with the experimental Xtensa target), `-target xtensa-freestanding-none -mcpu=esp32 -fno-PIC`, ESP-IDF 5.5.5 (GCC 14.2.0, `xtensa-esp32s3-elf-gcc`), windowed ABI.

## Method
`abi-test/` is an ESP-IDF app whose `app_main` is C. The same functions exist twice, as `c_*` (GCC) and `z_*` (Zig, `export fn`). Each side calls the other side's function and compares the result with the result of its own implementation of the same function. A mismatch therefore means the values did not arrive intact. Cases: integer arguments beyond the six argument registers, 64-bit values, `float`/`double`, structs by value as parameter and return value (hand-written set and a generated sweep over struct sizes and argument positions: `first` = first parameter, `odd` = after one `int`, `late` = after five `int`), callbacks in both directions, C variadic callee called from Zig, Zig variadic callee called from C, stack alignment across nested cross-language calls, struct layouts and a C bitfield against a Zig `bitpack struct`.

A case that crashes is recorded as `CRASH`: the next boot finds the case in RTC memory, prints it, and resumes after it. `gen_sweep.py` generates `main/abi_sweep.c` and `main/abi_sweep.zig`.

Run: `ZIG=<zig> abi-test/qemu_build_run.sh <Debug|ReleaseSafe|ReleaseFast|ReleaseSmall> <out.txt>` (Espressif QEMU, `idf_tools.py install qemu-xtensa`; QEMU uses `sdkconfig.qemu`: UART console, 4 MB flash). `abi-test/matrix.py <out.txt>` prints the table below.

## Results
Hand-written set, 41 cases, `ReleaseFast`: the real ESP32-S3 board and QEMU give the same result, 32 pass and 9 fail, and the same 9 cases fail (`results/hw-handwritten-ReleaseFast.txt`, `results/qemu-ReleaseFast.txt`).

Passing: up to 10 `int32` arguments, mixed `u8/u64/u16/u64/u32`, `f32`, `f64`, structs of `u32` fields by value (8 and 12 bytes), struct of two `f64` by value, struct returns of `u32` fields (8, 16, 24 bytes), function pointers in both directions, a C variadic function called from Zig, 16-byte stack alignment, `sizeof`/`alignof`/`offsetof` of the tested structs, a C bitfield word against a Zig `bitpack struct(u32)`.

Failing: a struct of three `u8` as parameter and as return value, a struct containing `{u64, u8}` and a struct `{u32 v[6]}` as parameters, and a variadic function defined in Zig (`@cVaStart`/`@cVaArg`) called from C.

Sweep, `ReleaseFast` (identical in `ReleaseSafe`), QEMU: `.` pass, `F` wrong value, `X` crash.
```
type   | c->z: first odd late ret | z->c: first odd late ret
B1     |         .      .      .      .    |         .      .      .      .  
B2     |         F      F      F      F    |         F      F      F      F  
B3     |         F      F      F      F    |         F      F      F      F  
B4     |         F      F      F      F    |         F      F      F      F  
B5     |         F      F      F      X    |         F      F      F      F  
B6     |         F      F      F      X    |         F      F      F      F  
B7     |         F      F      F      X    |         F      F      F      F  
B8     |         F      F      F      X    |         F      F      F      F  
B9     |         F      F      F      X    |         F      F      F      F  
B12    |         F      F      F      X    |         F      F      F      F  
B13    |         F      F      F      X    |         F      F      F      F  
B16    |         F      F      F      X    |         F      F      F      F  
B17    |         F      F      F      .    |         F      F      F      .  
B20    |         F      F      F      .    |         F      F      F      .  
B24    |         F      F      F      .    |         F      F      F      .  
B28    |         F      F      F      .    |         F      F      F      .  
B32    |         F      F      F      .    |         F      F      F      .  
A8     |         .      .      .      .    |         .      .      .      .  
A16    |         F      F      F      X    |         F      F      F      F  
A16b   |         F      F      F      X    |         F      F      F      F  
M8     |         F      F      F      X    |         F      F      F      F  
M12    |         F      F      F      F    |         F      F      F      F  
F4     |         .      .      .      .    |         .      .      .      .  
F8     |         .      .      F      .    |         .      .      F      .  
F12    |         .      .      F      .    |         .      .      F      .  
D8     |         .      .      .      .    |         .      .      .      .  
D16    |         .      .      .      .    |         .      .      .      .  
{'PASS': 62, 'FAIL': 143, 'CRASH': 11}
```
- Byte-array structs `B<N>` (N bytes) fail from 2 bytes on as parameters in every position. Only `B1` and structs of one scalar `A8` (`u64`), `F4`, `D8` and of `f32`/`f64` fields `F8`, `F12`, `D16` pass, except that `F8` and `F12` fail when the struct follows five `int` arguments.
- Returning a struct of 5 to 16 bytes crashes when C calls the Zig function (`StoreProhibited`, `EXCVADDR` near zero, `A2` holds the caller's first argument), and returns wrong values when Zig calls the C function. Returns of 17 bytes and more agree.

## Cause
`abi-test/results/` and the disassembly of `c_B2_first(B2 s, int32_t k)` against `z_B2_first(s: B2, k: i32)`: GCC receives the 2-byte struct in `a2` and `k` in `a3`; Zig receives the first byte in `a2`, the second byte in `a3` and `k` in `a4`. Zig splits the struct into its elements, GCC passes it as one word.

In the Zig source (`x-zig-master` tarball, `src/codegen/llvm/FuncGen.zig`), `fnReturnStrat` (line 7646) and `ParamTypeIterator` (line 7090) have per-architecture C ABI classification for aarch64, arm, loongarch, mips, powerpc64, riscv, s390x and x86, and no Xtensa case; `grep -n xtensa src/codegen/llvm/FuncGen.zig` finds nothing. Xtensa falls into the generic path. `xtensa_windowed` and `xtensa_call0` exist as calling convention names (`src/codegen/llvm.zig`, line 4320) and map to the default LLVM calling convention. The rule that GCC applies for returns (up to 16 bytes in `a2`..`a5`, larger through a hidden pointer) is taken from the observed behaviour here, not from the ABI documentation.

## C ABI patch
`patches/zig-xtensa-c-abi.patch` applies with `patch -p1` to the Zig source of the build above (0.18.0-dev.1279+81de6a1c6). It adds `src/codegen/xtensa/abi.zig` and the `xtensa_call0`/`xtensa_windowed` cases in `FuncGen.zig`. The classification follows the rules in rustc's `compiler/rustc_target/src/callconv/xtensa.rs`; unlike that file, a hidden return pointer counts as one of the six argument registers.

QEMU, `ReleaseFast`, all 257 cases (`results/qemu-ReleaseFast.txt` before, `results/qemu-ReleaseFast-patched.txt` after):

| | PASS | FAIL | CRASH |
|---|---|---|---|
| unpatched | 94 | 152 | 11 |
| patched | 256 | 1 | 0 |

Every case that passed before still passes. The remaining failure is `c->z zig variadic callee`, which also fails unpatched; its cause is not analysed. Not tested with the patched compiler: real hardware, `ReleaseSafe`, vector types, call0. The sections above describe the unpatched compiler.

### `ReleaseSafe` and variadic callees
With the ABI patch alone, `ReleaseSafe` gives 256 PASS and 1 FAIL, the same case as `ReleaseFast`. With the ABI patch and a partial fix of `LowerVAARG` in LLVM 23.1.6 (later stack arguments no longer reset the index), a longer variadic case was added; both modes give 256 PASS and 2 FAIL (`results/qemu-ReleaseFast-patched.txt`, `results/qemu-ReleaseSafe-patched.txt`, 258 cases), the two failures being the Zig variadic callees.

## Optimization modes
| Mode | Result |
|---|---|
| `ReleaseFast`, `ReleaseSafe` | build, link, run; identical results |
| `ReleaseSmall` | `zig build-obj` succeeds but the object references `abi.check`, `abi.z_align`, `abi.z_st24` (calls to functions of the same object by a name that does not exist; the definitions are `z_align`, `z_st24` and a section `.text..Labi.check` without a symbol), so the link fails with `undefined reference` |
| `Debug` | `LLVM ERROR: Error while trying to spill A10 from class AR: Cannot scavenge register without an emergency spill slot!` while compiling the sweep; the smaller hand-written set alone compiles |

## What can be relied on
Scalars (integers up to 64 bits, `float`, `double`), pointers, function pointers, calls with more arguments than registers, structs whose only member is one scalar or whose members are `f32`/`f64`, C variadic calls from Zig, stack alignment and struct layout agree with GCC in the tested cases. Passing or returning structs with small integer members by value, structs containing arrays, and defining variadic functions in Zig do not agree with GCC; use pointers, or a `u32` carrying the packed value, at the boundary.

## Not covered
- `-mcpu=esp32` only; `esp32s3` is not a CPU name in the Zig/LLVM builds used here, and Espressif's LLVM fork was not compared.
- The call0 ABI was not tested.
- Sweep on real hardware: the run reproduced the same crash cases up to the tenth reboot and was then interrupted (`results/hw-sweep-partial-ReleaseFast.txt`); the full sweep result comes from QEMU.
- `-O` modes other than the four above, link-time optimization, cases with more than 8 struct members, nested structs, unions, `long double`.
