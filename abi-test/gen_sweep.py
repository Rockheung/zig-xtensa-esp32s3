SIZES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 16, 17, 20, 24, 28, 32]
CT = {"u8": "uint8_t", "u16": "uint16_t", "u32": "uint32_t", "u64": "uint64_t", "f32": "float", "f64": "double"}

def fld(acc, zt):
    return (acc, CT[zt], zt, "f" if zt[0] == "f" else "i")

def scalar(name, spec, cvals, zvals):
    names = "abcdefgh"
    fields = [fld("{v}." + names[i], zt) for i, zt in enumerate(spec)]
    return dict(
        name=name, fields=fields,
        c_decl="typedef struct { " + " ".join(f"{CT[zt]} {names[i]};" for i, zt in enumerate(spec)) + f" }} {name};",
        z_decl=f"const {name} = extern struct {{ " + ", ".join(f"{names[i]}: {zt}" for i, zt in enumerate(spec)) + " };",
        c_init="{" + ", ".join(cvals) + "}",
        z_init=".{ " + ", ".join(f".{names[i]} = {v}" for i, v in enumerate(zvals)) + " }",
    )

types = []
for n in SIZES:
    vals = [str(3 + 2 * i) for i in range(n)]
    types.append(dict(
        name=f"B{n}", fields=[fld("{v}.b[%d]" % i, "u8") for i in range(n)],
        c_decl=f"typedef struct {{ uint8_t b[{n}]; }} B{n};",
        z_decl=f"const B{n} = extern struct {{ b: [{n}]u8 }};",
        c_init="{{" + ", ".join(vals) + "}}",
        z_init=".{ .b = .{ " + ", ".join(vals) + " } }",
    ))
types += [
    scalar("A8", ["u64"], ["0x1122334455667788ull"], ["0x1122334455667788"]),
    scalar("A16", ["u64", "u32"], ["0x1122334455667788ull", "9"], ["0x1122334455667788", "9"]),
    scalar("A16b", ["u32", "u64"], ["9", "0x1122334455667788ull"], ["9", "0x1122334455667788"]),
    scalar("M8", ["u8", "u32"], ["7", "0x01020304u"], ["7", "0x01020304"]),
    scalar("M12", ["u8", "u16", "u32"], ["7", "700", "0x01020304u"], ["7", "700", "0x01020304"]),
    scalar("F4", ["f32"], ["1.5f"], ["1.5"]),
    scalar("F8", ["f32", "f32"], ["1.5f", "2.5f"], ["1.5", "2.5"]),
    scalar("F12", ["f32", "f32", "f32"], ["1.5f", "2.5f", "3.5f"], ["1.5", "2.5", "3.5"]),
    scalar("D8", ["f64"], ["1.5"], ["1.5"]),
    scalar("D16", ["f64", "f64"], ["1.5", "2.5"], ["1.5", "2.5"]),
]

def csum(t):
    return " + ".join(f"(double){f[0].format(v='s')} * {i + 1}" for i, f in enumerate(t["fields"]))
def zsum(t):
    return " + ".join(
        (f"@as(f64, @floatFromInt({f[0].format(v='s')})) * {i + 1}" if f[3] == "i" else f"@as(f64, {f[0].format(v='s')}) * {i + 1}")
        for i, f in enumerate(t["fields"]))
def ceq(t):
    return " && ".join(f"{f[0].format(v='x')} == {f[0].format(v='y')}" for f in t["fields"])
def zeq(t):
    return " and ".join(f"{f[0].format(v='x')} == {f[0].format(v='y')}" for f in t["fields"])

c = ["#include <stdint.h>", "extern int abi_begin(const char *name);", "extern void abi_end(const char *name, int ok);", "#define ABI_CASE(name, expr) do { if (abi_begin(name)) abi_end(name, (expr)); } while (0)", ""]
z = ["extern fn abi_begin(name: [*:0]const u8) c_int;", "extern fn abi_end(name: [*:0]const u8, ok: c_int) void;", ""]
c += [t["c_decl"] for t in types] + [""]
z += [t["z_decl"] for t in types] + [""]
for t in types:
    n = t["name"]
    for pre, other in (("c", "z"), ("z", "c")):
        pass
for side in "cz":
    for t in types:
        n = t["name"]
        if side == "c":
            cs = csum(t)
            c.append(f"double c_{n}_first({n} s, int32_t k) {{ return k * 1000.0 + {cs}; }}")
            c.append(f"double c_{n}_odd(int32_t a0, {n} s, int32_t k) {{ return a0 * 7.0 + k * 1000.0 + {cs}; }}")
            c.append(f"double c_{n}_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, {n} s, int32_t k) {{ return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + {cs}; }}")
            body = " ".join(f"{f[0].format(v='r')} = ({f[1]})(seed + {i});" for i, f in enumerate(t["fields"]))
            c.append(f"{n} c_{n}_ret(uint32_t seed) {{ {n} r; {body} return r; }}")
        else:
            zs = zsum(t)
            z.append(f"export fn z_{n}_first(s: {n}, k: i32) f64 {{ return @as(f64, @floatFromInt(k)) * 1000.0 + {zs}; }}")
            z.append(f"export fn z_{n}_odd(a0: i32, s: {n}, k: i32) f64 {{ return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + {zs}; }}")
            z.append(f"export fn z_{n}_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: {n}, k: i32) f64 {{ return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + {zs}; }}")
            lines = []
            for i, f in enumerate(t["fields"]):
                acc = f[0].format(v="r")
                if f[3] == "f":
                    lines.append(f"{acc} = @as({f[2]}, @floatFromInt(seed +% {i}));")
                elif f[2] == "u64":
                    lines.append(f"{acc} = @as(u64, seed +% {i});")
                else:
                    lines.append(f"{acc} = @as({f[2]}, @truncate(seed +% {i}));")
            z.append(f"export fn z_{n}_ret(seed: u32) {n} {{ var r: {n} = undefined; {' '.join(lines)} return r; }}")
c.append("")
z.append("")
for t in types:
    n = t["name"]
    c.append(f"extern double z_{n}_first({n}, int32_t);")
    c.append(f"extern double z_{n}_odd(int32_t, {n}, int32_t);")
    c.append(f"extern double z_{n}_late(int32_t, int32_t, int32_t, int32_t, int32_t, {n}, int32_t);")
    c.append(f"extern {n} z_{n}_ret(uint32_t);")
    z.append(f"extern fn c_{n}_first({n}, i32) f64;")
    z.append(f"extern fn c_{n}_odd(i32, {n}, i32) f64;")
    z.append(f"extern fn c_{n}_late(i32, i32, i32, i32, i32, {n}, i32) f64;")
    z.append(f"extern fn c_{n}_ret(u32) {n};")
c.append("void c_sweep(void)\n{")

z.append("export fn z_sweep() void {")
for t in types:
    n = t["name"]
    c.append(f"    {{\n        {n} v = {t['c_init']};")
    c.append(f"        ABI_CASE(\"c->z {n} first\", z_{n}_first(v, 7) == c_{n}_first(v, 7));")
    c.append(f"        ABI_CASE(\"c->z {n} odd\", z_{n}_odd(3, v, 7) == c_{n}_odd(3, v, 7));")
    c.append(f"        ABI_CASE(\"c->z {n} late\", z_{n}_late(1, 2, 3, 4, 5, v, 7) == c_{n}_late(1, 2, 3, 4, 5, v, 7));")
    c.append(f"        if (abi_begin(\"c->z {n} ret\")) {{\n            {n} x = z_{n}_ret(40), y = c_{n}_ret(40);\n            abi_end(\"c->z {n} ret\", {ceq(t)});\n        }}\n    }}")
    z.append(f"    {{\n        const v: {n} = {t['z_init']};")
    z.append(f"        if (abi_begin(\"z->c {n} first\") != 0) abi_end(\"z->c {n} first\", @intFromBool(c_{n}_first(v, 7) == z_{n}_first(v, 7)));")
    z.append(f"        if (abi_begin(\"z->c {n} odd\") != 0) abi_end(\"z->c {n} odd\", @intFromBool(c_{n}_odd(3, v, 7) == z_{n}_odd(3, v, 7)));")
    z.append(f"        if (abi_begin(\"z->c {n} late\") != 0) abi_end(\"z->c {n} late\", @intFromBool(c_{n}_late(1, 2, 3, 4, 5, v, 7) == z_{n}_late(1, 2, 3, 4, 5, v, 7)));")
    z.append(f"        if (abi_begin(\"z->c {n} ret\") != 0) {{\n            const x = c_{n}_ret(40);\n            const y = z_{n}_ret(40);\n            abi_end(\"z->c {n} ret\", @intFromBool({zeq(t)}));\n        }}\n    }}")
c.append("}")
z.append("}")
open("main/abi_sweep.c", "w").write("\n".join(c) + "\n")
open("main/abi_sweep.zig", "w").write("\n".join(z) + "\n")
