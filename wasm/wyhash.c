#include <stddef.h>
#include <stdint.h>

#define WYHASH_32BIT_MUM 0
#define WYHASH_CONDOM 1
#define WYHASH_LITTLE_ENDIAN 1

#include "../wyhash/wyhash.h"

__attribute__((export_name("wyhash64"))) uint64_t wasm_wyhash64(
  uint64_t a, uint64_t b
) {
  return wyhash64(a, b);
}

__attribute__((export_name("wyrand"))) uint64_t wasm_wyrand(uint64_t* seed) {
  return wyrand(seed);
}

__attribute__((export_name("wy2u01"))) double wasm_wy2u01(uint64_t r) {
  return wy2u01(r);
}

__attribute__((export_name("wy2u0k"))) uint64_t wasm_wy2u0k(
  uint64_t r, uint64_t k
) {
  return wy2u0k(r, k);
}

__attribute__((export_name("wy2gau"))) double wasm_wy2gau(uint64_t r) {
  return wy2gau(r);
}

__attribute__((export_name("make_secret"))) void wasm_make_secret(
  uint64_t seed, uint64_t secret[4]
) {
  return make_secret(seed, secret);
}

__attribute__((export_name("wyhash"))) uint64_t wasm_wyhash(
  const uint8_t* key, uint32_t len, uint64_t seed, const uint64_t secret[4]
) {
  return wyhash(key, len, seed, secret);
}
