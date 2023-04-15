import { asUI64N } from "./utils.ts";
import { WYHASH_WASM_DATA } from "./wasmData.ts";

// Constants

export const WYHASH_DEFAULT_SECRETS = [
  0xa0761d6478bd642fn,
  0xe7037ed1a0b428dbn,
  0x8ebc6af09c88c6e3n,
  0x589965cc75374cc3n,
] as const;

// Utils

function writeSecrets(
  view: DataView,
  secrets: readonly [bigint, bigint, bigint, bigint]
): DataView {
  view.setBigUint64(0, secrets[0], true);
  view.setBigUint64(8, secrets[1], true);
  view.setBigUint64(16, secrets[2], true);
  view.setBigUint64(24, secrets[3], true);
  return view;
}

function readSecrets(view: DataView): [bigint, bigint, bigint, bigint] {
  return [
    view.getBigUint64(0, true),
    view.getBigUint64(8, true),
    view.getBigUint64(16, true),
    view.getBigUint64(24, true),
  ];
}

// WASM Setup

interface WyhashWASMExports extends WebAssembly.Exports {
  readonly __data_end: WebAssembly.Global;
  readonly __heap_base: WebAssembly.Global;
  readonly memory: WebAssembly.Memory;
  readonly make_secret: (seed: bigint, ptrSecrets: number) => void;
  readonly wy2gau: (r: bigint) => number;
  readonly wy2u01: (r: bigint) => number;
  readonly wy2u0k: (r: bigint, k: bigint) => bigint;
  readonly wyhash: (
    ptrKey: number,
    len: number,
    seed: bigint,
    ptrSecrets: number
  ) => bigint;
  readonly wyhash64: (a: bigint, b: bigint) => bigint;
  readonly wyrand: (ptrSeed: number) => bigint;
}

const wasmModule = new WebAssembly.Module(WYHASH_WASM_DATA);
const wasmInstance = new WebAssembly.Instance(wasmModule);
const wasmExports = wasmInstance.exports as WyhashWASMExports;
const wasmBuffer = wasmExports.memory.buffer;
const wasmBufferUI8 = new Uint8Array(wasmBuffer);

const HEAP_BASE = wasmExports.__heap_base.value as number;
let heapOffset = HEAP_BASE;
const allocate = (size: number): DataView => {
  const view = new DataView(wasmBuffer, heapOffset, size);
  heapOffset += size;
  return view;
};
const MEM_SECRETS_DEFAULT = allocate(0x20);
const MEM_SECRETS_MAKE = allocate(0x20);
const MEM_SECRETS_REF = allocate(0x20);
const MEM_SEED = allocate(0x08);
const MEM_KEY = new Uint8Array(wasmBuffer, heapOffset);

writeSecrets(MEM_SECRETS_DEFAULT, WYHASH_DEFAULT_SECRETS);

// Memory clear functions

function clearMemory(view: DataView): void {
  wasmBufferUI8.fill(0, view.byteOffset, view.byteOffset + view.byteLength);
}

function withClearMemory<T>(view: DataView, value: T): T {
  clearMemory(view);
  return value;
}

// Exports

export const MAX_KEY_SIZE = MEM_KEY.byteLength;

export interface WyrandContext {
  seed: bigint;
}

export function wyrand(seed: bigint): [value: bigint, nextSeed: bigint];
export function wyrand(context: WyrandContext): bigint;
export function wyrand(
  arg: bigint | WyrandContext
): [value: bigint, nextSeed: bigint] | bigint {
  if (typeof arg === "bigint") {
    MEM_SEED.setBigUint64(0, arg, true);
    return withClearMemory(MEM_SEED, [
      asUI64N(wasmExports.wyrand(MEM_SEED.byteOffset)),
      MEM_SEED.getBigUint64(0, true),
    ]);
  } else {
    MEM_SEED.setBigUint64(0, arg.seed, true);
    const value = asUI64N(wasmExports.wyrand(MEM_SEED.byteOffset));
    arg.seed = MEM_SEED.getBigUint64(0, true);
    clearMemory(MEM_SEED);
    return value;
  }
}

export function wyhash64(a: bigint, b: bigint): bigint {
  return asUI64N(wasmExports.wyhash64(a, b));
}

export function wy2gau(r: bigint): number {
  return wasmExports.wy2gau(r);
}

export function wy2u01(r: bigint): number {
  return wasmExports.wy2u01(r);
}

export function wy2u0k(r: bigint, k: bigint): bigint;
export function wy2u0k(r: bigint, k: number): number;
export function wy2u0k(r: bigint, k: bigint | number): bigint | number {
  return typeof k === "bigint"
    ? wasmExports.wy2u0k(r, k)
    : Number(wasmExports.wy2u0k(r, BigInt(k)));
}

export function makeSecrets(seed: bigint): [bigint, bigint, bigint, bigint] {
  wasmExports.make_secret(seed, MEM_SECRETS_MAKE.byteOffset);
  return withClearMemory(MEM_SECRETS_MAKE, readSecrets(MEM_SECRETS_MAKE));
}

export function wyhash(
  key: string | Uint8Array,
  seed: bigint,
  secrets?: readonly [bigint, bigint, bigint, bigint]
) {
  if (typeof key === "string") {
    key = new TextEncoder().encode(key);
  }
  if (key.byteLength > MAX_KEY_SIZE) {
    throw new Error("Key is too long.");
  }
  MEM_KEY.set(key);
  const value = asUI64N(
    wasmExports.wyhash(
      MEM_KEY.byteOffset,
      key.byteLength,
      seed,
      secrets
        ? writeSecrets(MEM_SECRETS_REF, secrets).byteOffset
        : MEM_SECRETS_DEFAULT.byteOffset
    )
  );
  if (secrets) {
    clearMemory(MEM_SECRETS_REF);
  }
  MEM_KEY.fill(0, 0, key.byteLength);
  return value;
}
