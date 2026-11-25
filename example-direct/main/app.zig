const std = @import("std");
const c = @import("c.zig");

extern fn esp_rom_printf(fmt: [*:0]const u8, ...) c_int;
extern fn vTaskDelay(ticks: u32) void;
extern const c_layout: [15]c_uint;

const BusConfig = extern struct {
    i2c_port: c_int,
    sda_io_num: c_int,
    scl_io_num: c_int,
    clk_source: c_int,
    glitch_ignore_cnt: u8,
    intr_priority: c_int,
    trans_queue_depth: usize,
    flags: u32,
};

const DeviceConfig = extern struct {
    dev_addr_length: c_int,
    device_address: u16,
    scl_speed_hz: u32,
    scl_wait_us: u32,
    flags: u32,
};

const zig_layout = [15]c_uint{
    @sizeOf(BusConfig),
    @offsetOf(BusConfig, "i2c_port"),
    @offsetOf(BusConfig, "sda_io_num"),
    @offsetOf(BusConfig, "scl_io_num"),
    @offsetOf(BusConfig, "clk_source"),
    @offsetOf(BusConfig, "glitch_ignore_cnt"),
    @offsetOf(BusConfig, "intr_priority"),
    @offsetOf(BusConfig, "trans_queue_depth"),
    @offsetOf(BusConfig, "flags"),
    @sizeOf(DeviceConfig),
    @offsetOf(DeviceConfig, "dev_addr_length"),
    @offsetOf(DeviceConfig, "device_address"),
    @offsetOf(DeviceConfig, "scl_speed_hz"),
    @offsetOf(DeviceConfig, "scl_wait_us"),
    @offsetOf(DeviceConfig, "flags"),
};

fn bcd(v: u8) c_int {
    return @as(c_int, v >> 4) * 10 + (v & 0x0f);
}

export fn app_main() void {
    var layout_ok = true;
    for (zig_layout, c_layout, 0..) |z, cv, i| {
        if (z != cv) {
            layout_ok = false;
            _ = esp_rom_printf("LAYOUT MISMATCH idx=%d zig=%d c=%d\n", @as(c_int, @intCast(i)), @as(c_int, @intCast(z)), @as(c_int, @intCast(cv)));
        }
    }
    _ = esp_rom_printf("LAYOUT ok=%d\n", @as(c_int, @intFromBool(layout_ok)));

    var bus_config = std.mem.zeroes(BusConfig);
    bus_config.i2c_port = c.I2C_NUM_0;
    bus_config.sda_io_num = 15;
    bus_config.scl_io_num = 14;
    bus_config.clk_source = c.I2C_CLK_SRC_DEFAULT;
    bus_config.glitch_ignore_cnt = 7;
    bus_config.flags = 1;
    var bus: c.i2c_master_bus_handle_t = null;
    const bus_rc = c.i2c_new_master_bus(@ptrCast(&bus_config), &bus);
    _ = esp_rom_printf("i2c_new_master_bus rc=%d\n", bus_rc);

    var device_config = std.mem.zeroes(DeviceConfig);
    device_config.dev_addr_length = c.I2C_ADDR_BIT_LEN_7;
    device_config.device_address = 0x51;
    device_config.scl_speed_hz = 400000;
    var rtc: c.i2c_master_dev_handle_t = null;
    const dev_rc = c.i2c_master_bus_add_device(bus, @ptrCast(&device_config), &rtc);
    _ = esp_rom_printf("i2c_master_bus_add_device rc=%d\n", dev_rc);

    while (true) {
        const reg = [1]u8{0x04};
        var raw: [7]u8 = undefined;
        const rc = c.i2c_master_transmit_receive(rtc, &reg, 1, &raw, 7, 100);
        if (rc != c.ESP_OK) {
            _ = esp_rom_printf("rtc read failed %d\n", rc);
        } else {
            _ = esp_rom_printf("DRTC %04d-%02d-%02d %02d:%02d:%02d osc=%d\n", 1970 + bcd(raw[6]), bcd(raw[5] & 0x1f), bcd(raw[3] & 0x3f), bcd(raw[2] & 0x3f), bcd(raw[1] & 0x7f), bcd(raw[0] & 0x7f), @as(c_int, raw[0] >> 7));
        }
        vTaskDelay(100);
    }
}
