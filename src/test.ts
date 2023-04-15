import { assertEquals } from "https://deno.land/std@0.183.0/testing/asserts.ts";
import { WyrandContext, makeSecrets, wyhash, wyhash64 } from "./wyhash.ts";
import { asUI64N } from "./utils.ts";
import { wyrand } from "./mod.ts";

/*
// official test vectors
wyhash("",0)=409638ee2bde459
wyhash("a",1)=a8412d091b5fe0a9
wyhash("abc",2)=32dd92e4b2915153
wyhash("message digest",3)=8619124089a3a16b
wyhash("abcdefghijklmnopqrstuvwxyz",4)=7a43afb61d7f5f40
wyhash("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",5)=ff42329b90e50d58
wyhash("12345678901234567890123456789012345678901234567890123456789012345678901234567890",6)=c39cab13b115aad3
*/

Deno.test("asUI64N", () => {
  assertEquals(asUI64N(0n), 0n);
  assertEquals(asUI64N(1n), 1n);
  assertEquals(asUI64N(0xffffffffffffffffn), 0xffffffffffffffffn);
  assertEquals(asUI64N(0x10000000000000000n), 0n);
  assertEquals(asUI64N(0x10000000000000001n), 1n);

  assertEquals(asUI64N(-0n), 0n);
  assertEquals(asUI64N(-1n), 0xffffffffffffffffn);
  assertEquals(asUI64N(-2n), 0xfffffffffffffffen);
  assertEquals(asUI64N(-0x10000000000000000n), 0n);
  assertEquals(asUI64N(-0x10000000000000001n), 0xffffffffffffffffn);
});

Deno.test("wyhash: test vectors (official)", () => {
  assertEquals(wyhash("", 0n), 0x409638ee2bde459n);
  assertEquals(wyhash("a", 1n), 0xa8412d091b5fe0a9n);
  assertEquals(wyhash("abc", 2n), 0x32dd92e4b2915153n);
  assertEquals(wyhash("message digest", 3n), 0x8619124089a3a16bn);
  assertEquals(wyhash("abcdefghijklmnopqrstuvwxyz", 4n), 0x7a43afb61d7f5f40n);
  assertEquals(
    wyhash(
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",
      5n
    ),
    0xff42329b90e50d58n
  );
  assertEquals(
    wyhash(
      "12345678901234567890123456789012345678901234567890123456789012345678901234567890",
      6n
    ),
    0xc39cab13b115aad3n
  );
});

//

Deno.test("makeSecrets: test vectors", () => {
  assertEquals(makeSecrets(0x0000000000000000n), [
    0x95d49a959ca5a395n,
    0xb4a9716ac94da695n,
    0x5635cc6355956559n,
    0xe1e18e3a9c591da9n,
  ]);
  assertEquals(makeSecrets(0x0000000000000001n), [
    0x8b66d82b5ccaac2bn,
    0xf08d3cc98ecae895n,
    0x72b4c64e6a1dcc27n,
    0x1ee1c995c9c9d187n,
  ]);
  assertEquals(makeSecrets(0xffffffffffffffffn), [
    0xe11765e13cd166a9n,
    0xaaa68b72a9b26c4bn,
    0x1db89ce16ae12e17n,
    0x4d713a5a93696ca9n,
  ]);
});

Deno.test("wyhash: test vectors", () => {
  const SECRETS1 = makeSecrets(1n);

  assertEquals(wyhash("", 0x0000000000000000n), 0x0409638ee2bde459n);
  assertEquals(wyhash("", 0x0000000000000001n), 0xb8dc5edd260f4037n);
  assertEquals(wyhash("", 0xffffffffffffffffn), 0x20ac8b93d401d5e6n);
  assertEquals(wyhash("", 0x0000000000000000n, SECRETS1), 0x262738ec8f5e1bc5n);
  assertEquals(wyhash("", 0x0000000000000001n, SECRETS1), 0x5a12e3372c736819n);
  assertEquals(wyhash("", 0xffffffffffffffffn, SECRETS1), 0x485fef6b12a5aa2fn);

  const STR =
    "1234567890123456789012345678901234567890123456789012345678901234567890";
  assertEquals(wyhash(STR, 0x0000000000000000n), 0x4bbd596236ff8ca9n);
  assertEquals(wyhash(STR, 0x0000000000000001n), 0x9ad4ac5eff92811fn);
  assertEquals(wyhash(STR, 0xffffffffffffffffn), 0xf8249050310ed52bn);
  assertEquals(wyhash(STR, 0x0000000000000000n, SECRETS1), 0x0795b941f9a7e815n);
  assertEquals(wyhash(STR, 0x0000000000000001n, SECRETS1), 0x1a251911facbbab9n);
  assertEquals(wyhash(STR, 0xffffffffffffffffn, SECRETS1), 0x4d6d59bc5a900d04n);
});

Deno.test("wyhash64: test vectors", () => {
  assertEquals(
    wyhash64(0x0000000000000000n, 0x0000000000000000n),
    0x60c06e5aa6716029n
  );
  assertEquals(
    wyhash64(0x0000000000000000n, 0x0000000000000001n),
    0xc2599afc0f1dd055n
  );
  assertEquals(
    wyhash64(0x0000000000000000n, 0xffffffffffffffffn),
    0xe81b3280aef2086fn
  );
  assertEquals(
    wyhash64(0x0000000000000001n, 0x0000000000000000n),
    0x9f7a814c50e09de8n
  );
  assertEquals(
    wyhash64(0x0000000000000001n, 0x0000000000000001n),
    0x477f7eb2d675732fn
  );
  assertEquals(
    wyhash64(0x0000000000000001n, 0xffffffffffffffffn),
    0x1eed1ea6243dfdc3n
  );
  assertEquals(
    wyhash64(0xffffffffffffffffn, 0x0000000000000000n),
    0x09bca9acaee9fe85n
  );
  assertEquals(
    wyhash64(0xffffffffffffffffn, 0x0000000000000001n),
    0x0bcb7c8491607e45n
  );
  assertEquals(
    wyhash64(0xffffffffffffffffn, 0xffffffffffffffffn),
    0x8de38748e71c42a8n
  );
});

Deno.test("wyrand: test vectors", () => {
  const TEST_VECTORS = [
    [
      0x0000000000000000n,
      [
        0x111cb3a78f59a58en,
        0xceabd938ff4e856dn,
        0x61fb51318f47d2a4n,
        0x78bd03c491909760n,
        0x7c003d7fb14820den,
        0x8769964729356b1fn,
        0xe214284dc87f9829n,
        0x29a283ebb1b295a2n,
        0xf4e11accbc44be57n,
        0x9a108fea1a03ac0an,
        0x18d48308dd273c7en,
        0xce6616261de32d8en,
        0xdfc7e18b21bdf63an,
        0xde0d48d5d9c81ec5n,
        0x39a8a6eadeeefa1an,
        0xf119a8000e655799n,
        0x03e6c47651fff168n,
        0xa9a9ab7c75f0061an,
        0x7554a31b163e155cn,
        0x07ef1186d8a02e26n,
        0x8bf3faf313ba4308n,
        0x078317ebfaacc42fn,
        0xf6df686a8871e035n,
        0xf2d71c1084701fe1n,
        0x0cd72f694d86810dn,
        0xd52e9c8ffe3c55acn,
        0xdb0940be97da657an,
        0xcd5ae2f075f83aacn,
        0x748fcb383b095a12n,
        0x4726bce2ffaa41d6n,
        0xb7cc5c73bda4cad3n,
        0x944ddae819e8eb43n,
      ],
      0x0ec3ac8f17ac85e0n,
    ],
    [
      0x0000000000000001n,
      [
        0xcdef1695e1f8ed2cn,
        0x61d6d24b1c9aad40n,
        0x8cf880c22eebfadfn,
        0x05b3a992fedc4f8an,
        0x01942e5b0cb4ae64n,
        0xe2657474f69972c4n,
        0xc113c21e69d3a061n,
        0x08bd7e3916067d59n,
        0x76bc337c0614bbd6n,
        0x3b11c45afab794c1n,
        0x37d189387c9b2509n,
        0xe967d097be970444n,
        0x8cde5d094d310b88n,
        0x3b0c32e67e54263fn,
        0x1caa559abe7ac372n,
        0xd61addd2eed10c40n,
        0x5320dce0f01f0998n,
        0xceaacacdda9c6ed0n,
        0xac57854b76e22d67n,
        0x1aec38b6386c166cn,
        0xbd49c255ffb8ed0en,
        0xa48389341b002cf4n,
        0xd5d23fba2bddb89dn,
        0xd3d61fcf24a3f658n,
        0xb712dabab168521bn,
        0x7428053d9d887e07n,
        0xfa36160ef76e0a45n,
        0xee5ff3dfd6ac53c6n,
        0x7c9b42c40f1fb4e0n,
        0xe029de105ffea9ebn,
        0x9cceb9431c30f29bn,
        0x794f2718f674b01en,
      ],
      0x0ec3ac8f17ac85e1n,
    ],
    [
      0xffffffffffffffffn,
      [
        0xba1dc814e82d5d44n,
        0x57accfe85fe29d15n,
        0x3afa6e616fb3aa6fn,
        0x6cfb4186089762e0n,
        0xd90193b110f43807n,
        0x246ab81789414074n,
        0x83150dfd28eb70d3n,
        0x643f71b82189b83dn,
        0x6be28ce3dcb059ban,
        0x79125abbbbefc772n,
        0xfdd79d5f3db31754n,
        0xc0d2539db47aa6c6n,
        0x3acb64dd814a0fc0n,
        0x750b8605397c7682n,
        0xc6afb33a7f05113fn,
        0x5f17c873c94b4745n,
        0xbaea5ba4b16be9c2n,
        0x00a805af14641e62n,
        0x5a5041ebb749feb7n,
        0x353ce98bf6b7651en,
        0x24f12b81f0765bd2n,
        0xe280a5d95a58fb67n,
        0x93d8a11968a40bcfn,
        0x7a4e110b960744fdn,
        0xadd06e9badcab8c7n,
        0xb62f1a5e5ee02cd4n,
        0xb80bbd6e3807bdb1n,
        0x9480281772fcc884n,
        0x998f116adb44b3ebn,
        0x2a2311b31e4679bfn,
        0x4acdf2a2dd08a209n,
        0x8e17300d4ac21ba3n,
      ],
      0x0ec3ac8f17ac85dfn,
    ],
  ] as const;

  for (const [initialSeed, rands, finalSeed] of TEST_VECTORS) {
    let seed: bigint = initialSeed;
    const ctx: WyrandContext = { seed };
    let value = 0n;
    for (const rand of rands) {
      [value, seed] = wyrand(seed);
      const value2 = wyrand(ctx);
      assertEquals(value, rand);
      assertEquals(value2, value);
      assertEquals(ctx.seed, seed);
    }
    assertEquals(seed, finalSeed);
    assertEquals(ctx.seed, seed);
  }
});
