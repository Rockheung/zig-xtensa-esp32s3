extern fn esp_rom_printf(fmt: [*:0]const u8, ...) c_int;
extern fn vTaskDelay(ticks: u32) void;

export fn app_main() void {
    var n: u32 = 0;
    while (true) : (n += 1) {
        _ = esp_rom_printf("zig says hello %d\n", n);
        vTaskDelay(100);
    }
}
