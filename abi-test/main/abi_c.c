#include <stdalign.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "esp_attr.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

typedef struct { uint8_t a, b, c; } S3b;
typedef struct { uint32_t a, b; } S8;
typedef struct { uint32_t a, b, c; } S12;
typedef struct { uint32_t a, b, c, d; } S16;
typedef struct { uint32_t v[6]; } S24;
typedef struct { uint64_t a; uint8_t b; } S16a;
typedef struct { double a, b; } D16;
typedef struct { uint32_t a : 3; uint32_t b : 5; uint32_t c : 1; uint32_t d : 7; uint32_t e : 16; } BF;
typedef int32_t (*cb8_t)(int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t);

static int pass_count, fail_count;
#define ABI_MAGIC 0xAB1C0DEu
static RTC_NOINIT_ATTR uint32_t abi_magic;
static RTC_NOINIT_ATTR uint32_t abi_resume_from;
static RTC_NOINIT_ATTR uint32_t abi_cur_seq;
static RTC_NOINIT_ATTR uint32_t abi_in_case;
static RTC_NOINIT_ATTR char abi_cur_name[48];
static uint32_t abi_seq;

int abi_begin(const char *name)
{
    uint32_t s = abi_seq++;
    if (s < abi_resume_from) {
        return 0;
    }
    abi_cur_seq = s;
    strncpy(abi_cur_name, name, sizeof abi_cur_name - 1);
    abi_in_case = 1;
    return 1;
}

void abi_end(const char *name, int ok)
{
    abi_in_case = 0;
    ok ? pass_count++ : fail_count++;
    printf("ABI %-28s %s\n", name, ok ? "PASS" : "FAIL");
}

static void abi_recover(void)
{
    esp_reset_reason_t reason = esp_reset_reason();
    if (abi_magic != ABI_MAGIC || (reason != ESP_RST_PANIC && reason != ESP_RST_SW)) {
        abi_magic = ABI_MAGIC;
        abi_resume_from = 0;
        abi_in_case = 0;
    } else if (abi_in_case) {
        printf("ABI %-28s CRASH\n", abi_cur_name);
        abi_resume_from = abi_cur_seq + 1;
        abi_in_case = 0;
    }
}

void abi_report(const char *name, int ok)
{
    ok ? pass_count++ : fail_count++;
    printf("ABI %-28s %s\n", name, ok ? "PASS" : "FAIL");
}

int32_t c_args10(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, int32_t a5, int32_t a6, int32_t a7,
                 int32_t a8, int32_t a9)
{
    return a0 * 1 + a1 * 2 + a2 * 3 + a3 * 4 + a4 * 5 + a5 * 6 + a6 * 7 + a7 * 8 + a8 * 9 + a9 * 10;
}
int32_t c_args8(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, int32_t a5, int32_t a6, int32_t a7)
{
    return a0 * 1 + a1 * 2 + a2 * 3 + a3 * 4 + a4 * 5 + a5 * 6 + a6 * 7 + a7 * 8;
}
uint64_t c_mix64(uint8_t a, uint64_t b, uint16_t c, uint64_t d, uint32_t e)
{
    return (uint64_t)a + b * 3 + (uint64_t)c * 5 + d * 7 + (uint64_t)e * 11;
}
float c_f32(float a, float b, float c) { return a * 2 + b * 3 + c * 5; }
double c_f64(double a, float b, double c, float d) { return a + b * 2 + c * 4 + d * 8; }
uint32_t c_st3(S3b s, int32_t k, S3b t)
{
    return s.a + 2u * s.b + 3u * s.c + 100u * (uint32_t)k + 7u * t.a + 11u * t.b + 13u * t.c;
}
uint32_t c_st8(uint8_t k, S8 s, S12 t) { return k + 2u * s.a + 3u * s.b + 5u * t.a + 7u * t.b + 11u * t.c; }
uint32_t c_st16(S16 s, S16a u, int32_t k) { return s.a + 2u * s.b + 3u * s.c + 4u * s.d + 5u * (uint32_t)u.a + 6u * u.b + 7u * (uint32_t)k; }
double c_d16(int32_t k, D16 d) { return k + d.a * 2 + d.b * 4; }
uint32_t c_st24(int32_t k, S24 s, int32_t m)
{
    uint32_t r = (uint32_t)k * 3 + (uint32_t)m * 5;
    for (int i = 0; i < 6; i++) {
        r += s.v[i] * (uint32_t)(i + 1);
    }
    return r;
}
S3b c_ret3(uint8_t a) { return (S3b){a, (uint8_t)(a + 1), (uint8_t)(a + 2)}; }
S8 c_ret8(uint32_t a) { return (S8){a, a + 1}; }
S16 c_ret16(uint32_t a) { return (S16){a, a + 1, a + 2, a + 3}; }
S24 c_ret24(uint32_t a) { return (S24){{a, a + 1, a + 2, a + 3, a + 4, a + 5}}; }
D16 c_retd(double a) { return (D16){a, a * 2}; }
int32_t c_apply(cb8_t cb) { return cb(1, 2, 3, 4, 5, 6, 7, 8); }
double c_vsum(int n, ...)
{
    va_list ap;
    va_start(ap, n);
    double sum = 0;
    for (int i = 0; i < n; i++) {
        switch (i % 3) {
        case 0: sum += va_arg(ap, int); break;
        case 1: sum += (double)va_arg(ap, int64_t); break;
        default: sum += va_arg(ap, double); break;
        }
    }
    va_end(ap);
    return sum;
}
extern uint32_t z_align(int depth);
uint32_t c_align(int depth)
{
    volatile uint8_t buf[32] __attribute__((aligned(16)));
    buf[0] = 1;
    uint32_t r = (uint32_t)(uintptr_t)buf & 15u;
    if (depth > 0) {
        r |= z_align(depth - 1);
    }
    return r;
}
uint32_t c_bf_raw(void)
{
    BF b = {.a = 5, .b = 19, .c = 1, .d = 100, .e = 0xABCD};
    uint32_t raw;
    __builtin_memcpy(&raw, &b, sizeof raw);
    return raw;
}
const uint32_t c_layout[] = {
    sizeof(S3b), alignof(S3b), sizeof(S8), sizeof(S12), sizeof(S24), sizeof(S16a), alignof(S16a),
    offsetof(S16a, b), sizeof(D16), alignof(D16), sizeof(BF),
};
const uint32_t c_layout_len = sizeof(c_layout) / sizeof(c_layout[0]);

extern int32_t z_args10(int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t);
extern int32_t z_args8(int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t);
extern uint64_t z_mix64(uint8_t, uint64_t, uint16_t, uint64_t, uint32_t);
extern float z_f32(float, float, float);
extern double z_f64(double, float, double, float);
extern uint32_t z_st3(S3b, int32_t, S3b);
extern uint32_t z_st8(uint8_t, S8, S12);
extern uint32_t z_st16(S16, S16a, int32_t);
extern double z_d16(int32_t, D16);
extern uint32_t z_st24(int32_t, S24, int32_t);
extern S3b z_ret3(uint8_t);
extern S8 z_ret8(uint32_t);
extern S16 z_ret16(uint32_t);
extern S24 z_ret24(uint32_t);
extern D16 z_ret_d(double);
extern int32_t z_apply(cb8_t);
extern double z_vsum(int, ...);
extern uint32_t z_bf_raw(void);
extern void z_run(void);
extern void z_sweep(void);
extern void c_sweep(void);

#define CHECK(name, cond) abi_report("c->z " name, (cond))

static void c_run(void)
{
    CHECK("args10", z_args10(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) == c_args10(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));
    CHECK("mix64", z_mix64(200, 0x123456789ABCDEFull, 60000, 0xFEDCBA9876543210ull, 0xDEADBEEFu) ==
                       c_mix64(200, 0x123456789ABCDEFull, 60000, 0xFEDCBA9876543210ull, 0xDEADBEEFu));
    CHECK("f32", z_f32(1.5f, 2.25f, 0.5f) == c_f32(1.5f, 2.25f, 0.5f));
    CHECK("f64", z_f64(1.5, 2.25f, 0.125, 4.5f) == c_f64(1.5, 2.25f, 0.125, 4.5f));
    S3b s3 = {10, 20, 30}, t3 = {3, 5, 7};
    CHECK("struct3 by value", z_st3(s3, 9, t3) == c_st3(s3, 9, t3));
    S8 s8 = {0x11111111u, 0x22222222u};
    S12 s12 = {1, 2, 3};
    CHECK("struct8/12 by value", z_st8(7, s8, s12) == c_st8(7, s8, s12));
    S16 s16 = {1, 2, 3, 4};
    S16a s16a = {0x1122334455667788ull, 9};
    CHECK("struct16/16a by value", z_st16(s16, s16a, 5) == c_st16(s16, s16a, 5));
    D16 d16 = {1.5, 2.5};
    CHECK("struct double2 by value", z_d16(3, d16) == c_d16(3, d16));
    S24 s24 = {{1, 2, 3, 4, 5, 6}};
    CHECK("struct24 by value", z_st24(2, s24, 4) == c_st24(2, s24, 4));
    S3b r3 = z_ret3(40), e3 = c_ret3(40);
    CHECK("return struct3", r3.a == e3.a && r3.b == e3.b && r3.c == e3.c);
    S8 r8 = z_ret8(100), e8 = c_ret8(100);
    CHECK("return struct8", r8.a == e8.a && r8.b == e8.b);
    S16 r16 = z_ret16(200), e16 = c_ret16(200);
    CHECK("return struct16", r16.a == e16.a && r16.b == e16.b && r16.c == e16.c && r16.d == e16.d);
    S24 r24 = z_ret24(300), e24 = c_ret24(300);
    CHECK("return struct24", __builtin_memcmp(&r24, &e24, sizeof r24) == 0);
    D16 rd = z_ret_d(1.25), ed = c_retd(1.25);
    CHECK("return struct double2", rd.a == ed.a && rd.b == ed.b);
    CHECK("callback c fn in zig", z_apply(c_args8) == c_args8(1, 2, 3, 4, 5, 6, 7, 8));
    CHECK("zig variadic callee", z_vsum(6, 1, (int64_t)2, 3.5, 4, (int64_t)5, 6.5) == 22.0);
    CHECK("stack align nest 5", (c_align(5) | z_align(5)) == 0);
    CHECK("bitfield raw", z_bf_raw() == c_bf_raw());
}

void app_main(void)
{
    vTaskDelay(pdMS_TO_TICKS(1500));
    abi_recover();
    printf("ABI BEGIN resume_from=%u\n", (unsigned)abi_resume_from);
    if (abi_resume_from == 0) {
        c_run();
        z_run();
    }
    c_sweep();
    z_sweep();
    abi_magic = 0;
    printf("ABI DONE pass=%d fail=%d\n", pass_count, fail_count);
    for (;;) {
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}
