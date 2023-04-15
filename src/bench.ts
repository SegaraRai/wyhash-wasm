import { makeSecrets, wyhash } from "./wyhash.ts";

const SECRETS = makeSecrets(123n);

Deno.bench("wyhash", () => {
  wyhash("Hello, world!", 0n);
});

Deno.bench("wyhash w/ seed", () => {
  wyhash("Hello, world!", 256n);
});

Deno.bench("wyhash w/ custom secrets", () => {
  wyhash("Hello, world!", 256n, SECRETS);
});
