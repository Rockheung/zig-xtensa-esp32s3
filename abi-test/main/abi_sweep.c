#include <stdint.h>
extern int abi_begin(const char *name);
extern void abi_end(const char *name, int ok);
#define ABI_CASE(name, expr) do { if (abi_begin(name)) abi_end(name, (expr)); } while (0)

typedef struct { uint8_t b[1]; } B1;
typedef struct { uint8_t b[2]; } B2;
typedef struct { uint8_t b[3]; } B3;
typedef struct { uint8_t b[4]; } B4;
typedef struct { uint8_t b[5]; } B5;
typedef struct { uint8_t b[6]; } B6;
typedef struct { uint8_t b[7]; } B7;
typedef struct { uint8_t b[8]; } B8;
typedef struct { uint8_t b[9]; } B9;
typedef struct { uint8_t b[12]; } B12;
typedef struct { uint8_t b[13]; } B13;
typedef struct { uint8_t b[16]; } B16;
typedef struct { uint8_t b[17]; } B17;
typedef struct { uint8_t b[20]; } B20;
typedef struct { uint8_t b[24]; } B24;
typedef struct { uint8_t b[28]; } B28;
typedef struct { uint8_t b[32]; } B32;
typedef struct { uint64_t a; } A8;
typedef struct { uint64_t a; uint32_t b; } A16;
typedef struct { uint32_t a; uint64_t b; } A16b;
typedef struct { uint8_t a; uint32_t b; } M8;
typedef struct { uint8_t a; uint16_t b; uint32_t c; } M12;
typedef struct { float a; } F4;
typedef struct { float a; float b; } F8;
typedef struct { float a; float b; float c; } F12;
typedef struct { double a; } D8;
typedef struct { double a; double b; } D16;

double c_B1_first(B1 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1; }
double c_B1_odd(int32_t a0, B1 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1; }
double c_B1_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B1 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1; }
B1 c_B1_ret(uint32_t seed) { B1 r; r.b[0] = (uint8_t)(seed + 0); return r; }
double c_B2_first(B2 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2; }
double c_B2_odd(int32_t a0, B2 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2; }
double c_B2_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B2 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2; }
B2 c_B2_ret(uint32_t seed) { B2 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); return r; }
double c_B3_first(B3 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3; }
double c_B3_odd(int32_t a0, B3 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3; }
double c_B3_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B3 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3; }
B3 c_B3_ret(uint32_t seed) { B3 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); return r; }
double c_B4_first(B4 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4; }
double c_B4_odd(int32_t a0, B4 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4; }
double c_B4_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B4 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4; }
B4 c_B4_ret(uint32_t seed) { B4 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); return r; }
double c_B5_first(B5 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5; }
double c_B5_odd(int32_t a0, B5 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5; }
double c_B5_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B5 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5; }
B5 c_B5_ret(uint32_t seed) { B5 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); return r; }
double c_B6_first(B6 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6; }
double c_B6_odd(int32_t a0, B6 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6; }
double c_B6_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B6 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6; }
B6 c_B6_ret(uint32_t seed) { B6 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); r.b[5] = (uint8_t)(seed + 5); return r; }
double c_B7_first(B7 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7; }
double c_B7_odd(int32_t a0, B7 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7; }
double c_B7_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B7 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7; }
B7 c_B7_ret(uint32_t seed) { B7 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); r.b[5] = (uint8_t)(seed + 5); r.b[6] = (uint8_t)(seed + 6); return r; }
double c_B8_first(B8 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8; }
double c_B8_odd(int32_t a0, B8 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8; }
double c_B8_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B8 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8; }
B8 c_B8_ret(uint32_t seed) { B8 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); r.b[5] = (uint8_t)(seed + 5); r.b[6] = (uint8_t)(seed + 6); r.b[7] = (uint8_t)(seed + 7); return r; }
double c_B9_first(B9 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9; }
double c_B9_odd(int32_t a0, B9 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9; }
double c_B9_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B9 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9; }
B9 c_B9_ret(uint32_t seed) { B9 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); r.b[5] = (uint8_t)(seed + 5); r.b[6] = (uint8_t)(seed + 6); r.b[7] = (uint8_t)(seed + 7); r.b[8] = (uint8_t)(seed + 8); return r; }
double c_B12_first(B12 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12; }
double c_B12_odd(int32_t a0, B12 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12; }
double c_B12_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B12 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12; }
B12 c_B12_ret(uint32_t seed) { B12 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); r.b[5] = (uint8_t)(seed + 5); r.b[6] = (uint8_t)(seed + 6); r.b[7] = (uint8_t)(seed + 7); r.b[8] = (uint8_t)(seed + 8); r.b[9] = (uint8_t)(seed + 9); r.b[10] = (uint8_t)(seed + 10); r.b[11] = (uint8_t)(seed + 11); return r; }
double c_B13_first(B13 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13; }
double c_B13_odd(int32_t a0, B13 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13; }
double c_B13_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B13 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13; }
B13 c_B13_ret(uint32_t seed) { B13 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); r.b[5] = (uint8_t)(seed + 5); r.b[6] = (uint8_t)(seed + 6); r.b[7] = (uint8_t)(seed + 7); r.b[8] = (uint8_t)(seed + 8); r.b[9] = (uint8_t)(seed + 9); r.b[10] = (uint8_t)(seed + 10); r.b[11] = (uint8_t)(seed + 11); r.b[12] = (uint8_t)(seed + 12); return r; }
double c_B16_first(B16 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16; }
double c_B16_odd(int32_t a0, B16 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16; }
double c_B16_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B16 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16; }
B16 c_B16_ret(uint32_t seed) { B16 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); r.b[5] = (uint8_t)(seed + 5); r.b[6] = (uint8_t)(seed + 6); r.b[7] = (uint8_t)(seed + 7); r.b[8] = (uint8_t)(seed + 8); r.b[9] = (uint8_t)(seed + 9); r.b[10] = (uint8_t)(seed + 10); r.b[11] = (uint8_t)(seed + 11); r.b[12] = (uint8_t)(seed + 12); r.b[13] = (uint8_t)(seed + 13); r.b[14] = (uint8_t)(seed + 14); r.b[15] = (uint8_t)(seed + 15); return r; }
double c_B17_first(B17 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17; }
double c_B17_odd(int32_t a0, B17 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17; }
double c_B17_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B17 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17; }
B17 c_B17_ret(uint32_t seed) { B17 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); r.b[5] = (uint8_t)(seed + 5); r.b[6] = (uint8_t)(seed + 6); r.b[7] = (uint8_t)(seed + 7); r.b[8] = (uint8_t)(seed + 8); r.b[9] = (uint8_t)(seed + 9); r.b[10] = (uint8_t)(seed + 10); r.b[11] = (uint8_t)(seed + 11); r.b[12] = (uint8_t)(seed + 12); r.b[13] = (uint8_t)(seed + 13); r.b[14] = (uint8_t)(seed + 14); r.b[15] = (uint8_t)(seed + 15); r.b[16] = (uint8_t)(seed + 16); return r; }
double c_B20_first(B20 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17 + (double)s.b[17] * 18 + (double)s.b[18] * 19 + (double)s.b[19] * 20; }
double c_B20_odd(int32_t a0, B20 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17 + (double)s.b[17] * 18 + (double)s.b[18] * 19 + (double)s.b[19] * 20; }
double c_B20_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B20 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17 + (double)s.b[17] * 18 + (double)s.b[18] * 19 + (double)s.b[19] * 20; }
B20 c_B20_ret(uint32_t seed) { B20 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); r.b[5] = (uint8_t)(seed + 5); r.b[6] = (uint8_t)(seed + 6); r.b[7] = (uint8_t)(seed + 7); r.b[8] = (uint8_t)(seed + 8); r.b[9] = (uint8_t)(seed + 9); r.b[10] = (uint8_t)(seed + 10); r.b[11] = (uint8_t)(seed + 11); r.b[12] = (uint8_t)(seed + 12); r.b[13] = (uint8_t)(seed + 13); r.b[14] = (uint8_t)(seed + 14); r.b[15] = (uint8_t)(seed + 15); r.b[16] = (uint8_t)(seed + 16); r.b[17] = (uint8_t)(seed + 17); r.b[18] = (uint8_t)(seed + 18); r.b[19] = (uint8_t)(seed + 19); return r; }
double c_B24_first(B24 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17 + (double)s.b[17] * 18 + (double)s.b[18] * 19 + (double)s.b[19] * 20 + (double)s.b[20] * 21 + (double)s.b[21] * 22 + (double)s.b[22] * 23 + (double)s.b[23] * 24; }
double c_B24_odd(int32_t a0, B24 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17 + (double)s.b[17] * 18 + (double)s.b[18] * 19 + (double)s.b[19] * 20 + (double)s.b[20] * 21 + (double)s.b[21] * 22 + (double)s.b[22] * 23 + (double)s.b[23] * 24; }
double c_B24_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B24 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17 + (double)s.b[17] * 18 + (double)s.b[18] * 19 + (double)s.b[19] * 20 + (double)s.b[20] * 21 + (double)s.b[21] * 22 + (double)s.b[22] * 23 + (double)s.b[23] * 24; }
B24 c_B24_ret(uint32_t seed) { B24 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); r.b[5] = (uint8_t)(seed + 5); r.b[6] = (uint8_t)(seed + 6); r.b[7] = (uint8_t)(seed + 7); r.b[8] = (uint8_t)(seed + 8); r.b[9] = (uint8_t)(seed + 9); r.b[10] = (uint8_t)(seed + 10); r.b[11] = (uint8_t)(seed + 11); r.b[12] = (uint8_t)(seed + 12); r.b[13] = (uint8_t)(seed + 13); r.b[14] = (uint8_t)(seed + 14); r.b[15] = (uint8_t)(seed + 15); r.b[16] = (uint8_t)(seed + 16); r.b[17] = (uint8_t)(seed + 17); r.b[18] = (uint8_t)(seed + 18); r.b[19] = (uint8_t)(seed + 19); r.b[20] = (uint8_t)(seed + 20); r.b[21] = (uint8_t)(seed + 21); r.b[22] = (uint8_t)(seed + 22); r.b[23] = (uint8_t)(seed + 23); return r; }
double c_B28_first(B28 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17 + (double)s.b[17] * 18 + (double)s.b[18] * 19 + (double)s.b[19] * 20 + (double)s.b[20] * 21 + (double)s.b[21] * 22 + (double)s.b[22] * 23 + (double)s.b[23] * 24 + (double)s.b[24] * 25 + (double)s.b[25] * 26 + (double)s.b[26] * 27 + (double)s.b[27] * 28; }
double c_B28_odd(int32_t a0, B28 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17 + (double)s.b[17] * 18 + (double)s.b[18] * 19 + (double)s.b[19] * 20 + (double)s.b[20] * 21 + (double)s.b[21] * 22 + (double)s.b[22] * 23 + (double)s.b[23] * 24 + (double)s.b[24] * 25 + (double)s.b[25] * 26 + (double)s.b[26] * 27 + (double)s.b[27] * 28; }
double c_B28_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B28 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17 + (double)s.b[17] * 18 + (double)s.b[18] * 19 + (double)s.b[19] * 20 + (double)s.b[20] * 21 + (double)s.b[21] * 22 + (double)s.b[22] * 23 + (double)s.b[23] * 24 + (double)s.b[24] * 25 + (double)s.b[25] * 26 + (double)s.b[26] * 27 + (double)s.b[27] * 28; }
B28 c_B28_ret(uint32_t seed) { B28 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); r.b[5] = (uint8_t)(seed + 5); r.b[6] = (uint8_t)(seed + 6); r.b[7] = (uint8_t)(seed + 7); r.b[8] = (uint8_t)(seed + 8); r.b[9] = (uint8_t)(seed + 9); r.b[10] = (uint8_t)(seed + 10); r.b[11] = (uint8_t)(seed + 11); r.b[12] = (uint8_t)(seed + 12); r.b[13] = (uint8_t)(seed + 13); r.b[14] = (uint8_t)(seed + 14); r.b[15] = (uint8_t)(seed + 15); r.b[16] = (uint8_t)(seed + 16); r.b[17] = (uint8_t)(seed + 17); r.b[18] = (uint8_t)(seed + 18); r.b[19] = (uint8_t)(seed + 19); r.b[20] = (uint8_t)(seed + 20); r.b[21] = (uint8_t)(seed + 21); r.b[22] = (uint8_t)(seed + 22); r.b[23] = (uint8_t)(seed + 23); r.b[24] = (uint8_t)(seed + 24); r.b[25] = (uint8_t)(seed + 25); r.b[26] = (uint8_t)(seed + 26); r.b[27] = (uint8_t)(seed + 27); return r; }
double c_B32_first(B32 s, int32_t k) { return k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17 + (double)s.b[17] * 18 + (double)s.b[18] * 19 + (double)s.b[19] * 20 + (double)s.b[20] * 21 + (double)s.b[21] * 22 + (double)s.b[22] * 23 + (double)s.b[23] * 24 + (double)s.b[24] * 25 + (double)s.b[25] * 26 + (double)s.b[26] * 27 + (double)s.b[27] * 28 + (double)s.b[28] * 29 + (double)s.b[29] * 30 + (double)s.b[30] * 31 + (double)s.b[31] * 32; }
double c_B32_odd(int32_t a0, B32 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17 + (double)s.b[17] * 18 + (double)s.b[18] * 19 + (double)s.b[19] * 20 + (double)s.b[20] * 21 + (double)s.b[21] * 22 + (double)s.b[22] * 23 + (double)s.b[23] * 24 + (double)s.b[24] * 25 + (double)s.b[25] * 26 + (double)s.b[26] * 27 + (double)s.b[27] * 28 + (double)s.b[28] * 29 + (double)s.b[29] * 30 + (double)s.b[30] * 31 + (double)s.b[31] * 32; }
double c_B32_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, B32 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.b[0] * 1 + (double)s.b[1] * 2 + (double)s.b[2] * 3 + (double)s.b[3] * 4 + (double)s.b[4] * 5 + (double)s.b[5] * 6 + (double)s.b[6] * 7 + (double)s.b[7] * 8 + (double)s.b[8] * 9 + (double)s.b[9] * 10 + (double)s.b[10] * 11 + (double)s.b[11] * 12 + (double)s.b[12] * 13 + (double)s.b[13] * 14 + (double)s.b[14] * 15 + (double)s.b[15] * 16 + (double)s.b[16] * 17 + (double)s.b[17] * 18 + (double)s.b[18] * 19 + (double)s.b[19] * 20 + (double)s.b[20] * 21 + (double)s.b[21] * 22 + (double)s.b[22] * 23 + (double)s.b[23] * 24 + (double)s.b[24] * 25 + (double)s.b[25] * 26 + (double)s.b[26] * 27 + (double)s.b[27] * 28 + (double)s.b[28] * 29 + (double)s.b[29] * 30 + (double)s.b[30] * 31 + (double)s.b[31] * 32; }
B32 c_B32_ret(uint32_t seed) { B32 r; r.b[0] = (uint8_t)(seed + 0); r.b[1] = (uint8_t)(seed + 1); r.b[2] = (uint8_t)(seed + 2); r.b[3] = (uint8_t)(seed + 3); r.b[4] = (uint8_t)(seed + 4); r.b[5] = (uint8_t)(seed + 5); r.b[6] = (uint8_t)(seed + 6); r.b[7] = (uint8_t)(seed + 7); r.b[8] = (uint8_t)(seed + 8); r.b[9] = (uint8_t)(seed + 9); r.b[10] = (uint8_t)(seed + 10); r.b[11] = (uint8_t)(seed + 11); r.b[12] = (uint8_t)(seed + 12); r.b[13] = (uint8_t)(seed + 13); r.b[14] = (uint8_t)(seed + 14); r.b[15] = (uint8_t)(seed + 15); r.b[16] = (uint8_t)(seed + 16); r.b[17] = (uint8_t)(seed + 17); r.b[18] = (uint8_t)(seed + 18); r.b[19] = (uint8_t)(seed + 19); r.b[20] = (uint8_t)(seed + 20); r.b[21] = (uint8_t)(seed + 21); r.b[22] = (uint8_t)(seed + 22); r.b[23] = (uint8_t)(seed + 23); r.b[24] = (uint8_t)(seed + 24); r.b[25] = (uint8_t)(seed + 25); r.b[26] = (uint8_t)(seed + 26); r.b[27] = (uint8_t)(seed + 27); r.b[28] = (uint8_t)(seed + 28); r.b[29] = (uint8_t)(seed + 29); r.b[30] = (uint8_t)(seed + 30); r.b[31] = (uint8_t)(seed + 31); return r; }
double c_A8_first(A8 s, int32_t k) { return k * 1000.0 + (double)s.a * 1; }
double c_A8_odd(int32_t a0, A8 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.a * 1; }
double c_A8_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, A8 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.a * 1; }
A8 c_A8_ret(uint32_t seed) { A8 r; r.a = (uint64_t)(seed + 0); return r; }
double c_A16_first(A16 s, int32_t k) { return k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
double c_A16_odd(int32_t a0, A16 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
double c_A16_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, A16 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
A16 c_A16_ret(uint32_t seed) { A16 r; r.a = (uint64_t)(seed + 0); r.b = (uint32_t)(seed + 1); return r; }
double c_A16b_first(A16b s, int32_t k) { return k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
double c_A16b_odd(int32_t a0, A16b s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
double c_A16b_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, A16b s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
A16b c_A16b_ret(uint32_t seed) { A16b r; r.a = (uint32_t)(seed + 0); r.b = (uint64_t)(seed + 1); return r; }
double c_M8_first(M8 s, int32_t k) { return k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
double c_M8_odd(int32_t a0, M8 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
double c_M8_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, M8 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
M8 c_M8_ret(uint32_t seed) { M8 r; r.a = (uint8_t)(seed + 0); r.b = (uint32_t)(seed + 1); return r; }
double c_M12_first(M12 s, int32_t k) { return k * 1000.0 + (double)s.a * 1 + (double)s.b * 2 + (double)s.c * 3; }
double c_M12_odd(int32_t a0, M12 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2 + (double)s.c * 3; }
double c_M12_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, M12 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2 + (double)s.c * 3; }
M12 c_M12_ret(uint32_t seed) { M12 r; r.a = (uint8_t)(seed + 0); r.b = (uint16_t)(seed + 1); r.c = (uint32_t)(seed + 2); return r; }
double c_F4_first(F4 s, int32_t k) { return k * 1000.0 + (double)s.a * 1; }
double c_F4_odd(int32_t a0, F4 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.a * 1; }
double c_F4_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, F4 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.a * 1; }
F4 c_F4_ret(uint32_t seed) { F4 r; r.a = (float)(seed + 0); return r; }
double c_F8_first(F8 s, int32_t k) { return k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
double c_F8_odd(int32_t a0, F8 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
double c_F8_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, F8 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
F8 c_F8_ret(uint32_t seed) { F8 r; r.a = (float)(seed + 0); r.b = (float)(seed + 1); return r; }
double c_F12_first(F12 s, int32_t k) { return k * 1000.0 + (double)s.a * 1 + (double)s.b * 2 + (double)s.c * 3; }
double c_F12_odd(int32_t a0, F12 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2 + (double)s.c * 3; }
double c_F12_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, F12 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2 + (double)s.c * 3; }
F12 c_F12_ret(uint32_t seed) { F12 r; r.a = (float)(seed + 0); r.b = (float)(seed + 1); r.c = (float)(seed + 2); return r; }
double c_D8_first(D8 s, int32_t k) { return k * 1000.0 + (double)s.a * 1; }
double c_D8_odd(int32_t a0, D8 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.a * 1; }
double c_D8_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, D8 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.a * 1; }
D8 c_D8_ret(uint32_t seed) { D8 r; r.a = (double)(seed + 0); return r; }
double c_D16_first(D16 s, int32_t k) { return k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
double c_D16_odd(int32_t a0, D16 s, int32_t k) { return a0 * 7.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
double c_D16_late(int32_t a0, int32_t a1, int32_t a2, int32_t a3, int32_t a4, D16 s, int32_t k) { return a0 + a1 * 2.0 + a2 * 3.0 + a3 * 4.0 + a4 * 5.0 + k * 1000.0 + (double)s.a * 1 + (double)s.b * 2; }
D16 c_D16_ret(uint32_t seed) { D16 r; r.a = (double)(seed + 0); r.b = (double)(seed + 1); return r; }

extern double z_B1_first(B1, int32_t);
extern double z_B1_odd(int32_t, B1, int32_t);
extern double z_B1_late(int32_t, int32_t, int32_t, int32_t, int32_t, B1, int32_t);
extern B1 z_B1_ret(uint32_t);
extern double z_B2_first(B2, int32_t);
extern double z_B2_odd(int32_t, B2, int32_t);
extern double z_B2_late(int32_t, int32_t, int32_t, int32_t, int32_t, B2, int32_t);
extern B2 z_B2_ret(uint32_t);
extern double z_B3_first(B3, int32_t);
extern double z_B3_odd(int32_t, B3, int32_t);
extern double z_B3_late(int32_t, int32_t, int32_t, int32_t, int32_t, B3, int32_t);
extern B3 z_B3_ret(uint32_t);
extern double z_B4_first(B4, int32_t);
extern double z_B4_odd(int32_t, B4, int32_t);
extern double z_B4_late(int32_t, int32_t, int32_t, int32_t, int32_t, B4, int32_t);
extern B4 z_B4_ret(uint32_t);
extern double z_B5_first(B5, int32_t);
extern double z_B5_odd(int32_t, B5, int32_t);
extern double z_B5_late(int32_t, int32_t, int32_t, int32_t, int32_t, B5, int32_t);
extern B5 z_B5_ret(uint32_t);
extern double z_B6_first(B6, int32_t);
extern double z_B6_odd(int32_t, B6, int32_t);
extern double z_B6_late(int32_t, int32_t, int32_t, int32_t, int32_t, B6, int32_t);
extern B6 z_B6_ret(uint32_t);
extern double z_B7_first(B7, int32_t);
extern double z_B7_odd(int32_t, B7, int32_t);
extern double z_B7_late(int32_t, int32_t, int32_t, int32_t, int32_t, B7, int32_t);
extern B7 z_B7_ret(uint32_t);
extern double z_B8_first(B8, int32_t);
extern double z_B8_odd(int32_t, B8, int32_t);
extern double z_B8_late(int32_t, int32_t, int32_t, int32_t, int32_t, B8, int32_t);
extern B8 z_B8_ret(uint32_t);
extern double z_B9_first(B9, int32_t);
extern double z_B9_odd(int32_t, B9, int32_t);
extern double z_B9_late(int32_t, int32_t, int32_t, int32_t, int32_t, B9, int32_t);
extern B9 z_B9_ret(uint32_t);
extern double z_B12_first(B12, int32_t);
extern double z_B12_odd(int32_t, B12, int32_t);
extern double z_B12_late(int32_t, int32_t, int32_t, int32_t, int32_t, B12, int32_t);
extern B12 z_B12_ret(uint32_t);
extern double z_B13_first(B13, int32_t);
extern double z_B13_odd(int32_t, B13, int32_t);
extern double z_B13_late(int32_t, int32_t, int32_t, int32_t, int32_t, B13, int32_t);
extern B13 z_B13_ret(uint32_t);
extern double z_B16_first(B16, int32_t);
extern double z_B16_odd(int32_t, B16, int32_t);
extern double z_B16_late(int32_t, int32_t, int32_t, int32_t, int32_t, B16, int32_t);
extern B16 z_B16_ret(uint32_t);
extern double z_B17_first(B17, int32_t);
extern double z_B17_odd(int32_t, B17, int32_t);
extern double z_B17_late(int32_t, int32_t, int32_t, int32_t, int32_t, B17, int32_t);
extern B17 z_B17_ret(uint32_t);
extern double z_B20_first(B20, int32_t);
extern double z_B20_odd(int32_t, B20, int32_t);
extern double z_B20_late(int32_t, int32_t, int32_t, int32_t, int32_t, B20, int32_t);
extern B20 z_B20_ret(uint32_t);
extern double z_B24_first(B24, int32_t);
extern double z_B24_odd(int32_t, B24, int32_t);
extern double z_B24_late(int32_t, int32_t, int32_t, int32_t, int32_t, B24, int32_t);
extern B24 z_B24_ret(uint32_t);
extern double z_B28_first(B28, int32_t);
extern double z_B28_odd(int32_t, B28, int32_t);
extern double z_B28_late(int32_t, int32_t, int32_t, int32_t, int32_t, B28, int32_t);
extern B28 z_B28_ret(uint32_t);
extern double z_B32_first(B32, int32_t);
extern double z_B32_odd(int32_t, B32, int32_t);
extern double z_B32_late(int32_t, int32_t, int32_t, int32_t, int32_t, B32, int32_t);
extern B32 z_B32_ret(uint32_t);
extern double z_A8_first(A8, int32_t);
extern double z_A8_odd(int32_t, A8, int32_t);
extern double z_A8_late(int32_t, int32_t, int32_t, int32_t, int32_t, A8, int32_t);
extern A8 z_A8_ret(uint32_t);
extern double z_A16_first(A16, int32_t);
extern double z_A16_odd(int32_t, A16, int32_t);
extern double z_A16_late(int32_t, int32_t, int32_t, int32_t, int32_t, A16, int32_t);
extern A16 z_A16_ret(uint32_t);
extern double z_A16b_first(A16b, int32_t);
extern double z_A16b_odd(int32_t, A16b, int32_t);
extern double z_A16b_late(int32_t, int32_t, int32_t, int32_t, int32_t, A16b, int32_t);
extern A16b z_A16b_ret(uint32_t);
extern double z_M8_first(M8, int32_t);
extern double z_M8_odd(int32_t, M8, int32_t);
extern double z_M8_late(int32_t, int32_t, int32_t, int32_t, int32_t, M8, int32_t);
extern M8 z_M8_ret(uint32_t);
extern double z_M12_first(M12, int32_t);
extern double z_M12_odd(int32_t, M12, int32_t);
extern double z_M12_late(int32_t, int32_t, int32_t, int32_t, int32_t, M12, int32_t);
extern M12 z_M12_ret(uint32_t);
extern double z_F4_first(F4, int32_t);
extern double z_F4_odd(int32_t, F4, int32_t);
extern double z_F4_late(int32_t, int32_t, int32_t, int32_t, int32_t, F4, int32_t);
extern F4 z_F4_ret(uint32_t);
extern double z_F8_first(F8, int32_t);
extern double z_F8_odd(int32_t, F8, int32_t);
extern double z_F8_late(int32_t, int32_t, int32_t, int32_t, int32_t, F8, int32_t);
extern F8 z_F8_ret(uint32_t);
extern double z_F12_first(F12, int32_t);
extern double z_F12_odd(int32_t, F12, int32_t);
extern double z_F12_late(int32_t, int32_t, int32_t, int32_t, int32_t, F12, int32_t);
extern F12 z_F12_ret(uint32_t);
extern double z_D8_first(D8, int32_t);
extern double z_D8_odd(int32_t, D8, int32_t);
extern double z_D8_late(int32_t, int32_t, int32_t, int32_t, int32_t, D8, int32_t);
extern D8 z_D8_ret(uint32_t);
extern double z_D16_first(D16, int32_t);
extern double z_D16_odd(int32_t, D16, int32_t);
extern double z_D16_late(int32_t, int32_t, int32_t, int32_t, int32_t, D16, int32_t);
extern D16 z_D16_ret(uint32_t);
void c_sweep(void)
{
    {
        B1 v = {{3}};
        ABI_CASE("c->z B1 first", z_B1_first(v, 7) == c_B1_first(v, 7));
        ABI_CASE("c->z B1 odd", z_B1_odd(3, v, 7) == c_B1_odd(3, v, 7));
        ABI_CASE("c->z B1 late", z_B1_late(1, 2, 3, 4, 5, v, 7) == c_B1_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B1 ret")) {
            B1 x = z_B1_ret(40), y = c_B1_ret(40);
            abi_end("c->z B1 ret", x.b[0] == y.b[0]);
        }
    }
    {
        B2 v = {{3, 5}};
        ABI_CASE("c->z B2 first", z_B2_first(v, 7) == c_B2_first(v, 7));
        ABI_CASE("c->z B2 odd", z_B2_odd(3, v, 7) == c_B2_odd(3, v, 7));
        ABI_CASE("c->z B2 late", z_B2_late(1, 2, 3, 4, 5, v, 7) == c_B2_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B2 ret")) {
            B2 x = z_B2_ret(40), y = c_B2_ret(40);
            abi_end("c->z B2 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1]);
        }
    }
    {
        B3 v = {{3, 5, 7}};
        ABI_CASE("c->z B3 first", z_B3_first(v, 7) == c_B3_first(v, 7));
        ABI_CASE("c->z B3 odd", z_B3_odd(3, v, 7) == c_B3_odd(3, v, 7));
        ABI_CASE("c->z B3 late", z_B3_late(1, 2, 3, 4, 5, v, 7) == c_B3_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B3 ret")) {
            B3 x = z_B3_ret(40), y = c_B3_ret(40);
            abi_end("c->z B3 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2]);
        }
    }
    {
        B4 v = {{3, 5, 7, 9}};
        ABI_CASE("c->z B4 first", z_B4_first(v, 7) == c_B4_first(v, 7));
        ABI_CASE("c->z B4 odd", z_B4_odd(3, v, 7) == c_B4_odd(3, v, 7));
        ABI_CASE("c->z B4 late", z_B4_late(1, 2, 3, 4, 5, v, 7) == c_B4_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B4 ret")) {
            B4 x = z_B4_ret(40), y = c_B4_ret(40);
            abi_end("c->z B4 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3]);
        }
    }
    {
        B5 v = {{3, 5, 7, 9, 11}};
        ABI_CASE("c->z B5 first", z_B5_first(v, 7) == c_B5_first(v, 7));
        ABI_CASE("c->z B5 odd", z_B5_odd(3, v, 7) == c_B5_odd(3, v, 7));
        ABI_CASE("c->z B5 late", z_B5_late(1, 2, 3, 4, 5, v, 7) == c_B5_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B5 ret")) {
            B5 x = z_B5_ret(40), y = c_B5_ret(40);
            abi_end("c->z B5 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4]);
        }
    }
    {
        B6 v = {{3, 5, 7, 9, 11, 13}};
        ABI_CASE("c->z B6 first", z_B6_first(v, 7) == c_B6_first(v, 7));
        ABI_CASE("c->z B6 odd", z_B6_odd(3, v, 7) == c_B6_odd(3, v, 7));
        ABI_CASE("c->z B6 late", z_B6_late(1, 2, 3, 4, 5, v, 7) == c_B6_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B6 ret")) {
            B6 x = z_B6_ret(40), y = c_B6_ret(40);
            abi_end("c->z B6 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4] && x.b[5] == y.b[5]);
        }
    }
    {
        B7 v = {{3, 5, 7, 9, 11, 13, 15}};
        ABI_CASE("c->z B7 first", z_B7_first(v, 7) == c_B7_first(v, 7));
        ABI_CASE("c->z B7 odd", z_B7_odd(3, v, 7) == c_B7_odd(3, v, 7));
        ABI_CASE("c->z B7 late", z_B7_late(1, 2, 3, 4, 5, v, 7) == c_B7_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B7 ret")) {
            B7 x = z_B7_ret(40), y = c_B7_ret(40);
            abi_end("c->z B7 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4] && x.b[5] == y.b[5] && x.b[6] == y.b[6]);
        }
    }
    {
        B8 v = {{3, 5, 7, 9, 11, 13, 15, 17}};
        ABI_CASE("c->z B8 first", z_B8_first(v, 7) == c_B8_first(v, 7));
        ABI_CASE("c->z B8 odd", z_B8_odd(3, v, 7) == c_B8_odd(3, v, 7));
        ABI_CASE("c->z B8 late", z_B8_late(1, 2, 3, 4, 5, v, 7) == c_B8_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B8 ret")) {
            B8 x = z_B8_ret(40), y = c_B8_ret(40);
            abi_end("c->z B8 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4] && x.b[5] == y.b[5] && x.b[6] == y.b[6] && x.b[7] == y.b[7]);
        }
    }
    {
        B9 v = {{3, 5, 7, 9, 11, 13, 15, 17, 19}};
        ABI_CASE("c->z B9 first", z_B9_first(v, 7) == c_B9_first(v, 7));
        ABI_CASE("c->z B9 odd", z_B9_odd(3, v, 7) == c_B9_odd(3, v, 7));
        ABI_CASE("c->z B9 late", z_B9_late(1, 2, 3, 4, 5, v, 7) == c_B9_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B9 ret")) {
            B9 x = z_B9_ret(40), y = c_B9_ret(40);
            abi_end("c->z B9 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4] && x.b[5] == y.b[5] && x.b[6] == y.b[6] && x.b[7] == y.b[7] && x.b[8] == y.b[8]);
        }
    }
    {
        B12 v = {{3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25}};
        ABI_CASE("c->z B12 first", z_B12_first(v, 7) == c_B12_first(v, 7));
        ABI_CASE("c->z B12 odd", z_B12_odd(3, v, 7) == c_B12_odd(3, v, 7));
        ABI_CASE("c->z B12 late", z_B12_late(1, 2, 3, 4, 5, v, 7) == c_B12_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B12 ret")) {
            B12 x = z_B12_ret(40), y = c_B12_ret(40);
            abi_end("c->z B12 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4] && x.b[5] == y.b[5] && x.b[6] == y.b[6] && x.b[7] == y.b[7] && x.b[8] == y.b[8] && x.b[9] == y.b[9] && x.b[10] == y.b[10] && x.b[11] == y.b[11]);
        }
    }
    {
        B13 v = {{3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27}};
        ABI_CASE("c->z B13 first", z_B13_first(v, 7) == c_B13_first(v, 7));
        ABI_CASE("c->z B13 odd", z_B13_odd(3, v, 7) == c_B13_odd(3, v, 7));
        ABI_CASE("c->z B13 late", z_B13_late(1, 2, 3, 4, 5, v, 7) == c_B13_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B13 ret")) {
            B13 x = z_B13_ret(40), y = c_B13_ret(40);
            abi_end("c->z B13 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4] && x.b[5] == y.b[5] && x.b[6] == y.b[6] && x.b[7] == y.b[7] && x.b[8] == y.b[8] && x.b[9] == y.b[9] && x.b[10] == y.b[10] && x.b[11] == y.b[11] && x.b[12] == y.b[12]);
        }
    }
    {
        B16 v = {{3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33}};
        ABI_CASE("c->z B16 first", z_B16_first(v, 7) == c_B16_first(v, 7));
        ABI_CASE("c->z B16 odd", z_B16_odd(3, v, 7) == c_B16_odd(3, v, 7));
        ABI_CASE("c->z B16 late", z_B16_late(1, 2, 3, 4, 5, v, 7) == c_B16_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B16 ret")) {
            B16 x = z_B16_ret(40), y = c_B16_ret(40);
            abi_end("c->z B16 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4] && x.b[5] == y.b[5] && x.b[6] == y.b[6] && x.b[7] == y.b[7] && x.b[8] == y.b[8] && x.b[9] == y.b[9] && x.b[10] == y.b[10] && x.b[11] == y.b[11] && x.b[12] == y.b[12] && x.b[13] == y.b[13] && x.b[14] == y.b[14] && x.b[15] == y.b[15]);
        }
    }
    {
        B17 v = {{3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35}};
        ABI_CASE("c->z B17 first", z_B17_first(v, 7) == c_B17_first(v, 7));
        ABI_CASE("c->z B17 odd", z_B17_odd(3, v, 7) == c_B17_odd(3, v, 7));
        ABI_CASE("c->z B17 late", z_B17_late(1, 2, 3, 4, 5, v, 7) == c_B17_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B17 ret")) {
            B17 x = z_B17_ret(40), y = c_B17_ret(40);
            abi_end("c->z B17 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4] && x.b[5] == y.b[5] && x.b[6] == y.b[6] && x.b[7] == y.b[7] && x.b[8] == y.b[8] && x.b[9] == y.b[9] && x.b[10] == y.b[10] && x.b[11] == y.b[11] && x.b[12] == y.b[12] && x.b[13] == y.b[13] && x.b[14] == y.b[14] && x.b[15] == y.b[15] && x.b[16] == y.b[16]);
        }
    }
    {
        B20 v = {{3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41}};
        ABI_CASE("c->z B20 first", z_B20_first(v, 7) == c_B20_first(v, 7));
        ABI_CASE("c->z B20 odd", z_B20_odd(3, v, 7) == c_B20_odd(3, v, 7));
        ABI_CASE("c->z B20 late", z_B20_late(1, 2, 3, 4, 5, v, 7) == c_B20_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B20 ret")) {
            B20 x = z_B20_ret(40), y = c_B20_ret(40);
            abi_end("c->z B20 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4] && x.b[5] == y.b[5] && x.b[6] == y.b[6] && x.b[7] == y.b[7] && x.b[8] == y.b[8] && x.b[9] == y.b[9] && x.b[10] == y.b[10] && x.b[11] == y.b[11] && x.b[12] == y.b[12] && x.b[13] == y.b[13] && x.b[14] == y.b[14] && x.b[15] == y.b[15] && x.b[16] == y.b[16] && x.b[17] == y.b[17] && x.b[18] == y.b[18] && x.b[19] == y.b[19]);
        }
    }
    {
        B24 v = {{3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49}};
        ABI_CASE("c->z B24 first", z_B24_first(v, 7) == c_B24_first(v, 7));
        ABI_CASE("c->z B24 odd", z_B24_odd(3, v, 7) == c_B24_odd(3, v, 7));
        ABI_CASE("c->z B24 late", z_B24_late(1, 2, 3, 4, 5, v, 7) == c_B24_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B24 ret")) {
            B24 x = z_B24_ret(40), y = c_B24_ret(40);
            abi_end("c->z B24 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4] && x.b[5] == y.b[5] && x.b[6] == y.b[6] && x.b[7] == y.b[7] && x.b[8] == y.b[8] && x.b[9] == y.b[9] && x.b[10] == y.b[10] && x.b[11] == y.b[11] && x.b[12] == y.b[12] && x.b[13] == y.b[13] && x.b[14] == y.b[14] && x.b[15] == y.b[15] && x.b[16] == y.b[16] && x.b[17] == y.b[17] && x.b[18] == y.b[18] && x.b[19] == y.b[19] && x.b[20] == y.b[20] && x.b[21] == y.b[21] && x.b[22] == y.b[22] && x.b[23] == y.b[23]);
        }
    }
    {
        B28 v = {{3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57}};
        ABI_CASE("c->z B28 first", z_B28_first(v, 7) == c_B28_first(v, 7));
        ABI_CASE("c->z B28 odd", z_B28_odd(3, v, 7) == c_B28_odd(3, v, 7));
        ABI_CASE("c->z B28 late", z_B28_late(1, 2, 3, 4, 5, v, 7) == c_B28_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B28 ret")) {
            B28 x = z_B28_ret(40), y = c_B28_ret(40);
            abi_end("c->z B28 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4] && x.b[5] == y.b[5] && x.b[6] == y.b[6] && x.b[7] == y.b[7] && x.b[8] == y.b[8] && x.b[9] == y.b[9] && x.b[10] == y.b[10] && x.b[11] == y.b[11] && x.b[12] == y.b[12] && x.b[13] == y.b[13] && x.b[14] == y.b[14] && x.b[15] == y.b[15] && x.b[16] == y.b[16] && x.b[17] == y.b[17] && x.b[18] == y.b[18] && x.b[19] == y.b[19] && x.b[20] == y.b[20] && x.b[21] == y.b[21] && x.b[22] == y.b[22] && x.b[23] == y.b[23] && x.b[24] == y.b[24] && x.b[25] == y.b[25] && x.b[26] == y.b[26] && x.b[27] == y.b[27]);
        }
    }
    {
        B32 v = {{3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65}};
        ABI_CASE("c->z B32 first", z_B32_first(v, 7) == c_B32_first(v, 7));
        ABI_CASE("c->z B32 odd", z_B32_odd(3, v, 7) == c_B32_odd(3, v, 7));
        ABI_CASE("c->z B32 late", z_B32_late(1, 2, 3, 4, 5, v, 7) == c_B32_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z B32 ret")) {
            B32 x = z_B32_ret(40), y = c_B32_ret(40);
            abi_end("c->z B32 ret", x.b[0] == y.b[0] && x.b[1] == y.b[1] && x.b[2] == y.b[2] && x.b[3] == y.b[3] && x.b[4] == y.b[4] && x.b[5] == y.b[5] && x.b[6] == y.b[6] && x.b[7] == y.b[7] && x.b[8] == y.b[8] && x.b[9] == y.b[9] && x.b[10] == y.b[10] && x.b[11] == y.b[11] && x.b[12] == y.b[12] && x.b[13] == y.b[13] && x.b[14] == y.b[14] && x.b[15] == y.b[15] && x.b[16] == y.b[16] && x.b[17] == y.b[17] && x.b[18] == y.b[18] && x.b[19] == y.b[19] && x.b[20] == y.b[20] && x.b[21] == y.b[21] && x.b[22] == y.b[22] && x.b[23] == y.b[23] && x.b[24] == y.b[24] && x.b[25] == y.b[25] && x.b[26] == y.b[26] && x.b[27] == y.b[27] && x.b[28] == y.b[28] && x.b[29] == y.b[29] && x.b[30] == y.b[30] && x.b[31] == y.b[31]);
        }
    }
    {
        A8 v = {0x1122334455667788ull};
        ABI_CASE("c->z A8 first", z_A8_first(v, 7) == c_A8_first(v, 7));
        ABI_CASE("c->z A8 odd", z_A8_odd(3, v, 7) == c_A8_odd(3, v, 7));
        ABI_CASE("c->z A8 late", z_A8_late(1, 2, 3, 4, 5, v, 7) == c_A8_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z A8 ret")) {
            A8 x = z_A8_ret(40), y = c_A8_ret(40);
            abi_end("c->z A8 ret", x.a == y.a);
        }
    }
    {
        A16 v = {0x1122334455667788ull, 9};
        ABI_CASE("c->z A16 first", z_A16_first(v, 7) == c_A16_first(v, 7));
        ABI_CASE("c->z A16 odd", z_A16_odd(3, v, 7) == c_A16_odd(3, v, 7));
        ABI_CASE("c->z A16 late", z_A16_late(1, 2, 3, 4, 5, v, 7) == c_A16_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z A16 ret")) {
            A16 x = z_A16_ret(40), y = c_A16_ret(40);
            abi_end("c->z A16 ret", x.a == y.a && x.b == y.b);
        }
    }
    {
        A16b v = {9, 0x1122334455667788ull};
        ABI_CASE("c->z A16b first", z_A16b_first(v, 7) == c_A16b_first(v, 7));
        ABI_CASE("c->z A16b odd", z_A16b_odd(3, v, 7) == c_A16b_odd(3, v, 7));
        ABI_CASE("c->z A16b late", z_A16b_late(1, 2, 3, 4, 5, v, 7) == c_A16b_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z A16b ret")) {
            A16b x = z_A16b_ret(40), y = c_A16b_ret(40);
            abi_end("c->z A16b ret", x.a == y.a && x.b == y.b);
        }
    }
    {
        M8 v = {7, 0x01020304u};
        ABI_CASE("c->z M8 first", z_M8_first(v, 7) == c_M8_first(v, 7));
        ABI_CASE("c->z M8 odd", z_M8_odd(3, v, 7) == c_M8_odd(3, v, 7));
        ABI_CASE("c->z M8 late", z_M8_late(1, 2, 3, 4, 5, v, 7) == c_M8_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z M8 ret")) {
            M8 x = z_M8_ret(40), y = c_M8_ret(40);
            abi_end("c->z M8 ret", x.a == y.a && x.b == y.b);
        }
    }
    {
        M12 v = {7, 700, 0x01020304u};
        ABI_CASE("c->z M12 first", z_M12_first(v, 7) == c_M12_first(v, 7));
        ABI_CASE("c->z M12 odd", z_M12_odd(3, v, 7) == c_M12_odd(3, v, 7));
        ABI_CASE("c->z M12 late", z_M12_late(1, 2, 3, 4, 5, v, 7) == c_M12_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z M12 ret")) {
            M12 x = z_M12_ret(40), y = c_M12_ret(40);
            abi_end("c->z M12 ret", x.a == y.a && x.b == y.b && x.c == y.c);
        }
    }
    {
        F4 v = {1.5f};
        ABI_CASE("c->z F4 first", z_F4_first(v, 7) == c_F4_first(v, 7));
        ABI_CASE("c->z F4 odd", z_F4_odd(3, v, 7) == c_F4_odd(3, v, 7));
        ABI_CASE("c->z F4 late", z_F4_late(1, 2, 3, 4, 5, v, 7) == c_F4_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z F4 ret")) {
            F4 x = z_F4_ret(40), y = c_F4_ret(40);
            abi_end("c->z F4 ret", x.a == y.a);
        }
    }
    {
        F8 v = {1.5f, 2.5f};
        ABI_CASE("c->z F8 first", z_F8_first(v, 7) == c_F8_first(v, 7));
        ABI_CASE("c->z F8 odd", z_F8_odd(3, v, 7) == c_F8_odd(3, v, 7));
        ABI_CASE("c->z F8 late", z_F8_late(1, 2, 3, 4, 5, v, 7) == c_F8_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z F8 ret")) {
            F8 x = z_F8_ret(40), y = c_F8_ret(40);
            abi_end("c->z F8 ret", x.a == y.a && x.b == y.b);
        }
    }
    {
        F12 v = {1.5f, 2.5f, 3.5f};
        ABI_CASE("c->z F12 first", z_F12_first(v, 7) == c_F12_first(v, 7));
        ABI_CASE("c->z F12 odd", z_F12_odd(3, v, 7) == c_F12_odd(3, v, 7));
        ABI_CASE("c->z F12 late", z_F12_late(1, 2, 3, 4, 5, v, 7) == c_F12_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z F12 ret")) {
            F12 x = z_F12_ret(40), y = c_F12_ret(40);
            abi_end("c->z F12 ret", x.a == y.a && x.b == y.b && x.c == y.c);
        }
    }
    {
        D8 v = {1.5};
        ABI_CASE("c->z D8 first", z_D8_first(v, 7) == c_D8_first(v, 7));
        ABI_CASE("c->z D8 odd", z_D8_odd(3, v, 7) == c_D8_odd(3, v, 7));
        ABI_CASE("c->z D8 late", z_D8_late(1, 2, 3, 4, 5, v, 7) == c_D8_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z D8 ret")) {
            D8 x = z_D8_ret(40), y = c_D8_ret(40);
            abi_end("c->z D8 ret", x.a == y.a);
        }
    }
    {
        D16 v = {1.5, 2.5};
        ABI_CASE("c->z D16 first", z_D16_first(v, 7) == c_D16_first(v, 7));
        ABI_CASE("c->z D16 odd", z_D16_odd(3, v, 7) == c_D16_odd(3, v, 7));
        ABI_CASE("c->z D16 late", z_D16_late(1, 2, 3, 4, 5, v, 7) == c_D16_late(1, 2, 3, 4, 5, v, 7));
        if (abi_begin("c->z D16 ret")) {
            D16 x = z_D16_ret(40), y = c_D16_ret(40);
            abi_end("c->z D16 ret", x.a == y.a && x.b == y.b);
        }
    }
}
