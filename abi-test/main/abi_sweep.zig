extern fn abi_begin(name: [*:0]const u8) c_int;
extern fn abi_end(name: [*:0]const u8, ok: c_int) void;

const B1 = extern struct { b: [1]u8 };
const B2 = extern struct { b: [2]u8 };
const B3 = extern struct { b: [3]u8 };
const B4 = extern struct { b: [4]u8 };
const B5 = extern struct { b: [5]u8 };
const B6 = extern struct { b: [6]u8 };
const B7 = extern struct { b: [7]u8 };
const B8 = extern struct { b: [8]u8 };
const B9 = extern struct { b: [9]u8 };
const B12 = extern struct { b: [12]u8 };
const B13 = extern struct { b: [13]u8 };
const B16 = extern struct { b: [16]u8 };
const B17 = extern struct { b: [17]u8 };
const B20 = extern struct { b: [20]u8 };
const B24 = extern struct { b: [24]u8 };
const B28 = extern struct { b: [28]u8 };
const B32 = extern struct { b: [32]u8 };
const A8 = extern struct { a: u64 };
const A16 = extern struct { a: u64, b: u32 };
const A16b = extern struct { a: u32, b: u64 };
const M8 = extern struct { a: u8, b: u32 };
const M12 = extern struct { a: u8, b: u16, c: u32 };
const F4 = extern struct { a: f32 };
const F8 = extern struct { a: f32, b: f32 };
const F12 = extern struct { a: f32, b: f32, c: f32 };
const D8 = extern struct { a: f64 };
const D16 = extern struct { a: f64, b: f64 };

export fn z_B1_first(s: B1, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1; }
export fn z_B1_odd(a0: i32, s: B1, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1; }
export fn z_B1_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B1, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1; }
export fn z_B1_ret(seed: u32) B1 { var r: B1 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); return r; }
export fn z_B2_first(s: B2, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2; }
export fn z_B2_odd(a0: i32, s: B2, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2; }
export fn z_B2_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B2, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2; }
export fn z_B2_ret(seed: u32) B2 { var r: B2 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); return r; }
export fn z_B3_first(s: B3, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3; }
export fn z_B3_odd(a0: i32, s: B3, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3; }
export fn z_B3_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B3, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3; }
export fn z_B3_ret(seed: u32) B3 { var r: B3 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); return r; }
export fn z_B4_first(s: B4, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4; }
export fn z_B4_odd(a0: i32, s: B4, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4; }
export fn z_B4_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B4, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4; }
export fn z_B4_ret(seed: u32) B4 { var r: B4 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); return r; }
export fn z_B5_first(s: B5, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5; }
export fn z_B5_odd(a0: i32, s: B5, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5; }
export fn z_B5_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B5, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5; }
export fn z_B5_ret(seed: u32) B5 { var r: B5 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); return r; }
export fn z_B6_first(s: B6, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6; }
export fn z_B6_odd(a0: i32, s: B6, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6; }
export fn z_B6_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B6, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6; }
export fn z_B6_ret(seed: u32) B6 { var r: B6 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); r.b[5] = @as(u8, @truncate(seed +% 5)); return r; }
export fn z_B7_first(s: B7, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7; }
export fn z_B7_odd(a0: i32, s: B7, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7; }
export fn z_B7_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B7, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7; }
export fn z_B7_ret(seed: u32) B7 { var r: B7 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); r.b[5] = @as(u8, @truncate(seed +% 5)); r.b[6] = @as(u8, @truncate(seed +% 6)); return r; }
export fn z_B8_first(s: B8, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8; }
export fn z_B8_odd(a0: i32, s: B8, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8; }
export fn z_B8_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B8, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8; }
export fn z_B8_ret(seed: u32) B8 { var r: B8 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); r.b[5] = @as(u8, @truncate(seed +% 5)); r.b[6] = @as(u8, @truncate(seed +% 6)); r.b[7] = @as(u8, @truncate(seed +% 7)); return r; }
export fn z_B9_first(s: B9, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9; }
export fn z_B9_odd(a0: i32, s: B9, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9; }
export fn z_B9_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B9, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9; }
export fn z_B9_ret(seed: u32) B9 { var r: B9 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); r.b[5] = @as(u8, @truncate(seed +% 5)); r.b[6] = @as(u8, @truncate(seed +% 6)); r.b[7] = @as(u8, @truncate(seed +% 7)); r.b[8] = @as(u8, @truncate(seed +% 8)); return r; }
export fn z_B12_first(s: B12, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12; }
export fn z_B12_odd(a0: i32, s: B12, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12; }
export fn z_B12_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B12, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12; }
export fn z_B12_ret(seed: u32) B12 { var r: B12 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); r.b[5] = @as(u8, @truncate(seed +% 5)); r.b[6] = @as(u8, @truncate(seed +% 6)); r.b[7] = @as(u8, @truncate(seed +% 7)); r.b[8] = @as(u8, @truncate(seed +% 8)); r.b[9] = @as(u8, @truncate(seed +% 9)); r.b[10] = @as(u8, @truncate(seed +% 10)); r.b[11] = @as(u8, @truncate(seed +% 11)); return r; }
export fn z_B13_first(s: B13, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13; }
export fn z_B13_odd(a0: i32, s: B13, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13; }
export fn z_B13_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B13, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13; }
export fn z_B13_ret(seed: u32) B13 { var r: B13 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); r.b[5] = @as(u8, @truncate(seed +% 5)); r.b[6] = @as(u8, @truncate(seed +% 6)); r.b[7] = @as(u8, @truncate(seed +% 7)); r.b[8] = @as(u8, @truncate(seed +% 8)); r.b[9] = @as(u8, @truncate(seed +% 9)); r.b[10] = @as(u8, @truncate(seed +% 10)); r.b[11] = @as(u8, @truncate(seed +% 11)); r.b[12] = @as(u8, @truncate(seed +% 12)); return r; }
export fn z_B16_first(s: B16, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16; }
export fn z_B16_odd(a0: i32, s: B16, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16; }
export fn z_B16_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B16, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16; }
export fn z_B16_ret(seed: u32) B16 { var r: B16 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); r.b[5] = @as(u8, @truncate(seed +% 5)); r.b[6] = @as(u8, @truncate(seed +% 6)); r.b[7] = @as(u8, @truncate(seed +% 7)); r.b[8] = @as(u8, @truncate(seed +% 8)); r.b[9] = @as(u8, @truncate(seed +% 9)); r.b[10] = @as(u8, @truncate(seed +% 10)); r.b[11] = @as(u8, @truncate(seed +% 11)); r.b[12] = @as(u8, @truncate(seed +% 12)); r.b[13] = @as(u8, @truncate(seed +% 13)); r.b[14] = @as(u8, @truncate(seed +% 14)); r.b[15] = @as(u8, @truncate(seed +% 15)); return r; }
export fn z_B17_first(s: B17, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17; }
export fn z_B17_odd(a0: i32, s: B17, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17; }
export fn z_B17_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B17, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17; }
export fn z_B17_ret(seed: u32) B17 { var r: B17 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); r.b[5] = @as(u8, @truncate(seed +% 5)); r.b[6] = @as(u8, @truncate(seed +% 6)); r.b[7] = @as(u8, @truncate(seed +% 7)); r.b[8] = @as(u8, @truncate(seed +% 8)); r.b[9] = @as(u8, @truncate(seed +% 9)); r.b[10] = @as(u8, @truncate(seed +% 10)); r.b[11] = @as(u8, @truncate(seed +% 11)); r.b[12] = @as(u8, @truncate(seed +% 12)); r.b[13] = @as(u8, @truncate(seed +% 13)); r.b[14] = @as(u8, @truncate(seed +% 14)); r.b[15] = @as(u8, @truncate(seed +% 15)); r.b[16] = @as(u8, @truncate(seed +% 16)); return r; }
export fn z_B20_first(s: B20, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17 + @as(f64, @floatFromInt(s.b[17])) * 18 + @as(f64, @floatFromInt(s.b[18])) * 19 + @as(f64, @floatFromInt(s.b[19])) * 20; }
export fn z_B20_odd(a0: i32, s: B20, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17 + @as(f64, @floatFromInt(s.b[17])) * 18 + @as(f64, @floatFromInt(s.b[18])) * 19 + @as(f64, @floatFromInt(s.b[19])) * 20; }
export fn z_B20_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B20, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17 + @as(f64, @floatFromInt(s.b[17])) * 18 + @as(f64, @floatFromInt(s.b[18])) * 19 + @as(f64, @floatFromInt(s.b[19])) * 20; }
export fn z_B20_ret(seed: u32) B20 { var r: B20 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); r.b[5] = @as(u8, @truncate(seed +% 5)); r.b[6] = @as(u8, @truncate(seed +% 6)); r.b[7] = @as(u8, @truncate(seed +% 7)); r.b[8] = @as(u8, @truncate(seed +% 8)); r.b[9] = @as(u8, @truncate(seed +% 9)); r.b[10] = @as(u8, @truncate(seed +% 10)); r.b[11] = @as(u8, @truncate(seed +% 11)); r.b[12] = @as(u8, @truncate(seed +% 12)); r.b[13] = @as(u8, @truncate(seed +% 13)); r.b[14] = @as(u8, @truncate(seed +% 14)); r.b[15] = @as(u8, @truncate(seed +% 15)); r.b[16] = @as(u8, @truncate(seed +% 16)); r.b[17] = @as(u8, @truncate(seed +% 17)); r.b[18] = @as(u8, @truncate(seed +% 18)); r.b[19] = @as(u8, @truncate(seed +% 19)); return r; }
export fn z_B24_first(s: B24, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17 + @as(f64, @floatFromInt(s.b[17])) * 18 + @as(f64, @floatFromInt(s.b[18])) * 19 + @as(f64, @floatFromInt(s.b[19])) * 20 + @as(f64, @floatFromInt(s.b[20])) * 21 + @as(f64, @floatFromInt(s.b[21])) * 22 + @as(f64, @floatFromInt(s.b[22])) * 23 + @as(f64, @floatFromInt(s.b[23])) * 24; }
export fn z_B24_odd(a0: i32, s: B24, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17 + @as(f64, @floatFromInt(s.b[17])) * 18 + @as(f64, @floatFromInt(s.b[18])) * 19 + @as(f64, @floatFromInt(s.b[19])) * 20 + @as(f64, @floatFromInt(s.b[20])) * 21 + @as(f64, @floatFromInt(s.b[21])) * 22 + @as(f64, @floatFromInt(s.b[22])) * 23 + @as(f64, @floatFromInt(s.b[23])) * 24; }
export fn z_B24_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B24, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17 + @as(f64, @floatFromInt(s.b[17])) * 18 + @as(f64, @floatFromInt(s.b[18])) * 19 + @as(f64, @floatFromInt(s.b[19])) * 20 + @as(f64, @floatFromInt(s.b[20])) * 21 + @as(f64, @floatFromInt(s.b[21])) * 22 + @as(f64, @floatFromInt(s.b[22])) * 23 + @as(f64, @floatFromInt(s.b[23])) * 24; }
export fn z_B24_ret(seed: u32) B24 { var r: B24 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); r.b[5] = @as(u8, @truncate(seed +% 5)); r.b[6] = @as(u8, @truncate(seed +% 6)); r.b[7] = @as(u8, @truncate(seed +% 7)); r.b[8] = @as(u8, @truncate(seed +% 8)); r.b[9] = @as(u8, @truncate(seed +% 9)); r.b[10] = @as(u8, @truncate(seed +% 10)); r.b[11] = @as(u8, @truncate(seed +% 11)); r.b[12] = @as(u8, @truncate(seed +% 12)); r.b[13] = @as(u8, @truncate(seed +% 13)); r.b[14] = @as(u8, @truncate(seed +% 14)); r.b[15] = @as(u8, @truncate(seed +% 15)); r.b[16] = @as(u8, @truncate(seed +% 16)); r.b[17] = @as(u8, @truncate(seed +% 17)); r.b[18] = @as(u8, @truncate(seed +% 18)); r.b[19] = @as(u8, @truncate(seed +% 19)); r.b[20] = @as(u8, @truncate(seed +% 20)); r.b[21] = @as(u8, @truncate(seed +% 21)); r.b[22] = @as(u8, @truncate(seed +% 22)); r.b[23] = @as(u8, @truncate(seed +% 23)); return r; }
export fn z_B28_first(s: B28, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17 + @as(f64, @floatFromInt(s.b[17])) * 18 + @as(f64, @floatFromInt(s.b[18])) * 19 + @as(f64, @floatFromInt(s.b[19])) * 20 + @as(f64, @floatFromInt(s.b[20])) * 21 + @as(f64, @floatFromInt(s.b[21])) * 22 + @as(f64, @floatFromInt(s.b[22])) * 23 + @as(f64, @floatFromInt(s.b[23])) * 24 + @as(f64, @floatFromInt(s.b[24])) * 25 + @as(f64, @floatFromInt(s.b[25])) * 26 + @as(f64, @floatFromInt(s.b[26])) * 27 + @as(f64, @floatFromInt(s.b[27])) * 28; }
export fn z_B28_odd(a0: i32, s: B28, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17 + @as(f64, @floatFromInt(s.b[17])) * 18 + @as(f64, @floatFromInt(s.b[18])) * 19 + @as(f64, @floatFromInt(s.b[19])) * 20 + @as(f64, @floatFromInt(s.b[20])) * 21 + @as(f64, @floatFromInt(s.b[21])) * 22 + @as(f64, @floatFromInt(s.b[22])) * 23 + @as(f64, @floatFromInt(s.b[23])) * 24 + @as(f64, @floatFromInt(s.b[24])) * 25 + @as(f64, @floatFromInt(s.b[25])) * 26 + @as(f64, @floatFromInt(s.b[26])) * 27 + @as(f64, @floatFromInt(s.b[27])) * 28; }
export fn z_B28_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B28, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17 + @as(f64, @floatFromInt(s.b[17])) * 18 + @as(f64, @floatFromInt(s.b[18])) * 19 + @as(f64, @floatFromInt(s.b[19])) * 20 + @as(f64, @floatFromInt(s.b[20])) * 21 + @as(f64, @floatFromInt(s.b[21])) * 22 + @as(f64, @floatFromInt(s.b[22])) * 23 + @as(f64, @floatFromInt(s.b[23])) * 24 + @as(f64, @floatFromInt(s.b[24])) * 25 + @as(f64, @floatFromInt(s.b[25])) * 26 + @as(f64, @floatFromInt(s.b[26])) * 27 + @as(f64, @floatFromInt(s.b[27])) * 28; }
export fn z_B28_ret(seed: u32) B28 { var r: B28 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); r.b[5] = @as(u8, @truncate(seed +% 5)); r.b[6] = @as(u8, @truncate(seed +% 6)); r.b[7] = @as(u8, @truncate(seed +% 7)); r.b[8] = @as(u8, @truncate(seed +% 8)); r.b[9] = @as(u8, @truncate(seed +% 9)); r.b[10] = @as(u8, @truncate(seed +% 10)); r.b[11] = @as(u8, @truncate(seed +% 11)); r.b[12] = @as(u8, @truncate(seed +% 12)); r.b[13] = @as(u8, @truncate(seed +% 13)); r.b[14] = @as(u8, @truncate(seed +% 14)); r.b[15] = @as(u8, @truncate(seed +% 15)); r.b[16] = @as(u8, @truncate(seed +% 16)); r.b[17] = @as(u8, @truncate(seed +% 17)); r.b[18] = @as(u8, @truncate(seed +% 18)); r.b[19] = @as(u8, @truncate(seed +% 19)); r.b[20] = @as(u8, @truncate(seed +% 20)); r.b[21] = @as(u8, @truncate(seed +% 21)); r.b[22] = @as(u8, @truncate(seed +% 22)); r.b[23] = @as(u8, @truncate(seed +% 23)); r.b[24] = @as(u8, @truncate(seed +% 24)); r.b[25] = @as(u8, @truncate(seed +% 25)); r.b[26] = @as(u8, @truncate(seed +% 26)); r.b[27] = @as(u8, @truncate(seed +% 27)); return r; }
export fn z_B32_first(s: B32, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17 + @as(f64, @floatFromInt(s.b[17])) * 18 + @as(f64, @floatFromInt(s.b[18])) * 19 + @as(f64, @floatFromInt(s.b[19])) * 20 + @as(f64, @floatFromInt(s.b[20])) * 21 + @as(f64, @floatFromInt(s.b[21])) * 22 + @as(f64, @floatFromInt(s.b[22])) * 23 + @as(f64, @floatFromInt(s.b[23])) * 24 + @as(f64, @floatFromInt(s.b[24])) * 25 + @as(f64, @floatFromInt(s.b[25])) * 26 + @as(f64, @floatFromInt(s.b[26])) * 27 + @as(f64, @floatFromInt(s.b[27])) * 28 + @as(f64, @floatFromInt(s.b[28])) * 29 + @as(f64, @floatFromInt(s.b[29])) * 30 + @as(f64, @floatFromInt(s.b[30])) * 31 + @as(f64, @floatFromInt(s.b[31])) * 32; }
export fn z_B32_odd(a0: i32, s: B32, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17 + @as(f64, @floatFromInt(s.b[17])) * 18 + @as(f64, @floatFromInt(s.b[18])) * 19 + @as(f64, @floatFromInt(s.b[19])) * 20 + @as(f64, @floatFromInt(s.b[20])) * 21 + @as(f64, @floatFromInt(s.b[21])) * 22 + @as(f64, @floatFromInt(s.b[22])) * 23 + @as(f64, @floatFromInt(s.b[23])) * 24 + @as(f64, @floatFromInt(s.b[24])) * 25 + @as(f64, @floatFromInt(s.b[25])) * 26 + @as(f64, @floatFromInt(s.b[26])) * 27 + @as(f64, @floatFromInt(s.b[27])) * 28 + @as(f64, @floatFromInt(s.b[28])) * 29 + @as(f64, @floatFromInt(s.b[29])) * 30 + @as(f64, @floatFromInt(s.b[30])) * 31 + @as(f64, @floatFromInt(s.b[31])) * 32; }
export fn z_B32_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: B32, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.b[0])) * 1 + @as(f64, @floatFromInt(s.b[1])) * 2 + @as(f64, @floatFromInt(s.b[2])) * 3 + @as(f64, @floatFromInt(s.b[3])) * 4 + @as(f64, @floatFromInt(s.b[4])) * 5 + @as(f64, @floatFromInt(s.b[5])) * 6 + @as(f64, @floatFromInt(s.b[6])) * 7 + @as(f64, @floatFromInt(s.b[7])) * 8 + @as(f64, @floatFromInt(s.b[8])) * 9 + @as(f64, @floatFromInt(s.b[9])) * 10 + @as(f64, @floatFromInt(s.b[10])) * 11 + @as(f64, @floatFromInt(s.b[11])) * 12 + @as(f64, @floatFromInt(s.b[12])) * 13 + @as(f64, @floatFromInt(s.b[13])) * 14 + @as(f64, @floatFromInt(s.b[14])) * 15 + @as(f64, @floatFromInt(s.b[15])) * 16 + @as(f64, @floatFromInt(s.b[16])) * 17 + @as(f64, @floatFromInt(s.b[17])) * 18 + @as(f64, @floatFromInt(s.b[18])) * 19 + @as(f64, @floatFromInt(s.b[19])) * 20 + @as(f64, @floatFromInt(s.b[20])) * 21 + @as(f64, @floatFromInt(s.b[21])) * 22 + @as(f64, @floatFromInt(s.b[22])) * 23 + @as(f64, @floatFromInt(s.b[23])) * 24 + @as(f64, @floatFromInt(s.b[24])) * 25 + @as(f64, @floatFromInt(s.b[25])) * 26 + @as(f64, @floatFromInt(s.b[26])) * 27 + @as(f64, @floatFromInt(s.b[27])) * 28 + @as(f64, @floatFromInt(s.b[28])) * 29 + @as(f64, @floatFromInt(s.b[29])) * 30 + @as(f64, @floatFromInt(s.b[30])) * 31 + @as(f64, @floatFromInt(s.b[31])) * 32; }
export fn z_B32_ret(seed: u32) B32 { var r: B32 = undefined; r.b[0] = @as(u8, @truncate(seed +% 0)); r.b[1] = @as(u8, @truncate(seed +% 1)); r.b[2] = @as(u8, @truncate(seed +% 2)); r.b[3] = @as(u8, @truncate(seed +% 3)); r.b[4] = @as(u8, @truncate(seed +% 4)); r.b[5] = @as(u8, @truncate(seed +% 5)); r.b[6] = @as(u8, @truncate(seed +% 6)); r.b[7] = @as(u8, @truncate(seed +% 7)); r.b[8] = @as(u8, @truncate(seed +% 8)); r.b[9] = @as(u8, @truncate(seed +% 9)); r.b[10] = @as(u8, @truncate(seed +% 10)); r.b[11] = @as(u8, @truncate(seed +% 11)); r.b[12] = @as(u8, @truncate(seed +% 12)); r.b[13] = @as(u8, @truncate(seed +% 13)); r.b[14] = @as(u8, @truncate(seed +% 14)); r.b[15] = @as(u8, @truncate(seed +% 15)); r.b[16] = @as(u8, @truncate(seed +% 16)); r.b[17] = @as(u8, @truncate(seed +% 17)); r.b[18] = @as(u8, @truncate(seed +% 18)); r.b[19] = @as(u8, @truncate(seed +% 19)); r.b[20] = @as(u8, @truncate(seed +% 20)); r.b[21] = @as(u8, @truncate(seed +% 21)); r.b[22] = @as(u8, @truncate(seed +% 22)); r.b[23] = @as(u8, @truncate(seed +% 23)); r.b[24] = @as(u8, @truncate(seed +% 24)); r.b[25] = @as(u8, @truncate(seed +% 25)); r.b[26] = @as(u8, @truncate(seed +% 26)); r.b[27] = @as(u8, @truncate(seed +% 27)); r.b[28] = @as(u8, @truncate(seed +% 28)); r.b[29] = @as(u8, @truncate(seed +% 29)); r.b[30] = @as(u8, @truncate(seed +% 30)); r.b[31] = @as(u8, @truncate(seed +% 31)); return r; }
export fn z_A8_first(s: A8, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1; }
export fn z_A8_odd(a0: i32, s: A8, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1; }
export fn z_A8_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: A8, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1; }
export fn z_A8_ret(seed: u32) A8 { var r: A8 = undefined; r.a = @as(u64, seed +% 0); return r; }
export fn z_A16_first(s: A16, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1 + @as(f64, @floatFromInt(s.b)) * 2; }
export fn z_A16_odd(a0: i32, s: A16, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1 + @as(f64, @floatFromInt(s.b)) * 2; }
export fn z_A16_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: A16, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1 + @as(f64, @floatFromInt(s.b)) * 2; }
export fn z_A16_ret(seed: u32) A16 { var r: A16 = undefined; r.a = @as(u64, seed +% 0); r.b = @as(u32, @truncate(seed +% 1)); return r; }
export fn z_A16b_first(s: A16b, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1 + @as(f64, @floatFromInt(s.b)) * 2; }
export fn z_A16b_odd(a0: i32, s: A16b, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1 + @as(f64, @floatFromInt(s.b)) * 2; }
export fn z_A16b_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: A16b, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1 + @as(f64, @floatFromInt(s.b)) * 2; }
export fn z_A16b_ret(seed: u32) A16b { var r: A16b = undefined; r.a = @as(u32, @truncate(seed +% 0)); r.b = @as(u64, seed +% 1); return r; }
export fn z_M8_first(s: M8, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1 + @as(f64, @floatFromInt(s.b)) * 2; }
export fn z_M8_odd(a0: i32, s: M8, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1 + @as(f64, @floatFromInt(s.b)) * 2; }
export fn z_M8_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: M8, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1 + @as(f64, @floatFromInt(s.b)) * 2; }
export fn z_M8_ret(seed: u32) M8 { var r: M8 = undefined; r.a = @as(u8, @truncate(seed +% 0)); r.b = @as(u32, @truncate(seed +% 1)); return r; }
export fn z_M12_first(s: M12, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1 + @as(f64, @floatFromInt(s.b)) * 2 + @as(f64, @floatFromInt(s.c)) * 3; }
export fn z_M12_odd(a0: i32, s: M12, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1 + @as(f64, @floatFromInt(s.b)) * 2 + @as(f64, @floatFromInt(s.c)) * 3; }
export fn z_M12_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: M12, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, @floatFromInt(s.a)) * 1 + @as(f64, @floatFromInt(s.b)) * 2 + @as(f64, @floatFromInt(s.c)) * 3; }
export fn z_M12_ret(seed: u32) M12 { var r: M12 = undefined; r.a = @as(u8, @truncate(seed +% 0)); r.b = @as(u16, @truncate(seed +% 1)); r.c = @as(u32, @truncate(seed +% 2)); return r; }
export fn z_F4_first(s: F4, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1; }
export fn z_F4_odd(a0: i32, s: F4, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1; }
export fn z_F4_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: F4, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1; }
export fn z_F4_ret(seed: u32) F4 { var r: F4 = undefined; r.a = @as(f32, @floatFromInt(seed +% 0)); return r; }
export fn z_F8_first(s: F8, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1 + @as(f64, s.b) * 2; }
export fn z_F8_odd(a0: i32, s: F8, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1 + @as(f64, s.b) * 2; }
export fn z_F8_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: F8, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1 + @as(f64, s.b) * 2; }
export fn z_F8_ret(seed: u32) F8 { var r: F8 = undefined; r.a = @as(f32, @floatFromInt(seed +% 0)); r.b = @as(f32, @floatFromInt(seed +% 1)); return r; }
export fn z_F12_first(s: F12, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1 + @as(f64, s.b) * 2 + @as(f64, s.c) * 3; }
export fn z_F12_odd(a0: i32, s: F12, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1 + @as(f64, s.b) * 2 + @as(f64, s.c) * 3; }
export fn z_F12_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: F12, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1 + @as(f64, s.b) * 2 + @as(f64, s.c) * 3; }
export fn z_F12_ret(seed: u32) F12 { var r: F12 = undefined; r.a = @as(f32, @floatFromInt(seed +% 0)); r.b = @as(f32, @floatFromInt(seed +% 1)); r.c = @as(f32, @floatFromInt(seed +% 2)); return r; }
export fn z_D8_first(s: D8, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1; }
export fn z_D8_odd(a0: i32, s: D8, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1; }
export fn z_D8_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: D8, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1; }
export fn z_D8_ret(seed: u32) D8 { var r: D8 = undefined; r.a = @as(f64, @floatFromInt(seed +% 0)); return r; }
export fn z_D16_first(s: D16, k: i32) f64 { return @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1 + @as(f64, s.b) * 2; }
export fn z_D16_odd(a0: i32, s: D16, k: i32) f64 { return @as(f64, @floatFromInt(a0)) * 7.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1 + @as(f64, s.b) * 2; }
export fn z_D16_late(a0: i32, a1: i32, a2: i32, a3: i32, a4: i32, s: D16, k: i32) f64 { return @as(f64, @floatFromInt(a0)) + @as(f64, @floatFromInt(a1)) * 2.0 + @as(f64, @floatFromInt(a2)) * 3.0 + @as(f64, @floatFromInt(a3)) * 4.0 + @as(f64, @floatFromInt(a4)) * 5.0 + @as(f64, @floatFromInt(k)) * 1000.0 + @as(f64, s.a) * 1 + @as(f64, s.b) * 2; }
export fn z_D16_ret(seed: u32) D16 { var r: D16 = undefined; r.a = @as(f64, @floatFromInt(seed +% 0)); r.b = @as(f64, @floatFromInt(seed +% 1)); return r; }

extern fn c_B1_first(B1, i32) f64;
extern fn c_B1_odd(i32, B1, i32) f64;
extern fn c_B1_late(i32, i32, i32, i32, i32, B1, i32) f64;
extern fn c_B1_ret(u32) B1;
extern fn c_B2_first(B2, i32) f64;
extern fn c_B2_odd(i32, B2, i32) f64;
extern fn c_B2_late(i32, i32, i32, i32, i32, B2, i32) f64;
extern fn c_B2_ret(u32) B2;
extern fn c_B3_first(B3, i32) f64;
extern fn c_B3_odd(i32, B3, i32) f64;
extern fn c_B3_late(i32, i32, i32, i32, i32, B3, i32) f64;
extern fn c_B3_ret(u32) B3;
extern fn c_B4_first(B4, i32) f64;
extern fn c_B4_odd(i32, B4, i32) f64;
extern fn c_B4_late(i32, i32, i32, i32, i32, B4, i32) f64;
extern fn c_B4_ret(u32) B4;
extern fn c_B5_first(B5, i32) f64;
extern fn c_B5_odd(i32, B5, i32) f64;
extern fn c_B5_late(i32, i32, i32, i32, i32, B5, i32) f64;
extern fn c_B5_ret(u32) B5;
extern fn c_B6_first(B6, i32) f64;
extern fn c_B6_odd(i32, B6, i32) f64;
extern fn c_B6_late(i32, i32, i32, i32, i32, B6, i32) f64;
extern fn c_B6_ret(u32) B6;
extern fn c_B7_first(B7, i32) f64;
extern fn c_B7_odd(i32, B7, i32) f64;
extern fn c_B7_late(i32, i32, i32, i32, i32, B7, i32) f64;
extern fn c_B7_ret(u32) B7;
extern fn c_B8_first(B8, i32) f64;
extern fn c_B8_odd(i32, B8, i32) f64;
extern fn c_B8_late(i32, i32, i32, i32, i32, B8, i32) f64;
extern fn c_B8_ret(u32) B8;
extern fn c_B9_first(B9, i32) f64;
extern fn c_B9_odd(i32, B9, i32) f64;
extern fn c_B9_late(i32, i32, i32, i32, i32, B9, i32) f64;
extern fn c_B9_ret(u32) B9;
extern fn c_B12_first(B12, i32) f64;
extern fn c_B12_odd(i32, B12, i32) f64;
extern fn c_B12_late(i32, i32, i32, i32, i32, B12, i32) f64;
extern fn c_B12_ret(u32) B12;
extern fn c_B13_first(B13, i32) f64;
extern fn c_B13_odd(i32, B13, i32) f64;
extern fn c_B13_late(i32, i32, i32, i32, i32, B13, i32) f64;
extern fn c_B13_ret(u32) B13;
extern fn c_B16_first(B16, i32) f64;
extern fn c_B16_odd(i32, B16, i32) f64;
extern fn c_B16_late(i32, i32, i32, i32, i32, B16, i32) f64;
extern fn c_B16_ret(u32) B16;
extern fn c_B17_first(B17, i32) f64;
extern fn c_B17_odd(i32, B17, i32) f64;
extern fn c_B17_late(i32, i32, i32, i32, i32, B17, i32) f64;
extern fn c_B17_ret(u32) B17;
extern fn c_B20_first(B20, i32) f64;
extern fn c_B20_odd(i32, B20, i32) f64;
extern fn c_B20_late(i32, i32, i32, i32, i32, B20, i32) f64;
extern fn c_B20_ret(u32) B20;
extern fn c_B24_first(B24, i32) f64;
extern fn c_B24_odd(i32, B24, i32) f64;
extern fn c_B24_late(i32, i32, i32, i32, i32, B24, i32) f64;
extern fn c_B24_ret(u32) B24;
extern fn c_B28_first(B28, i32) f64;
extern fn c_B28_odd(i32, B28, i32) f64;
extern fn c_B28_late(i32, i32, i32, i32, i32, B28, i32) f64;
extern fn c_B28_ret(u32) B28;
extern fn c_B32_first(B32, i32) f64;
extern fn c_B32_odd(i32, B32, i32) f64;
extern fn c_B32_late(i32, i32, i32, i32, i32, B32, i32) f64;
extern fn c_B32_ret(u32) B32;
extern fn c_A8_first(A8, i32) f64;
extern fn c_A8_odd(i32, A8, i32) f64;
extern fn c_A8_late(i32, i32, i32, i32, i32, A8, i32) f64;
extern fn c_A8_ret(u32) A8;
extern fn c_A16_first(A16, i32) f64;
extern fn c_A16_odd(i32, A16, i32) f64;
extern fn c_A16_late(i32, i32, i32, i32, i32, A16, i32) f64;
extern fn c_A16_ret(u32) A16;
extern fn c_A16b_first(A16b, i32) f64;
extern fn c_A16b_odd(i32, A16b, i32) f64;
extern fn c_A16b_late(i32, i32, i32, i32, i32, A16b, i32) f64;
extern fn c_A16b_ret(u32) A16b;
extern fn c_M8_first(M8, i32) f64;
extern fn c_M8_odd(i32, M8, i32) f64;
extern fn c_M8_late(i32, i32, i32, i32, i32, M8, i32) f64;
extern fn c_M8_ret(u32) M8;
extern fn c_M12_first(M12, i32) f64;
extern fn c_M12_odd(i32, M12, i32) f64;
extern fn c_M12_late(i32, i32, i32, i32, i32, M12, i32) f64;
extern fn c_M12_ret(u32) M12;
extern fn c_F4_first(F4, i32) f64;
extern fn c_F4_odd(i32, F4, i32) f64;
extern fn c_F4_late(i32, i32, i32, i32, i32, F4, i32) f64;
extern fn c_F4_ret(u32) F4;
extern fn c_F8_first(F8, i32) f64;
extern fn c_F8_odd(i32, F8, i32) f64;
extern fn c_F8_late(i32, i32, i32, i32, i32, F8, i32) f64;
extern fn c_F8_ret(u32) F8;
extern fn c_F12_first(F12, i32) f64;
extern fn c_F12_odd(i32, F12, i32) f64;
extern fn c_F12_late(i32, i32, i32, i32, i32, F12, i32) f64;
extern fn c_F12_ret(u32) F12;
extern fn c_D8_first(D8, i32) f64;
extern fn c_D8_odd(i32, D8, i32) f64;
extern fn c_D8_late(i32, i32, i32, i32, i32, D8, i32) f64;
extern fn c_D8_ret(u32) D8;
extern fn c_D16_first(D16, i32) f64;
extern fn c_D16_odd(i32, D16, i32) f64;
extern fn c_D16_late(i32, i32, i32, i32, i32, D16, i32) f64;
extern fn c_D16_ret(u32) D16;
export fn z_sweep() void {
    {
        const v: B1 = .{ .b = .{ 3 } };
        if (abi_begin("z->c B1 first") != 0) abi_end("z->c B1 first", @intFromBool(c_B1_first(v, 7) == z_B1_first(v, 7)));
        if (abi_begin("z->c B1 odd") != 0) abi_end("z->c B1 odd", @intFromBool(c_B1_odd(3, v, 7) == z_B1_odd(3, v, 7)));
        if (abi_begin("z->c B1 late") != 0) abi_end("z->c B1 late", @intFromBool(c_B1_late(1, 2, 3, 4, 5, v, 7) == z_B1_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B1 ret") != 0) {
            const x = c_B1_ret(40);
            const y = z_B1_ret(40);
            abi_end("z->c B1 ret", @intFromBool(x.b[0] == y.b[0]));
        }
    }
    {
        const v: B2 = .{ .b = .{ 3, 5 } };
        if (abi_begin("z->c B2 first") != 0) abi_end("z->c B2 first", @intFromBool(c_B2_first(v, 7) == z_B2_first(v, 7)));
        if (abi_begin("z->c B2 odd") != 0) abi_end("z->c B2 odd", @intFromBool(c_B2_odd(3, v, 7) == z_B2_odd(3, v, 7)));
        if (abi_begin("z->c B2 late") != 0) abi_end("z->c B2 late", @intFromBool(c_B2_late(1, 2, 3, 4, 5, v, 7) == z_B2_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B2 ret") != 0) {
            const x = c_B2_ret(40);
            const y = z_B2_ret(40);
            abi_end("z->c B2 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1]));
        }
    }
    {
        const v: B3 = .{ .b = .{ 3, 5, 7 } };
        if (abi_begin("z->c B3 first") != 0) abi_end("z->c B3 first", @intFromBool(c_B3_first(v, 7) == z_B3_first(v, 7)));
        if (abi_begin("z->c B3 odd") != 0) abi_end("z->c B3 odd", @intFromBool(c_B3_odd(3, v, 7) == z_B3_odd(3, v, 7)));
        if (abi_begin("z->c B3 late") != 0) abi_end("z->c B3 late", @intFromBool(c_B3_late(1, 2, 3, 4, 5, v, 7) == z_B3_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B3 ret") != 0) {
            const x = c_B3_ret(40);
            const y = z_B3_ret(40);
            abi_end("z->c B3 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2]));
        }
    }
    {
        const v: B4 = .{ .b = .{ 3, 5, 7, 9 } };
        if (abi_begin("z->c B4 first") != 0) abi_end("z->c B4 first", @intFromBool(c_B4_first(v, 7) == z_B4_first(v, 7)));
        if (abi_begin("z->c B4 odd") != 0) abi_end("z->c B4 odd", @intFromBool(c_B4_odd(3, v, 7) == z_B4_odd(3, v, 7)));
        if (abi_begin("z->c B4 late") != 0) abi_end("z->c B4 late", @intFromBool(c_B4_late(1, 2, 3, 4, 5, v, 7) == z_B4_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B4 ret") != 0) {
            const x = c_B4_ret(40);
            const y = z_B4_ret(40);
            abi_end("z->c B4 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3]));
        }
    }
    {
        const v: B5 = .{ .b = .{ 3, 5, 7, 9, 11 } };
        if (abi_begin("z->c B5 first") != 0) abi_end("z->c B5 first", @intFromBool(c_B5_first(v, 7) == z_B5_first(v, 7)));
        if (abi_begin("z->c B5 odd") != 0) abi_end("z->c B5 odd", @intFromBool(c_B5_odd(3, v, 7) == z_B5_odd(3, v, 7)));
        if (abi_begin("z->c B5 late") != 0) abi_end("z->c B5 late", @intFromBool(c_B5_late(1, 2, 3, 4, 5, v, 7) == z_B5_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B5 ret") != 0) {
            const x = c_B5_ret(40);
            const y = z_B5_ret(40);
            abi_end("z->c B5 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4]));
        }
    }
    {
        const v: B6 = .{ .b = .{ 3, 5, 7, 9, 11, 13 } };
        if (abi_begin("z->c B6 first") != 0) abi_end("z->c B6 first", @intFromBool(c_B6_first(v, 7) == z_B6_first(v, 7)));
        if (abi_begin("z->c B6 odd") != 0) abi_end("z->c B6 odd", @intFromBool(c_B6_odd(3, v, 7) == z_B6_odd(3, v, 7)));
        if (abi_begin("z->c B6 late") != 0) abi_end("z->c B6 late", @intFromBool(c_B6_late(1, 2, 3, 4, 5, v, 7) == z_B6_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B6 ret") != 0) {
            const x = c_B6_ret(40);
            const y = z_B6_ret(40);
            abi_end("z->c B6 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4] and x.b[5] == y.b[5]));
        }
    }
    {
        const v: B7 = .{ .b = .{ 3, 5, 7, 9, 11, 13, 15 } };
        if (abi_begin("z->c B7 first") != 0) abi_end("z->c B7 first", @intFromBool(c_B7_first(v, 7) == z_B7_first(v, 7)));
        if (abi_begin("z->c B7 odd") != 0) abi_end("z->c B7 odd", @intFromBool(c_B7_odd(3, v, 7) == z_B7_odd(3, v, 7)));
        if (abi_begin("z->c B7 late") != 0) abi_end("z->c B7 late", @intFromBool(c_B7_late(1, 2, 3, 4, 5, v, 7) == z_B7_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B7 ret") != 0) {
            const x = c_B7_ret(40);
            const y = z_B7_ret(40);
            abi_end("z->c B7 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4] and x.b[5] == y.b[5] and x.b[6] == y.b[6]));
        }
    }
    {
        const v: B8 = .{ .b = .{ 3, 5, 7, 9, 11, 13, 15, 17 } };
        if (abi_begin("z->c B8 first") != 0) abi_end("z->c B8 first", @intFromBool(c_B8_first(v, 7) == z_B8_first(v, 7)));
        if (abi_begin("z->c B8 odd") != 0) abi_end("z->c B8 odd", @intFromBool(c_B8_odd(3, v, 7) == z_B8_odd(3, v, 7)));
        if (abi_begin("z->c B8 late") != 0) abi_end("z->c B8 late", @intFromBool(c_B8_late(1, 2, 3, 4, 5, v, 7) == z_B8_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B8 ret") != 0) {
            const x = c_B8_ret(40);
            const y = z_B8_ret(40);
            abi_end("z->c B8 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4] and x.b[5] == y.b[5] and x.b[6] == y.b[6] and x.b[7] == y.b[7]));
        }
    }
    {
        const v: B9 = .{ .b = .{ 3, 5, 7, 9, 11, 13, 15, 17, 19 } };
        if (abi_begin("z->c B9 first") != 0) abi_end("z->c B9 first", @intFromBool(c_B9_first(v, 7) == z_B9_first(v, 7)));
        if (abi_begin("z->c B9 odd") != 0) abi_end("z->c B9 odd", @intFromBool(c_B9_odd(3, v, 7) == z_B9_odd(3, v, 7)));
        if (abi_begin("z->c B9 late") != 0) abi_end("z->c B9 late", @intFromBool(c_B9_late(1, 2, 3, 4, 5, v, 7) == z_B9_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B9 ret") != 0) {
            const x = c_B9_ret(40);
            const y = z_B9_ret(40);
            abi_end("z->c B9 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4] and x.b[5] == y.b[5] and x.b[6] == y.b[6] and x.b[7] == y.b[7] and x.b[8] == y.b[8]));
        }
    }
    {
        const v: B12 = .{ .b = .{ 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25 } };
        if (abi_begin("z->c B12 first") != 0) abi_end("z->c B12 first", @intFromBool(c_B12_first(v, 7) == z_B12_first(v, 7)));
        if (abi_begin("z->c B12 odd") != 0) abi_end("z->c B12 odd", @intFromBool(c_B12_odd(3, v, 7) == z_B12_odd(3, v, 7)));
        if (abi_begin("z->c B12 late") != 0) abi_end("z->c B12 late", @intFromBool(c_B12_late(1, 2, 3, 4, 5, v, 7) == z_B12_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B12 ret") != 0) {
            const x = c_B12_ret(40);
            const y = z_B12_ret(40);
            abi_end("z->c B12 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4] and x.b[5] == y.b[5] and x.b[6] == y.b[6] and x.b[7] == y.b[7] and x.b[8] == y.b[8] and x.b[9] == y.b[9] and x.b[10] == y.b[10] and x.b[11] == y.b[11]));
        }
    }
    {
        const v: B13 = .{ .b = .{ 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27 } };
        if (abi_begin("z->c B13 first") != 0) abi_end("z->c B13 first", @intFromBool(c_B13_first(v, 7) == z_B13_first(v, 7)));
        if (abi_begin("z->c B13 odd") != 0) abi_end("z->c B13 odd", @intFromBool(c_B13_odd(3, v, 7) == z_B13_odd(3, v, 7)));
        if (abi_begin("z->c B13 late") != 0) abi_end("z->c B13 late", @intFromBool(c_B13_late(1, 2, 3, 4, 5, v, 7) == z_B13_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B13 ret") != 0) {
            const x = c_B13_ret(40);
            const y = z_B13_ret(40);
            abi_end("z->c B13 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4] and x.b[5] == y.b[5] and x.b[6] == y.b[6] and x.b[7] == y.b[7] and x.b[8] == y.b[8] and x.b[9] == y.b[9] and x.b[10] == y.b[10] and x.b[11] == y.b[11] and x.b[12] == y.b[12]));
        }
    }
    {
        const v: B16 = .{ .b = .{ 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33 } };
        if (abi_begin("z->c B16 first") != 0) abi_end("z->c B16 first", @intFromBool(c_B16_first(v, 7) == z_B16_first(v, 7)));
        if (abi_begin("z->c B16 odd") != 0) abi_end("z->c B16 odd", @intFromBool(c_B16_odd(3, v, 7) == z_B16_odd(3, v, 7)));
        if (abi_begin("z->c B16 late") != 0) abi_end("z->c B16 late", @intFromBool(c_B16_late(1, 2, 3, 4, 5, v, 7) == z_B16_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B16 ret") != 0) {
            const x = c_B16_ret(40);
            const y = z_B16_ret(40);
            abi_end("z->c B16 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4] and x.b[5] == y.b[5] and x.b[6] == y.b[6] and x.b[7] == y.b[7] and x.b[8] == y.b[8] and x.b[9] == y.b[9] and x.b[10] == y.b[10] and x.b[11] == y.b[11] and x.b[12] == y.b[12] and x.b[13] == y.b[13] and x.b[14] == y.b[14] and x.b[15] == y.b[15]));
        }
    }
    {
        const v: B17 = .{ .b = .{ 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35 } };
        if (abi_begin("z->c B17 first") != 0) abi_end("z->c B17 first", @intFromBool(c_B17_first(v, 7) == z_B17_first(v, 7)));
        if (abi_begin("z->c B17 odd") != 0) abi_end("z->c B17 odd", @intFromBool(c_B17_odd(3, v, 7) == z_B17_odd(3, v, 7)));
        if (abi_begin("z->c B17 late") != 0) abi_end("z->c B17 late", @intFromBool(c_B17_late(1, 2, 3, 4, 5, v, 7) == z_B17_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B17 ret") != 0) {
            const x = c_B17_ret(40);
            const y = z_B17_ret(40);
            abi_end("z->c B17 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4] and x.b[5] == y.b[5] and x.b[6] == y.b[6] and x.b[7] == y.b[7] and x.b[8] == y.b[8] and x.b[9] == y.b[9] and x.b[10] == y.b[10] and x.b[11] == y.b[11] and x.b[12] == y.b[12] and x.b[13] == y.b[13] and x.b[14] == y.b[14] and x.b[15] == y.b[15] and x.b[16] == y.b[16]));
        }
    }
    {
        const v: B20 = .{ .b = .{ 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41 } };
        if (abi_begin("z->c B20 first") != 0) abi_end("z->c B20 first", @intFromBool(c_B20_first(v, 7) == z_B20_first(v, 7)));
        if (abi_begin("z->c B20 odd") != 0) abi_end("z->c B20 odd", @intFromBool(c_B20_odd(3, v, 7) == z_B20_odd(3, v, 7)));
        if (abi_begin("z->c B20 late") != 0) abi_end("z->c B20 late", @intFromBool(c_B20_late(1, 2, 3, 4, 5, v, 7) == z_B20_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B20 ret") != 0) {
            const x = c_B20_ret(40);
            const y = z_B20_ret(40);
            abi_end("z->c B20 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4] and x.b[5] == y.b[5] and x.b[6] == y.b[6] and x.b[7] == y.b[7] and x.b[8] == y.b[8] and x.b[9] == y.b[9] and x.b[10] == y.b[10] and x.b[11] == y.b[11] and x.b[12] == y.b[12] and x.b[13] == y.b[13] and x.b[14] == y.b[14] and x.b[15] == y.b[15] and x.b[16] == y.b[16] and x.b[17] == y.b[17] and x.b[18] == y.b[18] and x.b[19] == y.b[19]));
        }
    }
    {
        const v: B24 = .{ .b = .{ 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49 } };
        if (abi_begin("z->c B24 first") != 0) abi_end("z->c B24 first", @intFromBool(c_B24_first(v, 7) == z_B24_first(v, 7)));
        if (abi_begin("z->c B24 odd") != 0) abi_end("z->c B24 odd", @intFromBool(c_B24_odd(3, v, 7) == z_B24_odd(3, v, 7)));
        if (abi_begin("z->c B24 late") != 0) abi_end("z->c B24 late", @intFromBool(c_B24_late(1, 2, 3, 4, 5, v, 7) == z_B24_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B24 ret") != 0) {
            const x = c_B24_ret(40);
            const y = z_B24_ret(40);
            abi_end("z->c B24 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4] and x.b[5] == y.b[5] and x.b[6] == y.b[6] and x.b[7] == y.b[7] and x.b[8] == y.b[8] and x.b[9] == y.b[9] and x.b[10] == y.b[10] and x.b[11] == y.b[11] and x.b[12] == y.b[12] and x.b[13] == y.b[13] and x.b[14] == y.b[14] and x.b[15] == y.b[15] and x.b[16] == y.b[16] and x.b[17] == y.b[17] and x.b[18] == y.b[18] and x.b[19] == y.b[19] and x.b[20] == y.b[20] and x.b[21] == y.b[21] and x.b[22] == y.b[22] and x.b[23] == y.b[23]));
        }
    }
    {
        const v: B28 = .{ .b = .{ 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57 } };
        if (abi_begin("z->c B28 first") != 0) abi_end("z->c B28 first", @intFromBool(c_B28_first(v, 7) == z_B28_first(v, 7)));
        if (abi_begin("z->c B28 odd") != 0) abi_end("z->c B28 odd", @intFromBool(c_B28_odd(3, v, 7) == z_B28_odd(3, v, 7)));
        if (abi_begin("z->c B28 late") != 0) abi_end("z->c B28 late", @intFromBool(c_B28_late(1, 2, 3, 4, 5, v, 7) == z_B28_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B28 ret") != 0) {
            const x = c_B28_ret(40);
            const y = z_B28_ret(40);
            abi_end("z->c B28 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4] and x.b[5] == y.b[5] and x.b[6] == y.b[6] and x.b[7] == y.b[7] and x.b[8] == y.b[8] and x.b[9] == y.b[9] and x.b[10] == y.b[10] and x.b[11] == y.b[11] and x.b[12] == y.b[12] and x.b[13] == y.b[13] and x.b[14] == y.b[14] and x.b[15] == y.b[15] and x.b[16] == y.b[16] and x.b[17] == y.b[17] and x.b[18] == y.b[18] and x.b[19] == y.b[19] and x.b[20] == y.b[20] and x.b[21] == y.b[21] and x.b[22] == y.b[22] and x.b[23] == y.b[23] and x.b[24] == y.b[24] and x.b[25] == y.b[25] and x.b[26] == y.b[26] and x.b[27] == y.b[27]));
        }
    }
    {
        const v: B32 = .{ .b = .{ 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65 } };
        if (abi_begin("z->c B32 first") != 0) abi_end("z->c B32 first", @intFromBool(c_B32_first(v, 7) == z_B32_first(v, 7)));
        if (abi_begin("z->c B32 odd") != 0) abi_end("z->c B32 odd", @intFromBool(c_B32_odd(3, v, 7) == z_B32_odd(3, v, 7)));
        if (abi_begin("z->c B32 late") != 0) abi_end("z->c B32 late", @intFromBool(c_B32_late(1, 2, 3, 4, 5, v, 7) == z_B32_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c B32 ret") != 0) {
            const x = c_B32_ret(40);
            const y = z_B32_ret(40);
            abi_end("z->c B32 ret", @intFromBool(x.b[0] == y.b[0] and x.b[1] == y.b[1] and x.b[2] == y.b[2] and x.b[3] == y.b[3] and x.b[4] == y.b[4] and x.b[5] == y.b[5] and x.b[6] == y.b[6] and x.b[7] == y.b[7] and x.b[8] == y.b[8] and x.b[9] == y.b[9] and x.b[10] == y.b[10] and x.b[11] == y.b[11] and x.b[12] == y.b[12] and x.b[13] == y.b[13] and x.b[14] == y.b[14] and x.b[15] == y.b[15] and x.b[16] == y.b[16] and x.b[17] == y.b[17] and x.b[18] == y.b[18] and x.b[19] == y.b[19] and x.b[20] == y.b[20] and x.b[21] == y.b[21] and x.b[22] == y.b[22] and x.b[23] == y.b[23] and x.b[24] == y.b[24] and x.b[25] == y.b[25] and x.b[26] == y.b[26] and x.b[27] == y.b[27] and x.b[28] == y.b[28] and x.b[29] == y.b[29] and x.b[30] == y.b[30] and x.b[31] == y.b[31]));
        }
    }
    {
        const v: A8 = .{ .a = 0x1122334455667788 };
        if (abi_begin("z->c A8 first") != 0) abi_end("z->c A8 first", @intFromBool(c_A8_first(v, 7) == z_A8_first(v, 7)));
        if (abi_begin("z->c A8 odd") != 0) abi_end("z->c A8 odd", @intFromBool(c_A8_odd(3, v, 7) == z_A8_odd(3, v, 7)));
        if (abi_begin("z->c A8 late") != 0) abi_end("z->c A8 late", @intFromBool(c_A8_late(1, 2, 3, 4, 5, v, 7) == z_A8_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c A8 ret") != 0) {
            const x = c_A8_ret(40);
            const y = z_A8_ret(40);
            abi_end("z->c A8 ret", @intFromBool(x.a == y.a));
        }
    }
    {
        const v: A16 = .{ .a = 0x1122334455667788, .b = 9 };
        if (abi_begin("z->c A16 first") != 0) abi_end("z->c A16 first", @intFromBool(c_A16_first(v, 7) == z_A16_first(v, 7)));
        if (abi_begin("z->c A16 odd") != 0) abi_end("z->c A16 odd", @intFromBool(c_A16_odd(3, v, 7) == z_A16_odd(3, v, 7)));
        if (abi_begin("z->c A16 late") != 0) abi_end("z->c A16 late", @intFromBool(c_A16_late(1, 2, 3, 4, 5, v, 7) == z_A16_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c A16 ret") != 0) {
            const x = c_A16_ret(40);
            const y = z_A16_ret(40);
            abi_end("z->c A16 ret", @intFromBool(x.a == y.a and x.b == y.b));
        }
    }
    {
        const v: A16b = .{ .a = 9, .b = 0x1122334455667788 };
        if (abi_begin("z->c A16b first") != 0) abi_end("z->c A16b first", @intFromBool(c_A16b_first(v, 7) == z_A16b_first(v, 7)));
        if (abi_begin("z->c A16b odd") != 0) abi_end("z->c A16b odd", @intFromBool(c_A16b_odd(3, v, 7) == z_A16b_odd(3, v, 7)));
        if (abi_begin("z->c A16b late") != 0) abi_end("z->c A16b late", @intFromBool(c_A16b_late(1, 2, 3, 4, 5, v, 7) == z_A16b_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c A16b ret") != 0) {
            const x = c_A16b_ret(40);
            const y = z_A16b_ret(40);
            abi_end("z->c A16b ret", @intFromBool(x.a == y.a and x.b == y.b));
        }
    }
    {
        const v: M8 = .{ .a = 7, .b = 0x01020304 };
        if (abi_begin("z->c M8 first") != 0) abi_end("z->c M8 first", @intFromBool(c_M8_first(v, 7) == z_M8_first(v, 7)));
        if (abi_begin("z->c M8 odd") != 0) abi_end("z->c M8 odd", @intFromBool(c_M8_odd(3, v, 7) == z_M8_odd(3, v, 7)));
        if (abi_begin("z->c M8 late") != 0) abi_end("z->c M8 late", @intFromBool(c_M8_late(1, 2, 3, 4, 5, v, 7) == z_M8_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c M8 ret") != 0) {
            const x = c_M8_ret(40);
            const y = z_M8_ret(40);
            abi_end("z->c M8 ret", @intFromBool(x.a == y.a and x.b == y.b));
        }
    }
    {
        const v: M12 = .{ .a = 7, .b = 700, .c = 0x01020304 };
        if (abi_begin("z->c M12 first") != 0) abi_end("z->c M12 first", @intFromBool(c_M12_first(v, 7) == z_M12_first(v, 7)));
        if (abi_begin("z->c M12 odd") != 0) abi_end("z->c M12 odd", @intFromBool(c_M12_odd(3, v, 7) == z_M12_odd(3, v, 7)));
        if (abi_begin("z->c M12 late") != 0) abi_end("z->c M12 late", @intFromBool(c_M12_late(1, 2, 3, 4, 5, v, 7) == z_M12_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c M12 ret") != 0) {
            const x = c_M12_ret(40);
            const y = z_M12_ret(40);
            abi_end("z->c M12 ret", @intFromBool(x.a == y.a and x.b == y.b and x.c == y.c));
        }
    }
    {
        const v: F4 = .{ .a = 1.5 };
        if (abi_begin("z->c F4 first") != 0) abi_end("z->c F4 first", @intFromBool(c_F4_first(v, 7) == z_F4_first(v, 7)));
        if (abi_begin("z->c F4 odd") != 0) abi_end("z->c F4 odd", @intFromBool(c_F4_odd(3, v, 7) == z_F4_odd(3, v, 7)));
        if (abi_begin("z->c F4 late") != 0) abi_end("z->c F4 late", @intFromBool(c_F4_late(1, 2, 3, 4, 5, v, 7) == z_F4_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c F4 ret") != 0) {
            const x = c_F4_ret(40);
            const y = z_F4_ret(40);
            abi_end("z->c F4 ret", @intFromBool(x.a == y.a));
        }
    }
    {
        const v: F8 = .{ .a = 1.5, .b = 2.5 };
        if (abi_begin("z->c F8 first") != 0) abi_end("z->c F8 first", @intFromBool(c_F8_first(v, 7) == z_F8_first(v, 7)));
        if (abi_begin("z->c F8 odd") != 0) abi_end("z->c F8 odd", @intFromBool(c_F8_odd(3, v, 7) == z_F8_odd(3, v, 7)));
        if (abi_begin("z->c F8 late") != 0) abi_end("z->c F8 late", @intFromBool(c_F8_late(1, 2, 3, 4, 5, v, 7) == z_F8_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c F8 ret") != 0) {
            const x = c_F8_ret(40);
            const y = z_F8_ret(40);
            abi_end("z->c F8 ret", @intFromBool(x.a == y.a and x.b == y.b));
        }
    }
    {
        const v: F12 = .{ .a = 1.5, .b = 2.5, .c = 3.5 };
        if (abi_begin("z->c F12 first") != 0) abi_end("z->c F12 first", @intFromBool(c_F12_first(v, 7) == z_F12_first(v, 7)));
        if (abi_begin("z->c F12 odd") != 0) abi_end("z->c F12 odd", @intFromBool(c_F12_odd(3, v, 7) == z_F12_odd(3, v, 7)));
        if (abi_begin("z->c F12 late") != 0) abi_end("z->c F12 late", @intFromBool(c_F12_late(1, 2, 3, 4, 5, v, 7) == z_F12_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c F12 ret") != 0) {
            const x = c_F12_ret(40);
            const y = z_F12_ret(40);
            abi_end("z->c F12 ret", @intFromBool(x.a == y.a and x.b == y.b and x.c == y.c));
        }
    }
    {
        const v: D8 = .{ .a = 1.5 };
        if (abi_begin("z->c D8 first") != 0) abi_end("z->c D8 first", @intFromBool(c_D8_first(v, 7) == z_D8_first(v, 7)));
        if (abi_begin("z->c D8 odd") != 0) abi_end("z->c D8 odd", @intFromBool(c_D8_odd(3, v, 7) == z_D8_odd(3, v, 7)));
        if (abi_begin("z->c D8 late") != 0) abi_end("z->c D8 late", @intFromBool(c_D8_late(1, 2, 3, 4, 5, v, 7) == z_D8_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c D8 ret") != 0) {
            const x = c_D8_ret(40);
            const y = z_D8_ret(40);
            abi_end("z->c D8 ret", @intFromBool(x.a == y.a));
        }
    }
    {
        const v: D16 = .{ .a = 1.5, .b = 2.5 };
        if (abi_begin("z->c D16 first") != 0) abi_end("z->c D16 first", @intFromBool(c_D16_first(v, 7) == z_D16_first(v, 7)));
        if (abi_begin("z->c D16 odd") != 0) abi_end("z->c D16 odd", @intFromBool(c_D16_odd(3, v, 7) == z_D16_odd(3, v, 7)));
        if (abi_begin("z->c D16 late") != 0) abi_end("z->c D16 late", @intFromBool(c_D16_late(1, 2, 3, 4, 5, v, 7) == z_D16_late(1, 2, 3, 4, 5, v, 7)));
        if (abi_begin("z->c D16 ret") != 0) {
            const x = c_D16_ret(40);
            const y = z_D16_ret(40);
            abi_end("z->c D16 ret", @intFromBool(x.a == y.a and x.b == y.b));
        }
    }
}
