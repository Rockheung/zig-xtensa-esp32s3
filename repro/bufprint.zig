const std = @import("std");
export fn f(buf: [*]u8, v: u32) usize { return (std.fmt.bufPrint(buf[0..32], "{d}-{s}", .{ v, "x" }) catch return 0).len; }
