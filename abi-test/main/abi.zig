const std = @import("std");
comptime {
    _ = @import("abi_sweep.zig");
}

const S3b = extern struct { a: u8, b: u8, c: u8 };
const S8 = extern struct { a: u32, b: u32 };
const S12 = extern struct { a: u32, b: u32, c: u32 };
const S16 = extern struct { a: u32, b: u32, c: u32, d: u32 };
const S24 = extern struct { v: [6]u32 };
const S16a = extern struct { a: u64, b: u8 };
const D16 = extern struct { a: f64, b: f64 };
const BF = bitpack struct(u32) { a: u3, b: u5, c: u1, d: u7, e: u16 };
const Cb8 = *const fn (i32, i32, i32, i32, i32, i32, i32, i32) callconv(.c) i32;

extern fn abi_report(name: [*:0]const u8, ok: c_int) void;
extern fn c_args10(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) i32;
extern fn c_args8(i32, i32, i32, i32, i32, i32, i32, i32) i32;
extern fn c_mix64(u8, u64, u16, u64, u32) u64;
extern fn c_f32(f32, f32, f32) f32;
extern fn c_f64(f64, f32, f64, f32) f64;
extern fn c_st3(S3b, i32, S3b) u32;
extern fn c_st8(u8, S8, S12) u32;
extern fn c_st16(S16, S16a, i32) u32;
extern fn c_d16(i32, D16) f64;
extern fn c_st24(i32, S24, i32) u32;
extern fn c_ret3(u8) S3b;
extern fn c_ret8(u32) S8;
extern fn c_ret16(u32) S16;
extern fn c_ret24(u32) S24;
extern fn c_retd(f64) D16;
extern fn c_apply(Cb8) i32;
extern fn c_vsum(n: c_int, ...) f64;
extern fn c_vsum_va(n: c_int, ap: std.builtin.VaList) f64;
extern fn c_align(depth: c_int) u32;
extern fn c_bf_raw() u32;
extern const c_layout: [11]u32;

export fn z_args10(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, a5: i32, a6: i32, a7: i32, a8: i32, a9: i32) i32 {
    return a0 *% 1 +% a1 *% 2 +% a2 *% 3 +% a3 *% 4 +% a4 *% 5 +% a5 *% 6 +% a6 *% 7 +% a7 *% 8 +% a8 *% 9 +% a9 *% 10;
}
export fn z_args8(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, a5: i32, a6: i32, a7: i32) i32 {
    return a0 *% 1 +% a1 *% 2 +% a2 *% 3 +% a3 *% 4 +% a4 *% 5 +% a5 *% 6 +% a6 *% 7 +% a7 *% 8;
}
export fn z_mix64(a: u8, b: u64, c: u16, d: u64, e: u32) u64 {
    return @as(u64, a) +% b *% 3 +% @as(u64, c) *% 5 +% d *% 7 +% @as(u64, e) *% 11;
}
export fn z_f32(a: f32, b: f32, c: f32) f32 {
    return a * 2 + b * 3 + c * 5;
}
export fn z_f64(a: f64, b: f32, c: f64, d: f32) f64 {
    return a + b * 2 + c * 4 + d * 8;
}
export fn z_st3(s: S3b, k: i32, t: S3b) u32 {
    return @as(u32, s.a) +% 2 *% @as(u32, s.b) +% 3 *% @as(u32, s.c) +% 100 *% @as(u32, @bitCast(k)) +% 7 *% @as(u32, t.a) +% 11 *% @as(u32, t.b) +% 13 *% @as(u32, t.c);
}
export fn z_st8(k: u8, s: S8, t: S12) u32 {
    return @as(u32, k) +% 2 *% s.a +% 3 *% s.b +% 5 *% t.a +% 7 *% t.b +% 11 *% t.c;
}
export fn z_st16(s: S16, u: S16a, k: i32) u32 {
    return s.a +% 2 *% s.b +% 3 *% s.c +% 4 *% s.d +% 5 *% @as(u32, @truncate(u.a)) +% 6 *% @as(u32, u.b) +% 7 *% @as(u32, @bitCast(k));
}
export fn z_d16(k: i32, d: D16) f64 {
    return @as(f64, @floatFromInt(k)) + d.a * 2 + d.b * 4;
}
export fn z_st24(k: i32, s: S24, m: i32) u32 {
    var r: u32 = @as(u32, @bitCast(k)) *% 3 +% @as(u32, @bitCast(m)) *% 5;
    for (s.v, 0..) |x, i| r +%= x *% @as(u32, @intCast(i + 1));
    return r;
}
export fn z_ret3(a: u8) S3b {
    return .{ .a = a, .b = a + 1, .c = a + 2 };
}
export fn z_ret8(a: u32) S8 {
    return .{ .a = a, .b = a + 1 };
}
export fn z_ret16(a: u32) S16 {
    return .{ .a = a, .b = a + 1, .c = a + 2, .d = a + 3 };
}
export fn z_ret24(a: u32) S24 {
    return .{ .v = .{ a, a + 1, a + 2, a + 3, a + 4, a + 5 } };
}
export fn z_ret_d(a: f64) D16 {
    return .{ .a = a, .b = a * 2 };
}
export fn z_apply(cb: Cb8) i32 {
    return cb(1, 2, 3, 4, 5, 6, 7, 8);
}
export fn z_vfwd(n: c_int, ...) callconv(.c) f64 {
    var ap = @cVaStart();
    defer @cVaEnd(&ap);
    return c_vsum_va(n, ap);
}
export fn z_vsum(n: c_int, ...) callconv(.c) f64 {
    var ap = @cVaStart();
    defer @cVaEnd(&ap);
    var sum: f64 = 0;
    var i: c_int = 0;
    while (i < n) : (i += 1) {
        switch (@mod(i, 3)) {
            0 => sum += @as(f64, @floatFromInt(@cVaArg(&ap, c_int))),
            1 => sum += @as(f64, @floatFromInt(@cVaArg(&ap, i64))),
            else => sum += @cVaArg(&ap, f64),
        }
    }
    return sum;
}
export fn z_align(depth: c_int) u32 {
    var buf: [32]u8 align(16) = undefined;
    const p: *volatile [32]u8 = &buf;
    p[0] = 1;
    var r: u32 = @intCast(@intFromPtr(p) & 15);
    if (depth > 0) r |= c_align(depth - 1);
    return r;
}
export fn z_bf_raw() u32 {
    const b = BF{ .a = 5, .b = 19, .c = 1, .d = 100, .e = 0xABCD };
    return @bitCast(b);
}

fn check(name: [*:0]const u8, ok: bool) void {
    abi_report(name, @intFromBool(ok));
}

export fn z_run() void {
    check("z->c args10", c_args10(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) == z_args10(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));
    check("z->c mix64", c_mix64(200, 0x123456789ABCDEF, 60000, 0xFEDCBA9876543210, 0xDEADBEEF) == z_mix64(200, 0x123456789ABCDEF, 60000, 0xFEDCBA9876543210, 0xDEADBEEF));
    check("z->c f32", c_f32(1.5, 2.25, 0.5) == z_f32(1.5, 2.25, 0.5));
    check("z->c f64", c_f64(1.5, 2.25, 0.125, 4.5) == z_f64(1.5, 2.25, 0.125, 4.5));
    const s3 = S3b{ .a = 10, .b = 20, .c = 30 };
    const t3 = S3b{ .a = 3, .b = 5, .c = 7 };
    check("z->c struct3 by value", c_st3(s3, 9, t3) == z_st3(s3, 9, t3));
    const s8 = S8{ .a = 0x11111111, .b = 0x22222222 };
    const s12 = S12{ .a = 1, .b = 2, .c = 3 };
    check("z->c struct8/12 by value", c_st8(7, s8, s12) == z_st8(7, s8, s12));
    const s16 = S16{ .a = 1, .b = 2, .c = 3, .d = 4 };
    const s16a = S16a{ .a = 0x1122334455667788, .b = 9 };
    check("z->c struct16/16a by value", c_st16(s16, s16a, 5) == z_st16(s16, s16a, 5));
    const d16 = D16{ .a = 1.5, .b = 2.5 };
    check("z->c struct double2 by value", c_d16(3, d16) == z_d16(3, d16));
    const s24 = S24{ .v = .{ 1, 2, 3, 4, 5, 6 } };
    check("z->c struct24 by value", c_st24(2, s24, 4) == z_st24(2, s24, 4));
    const r3 = c_ret3(40);
    const e3 = z_ret3(40);
    check("z->c return struct3", r3.a == e3.a and r3.b == e3.b and r3.c == e3.c);
    const r8 = c_ret8(100);
    const e8 = z_ret8(100);
    check("z->c return struct8", r8.a == e8.a and r8.b == e8.b);
    const r16 = c_ret16(200);
    const e16 = z_ret16(200);
    check("z->c return struct16", r16.a == e16.a and r16.b == e16.b and r16.c == e16.c and r16.d == e16.d);
    const r24 = c_ret24(300);
    const e24 = z_ret24(300);
    check("z->c return struct24", r24.v[0] == e24.v[0] and r24.v[1] == e24.v[1] and r24.v[2] == e24.v[2] and r24.v[3] == e24.v[3] and r24.v[4] == e24.v[4] and r24.v[5] == e24.v[5]);
    const rd = c_retd(1.25);
    const ed = z_ret_d(1.25);
    check("z->c return struct double2", rd.a == ed.a and rd.b == ed.b);
    check("z->c callback zig fn in c", c_apply(&z_args8) == z_args8(1, 2, 3, 4, 5, 6, 7, 8));
    check("z->c c variadic callee", c_vsum(6, @as(c_int, 1), @as(i64, 2), @as(f64, 3.5), @as(c_int, 4), @as(i64, 5), @as(f64, 6.5)) == 22.0);
    check("z stack align nest 5", (z_align(5) | c_align(5)) == 0);
    check("z bitfield raw", z_bf_raw() == c_bf_raw());
    check("layout S3b size/align", c_layout[0] == @sizeOf(S3b) and c_layout[1] == @alignOf(S3b));
    check("layout S8/S12/S24 size", c_layout[2] == @sizeOf(S8) and c_layout[3] == @sizeOf(S12) and c_layout[4] == @sizeOf(S24));
    check("layout S16a", c_layout[5] == @sizeOf(S16a) and c_layout[6] == @alignOf(S16a) and c_layout[7] == @offsetOf(S16a, "b"));
    check("layout D16", c_layout[8] == @sizeOf(D16) and c_layout[9] == @alignOf(D16));
    check("layout BF size", c_layout[10] == @sizeOf(BF));
}
