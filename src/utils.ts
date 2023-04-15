export function asUI64N(value: bigint): bigint {
  return BigInt.asUintN(64, value);
}
