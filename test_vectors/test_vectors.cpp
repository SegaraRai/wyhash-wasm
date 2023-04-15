#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <initializer_list>
#include <regex>
#include <string>

#include "../wyhash/wyhash.h"

#if defined(_MSC_VER)
#  define HEX64 "0x%016I64x"
#else
#  define HEX64 "0x%016lx"
#endif

#define SECRET_SPEC HEX64 ", " HEX64 ", " HEX64 ", " HEX64

using namespace std::literals;

void dump_tv_make_secret() {
  for (const std::uint64_t seed : {
         0x0ull,
         0x1ull,
         0xffffffffffffffffull,
       }) {
    std::uint64_t secret[4] = {};
    make_secret(seed, secret);
    printf(
      "[make_secret] " HEX64 " => " SECRET_SPEC "\n",
      seed,
      secret[0],
      secret[1],
      secret[2],
      secret[3]
    );
  }
}

void dump_tv_wyhash64() {
  for (const std::uint64_t a : {
         0x0ull,
         0x1ull,
         0xffffffffffffffffull,
       }) {
    for (const std::uint64_t b : {
           0x0ull,
           0x1ull,
           0xffffffffffffffffull,
         }) {
      printf(
        "[wyhash64] " HEX64 " x " HEX64 " = " HEX64 "\n", a, b, wyhash64(a, b)
      );
    }
  }
}

void dump_tv_wyrand() {
  for (const std::uint64_t initialSeed : {
         0x0ull,
         0x1ull,
         0xffffffffffffffffull,
       }) {
    std::uint64_t seed = initialSeed;
    printf("[wyrand] " HEX64 " : ", seed);
    for (std::size_t i = 0; i < 32; i++) {
      printf(i == 0 ? HEX64 : ", " HEX64, wyrand(&seed));
    }
    printf(" => " HEX64 "\n", seed);
  }
}

void dump_tv_wyhash() {
  for (const auto secretSeed : {
         0ull,
         1ull,
       }) {
    uint64_t secret[4] = {};
    if (secretSeed) {
      make_secret(secretSeed, secret);
    } else {
      memcpy(secret, _wyp, sizeof(secret));
    }

    for (const std::uint64_t seed : {
           0x0ull,
           0x1ull,
           0xffffffffffffffffull,
         }) {
      for (const std::string& key : {
             ""s,
             "\0"s,
             "\xff"s,
             "\0\0\0\0\0\0\0"s,
             "\0\0\0\0\0\0\0\0"s,
             "\0\0\0\0\0\0\0\0\0"s,
             "\xff\xff\xff\xff\xff\xff\xff\xff\xff"s,
             "abc"s,
             "1234567890123456789012345678901234567890123456789012345678901234567890"s,
           }) {
        std::string literal = std::regex_replace(
          std::regex_replace(key, std::regex("\\0"), "\\0"),
          std::regex("\\xff"),
          "\\xff"
        );
        printf(
          "[wyhash] <" SECRET_SPEC "> " HEX64 " \"%s\" => " HEX64 "\n",
          secret[0],
          secret[1],
          secret[2],
          secret[3],
          seed,
          literal.c_str(),
          wyhash(key.c_str(), key.size(), seed, secret)
        );
      }
    }
  }
}

int main() {
  dump_tv_make_secret();
  printf("\n");

  dump_tv_wyhash64();
  printf("\n");

  dump_tv_wyrand();
  printf("\n");

  dump_tv_wyhash();
  printf("\n");

  printf("Done\n");

  return 0;
}
