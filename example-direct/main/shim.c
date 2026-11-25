#include <stddef.h>
#include "driver/i2c_master.h"

const unsigned c_layout[] = {
    sizeof(i2c_master_bus_config_t),
    offsetof(i2c_master_bus_config_t, i2c_port),
    offsetof(i2c_master_bus_config_t, sda_io_num),
    offsetof(i2c_master_bus_config_t, scl_io_num),
    offsetof(i2c_master_bus_config_t, clk_source),
    offsetof(i2c_master_bus_config_t, glitch_ignore_cnt),
    offsetof(i2c_master_bus_config_t, intr_priority),
    offsetof(i2c_master_bus_config_t, trans_queue_depth),
    offsetof(i2c_master_bus_config_t, flags),
    sizeof(i2c_device_config_t),
    offsetof(i2c_device_config_t, dev_addr_length),
    offsetof(i2c_device_config_t, device_address),
    offsetof(i2c_device_config_t, scl_speed_hz),
    offsetof(i2c_device_config_t, scl_wait_us),
    offsetof(i2c_device_config_t, flags),
};
const unsigned c_layout_len = sizeof(c_layout) / sizeof(c_layout[0]);
