function quote(str: string): string {
  const a = `"${str.replaceAll('"', '\\"')}"`;
  const b = `'${str.replaceAll("'", "\\'")}'`;
  return a.length <= b.length ? a : b;
}

const PREDEFINED = new Map([
  [0, "\\0"],
  [8, "\\b"],
  [9, "\\t"],
  [10, "\\n"],
  [11, "\\v"],
  [12, "\\f"],
  [13, "\\r"],
  [92, "\\x5c"],
]);

const MAP = new Map(
  new Array(256)
    .fill(0)
    .map((_, i) => [
      String.fromCharCode(i),
      PREDEFINED.get(i) ||
        (i >= 0x20 && i <= 0x7e
          ? String.fromCharCode(i)
          : `\\x${i.toString(16).padStart(2, "0")}`),
    ])
);

const toStringLiteral = (str: string): string =>
  str
    .replace(/[\s\S]/g, (c) => MAP.get(c) || c) // escape special characters
    .replace(/\\0(\d)/g, (_, d) => `\\x00${d}`) // prevent `\0` from being interpreted as octal escape
    .replace(/^[\s\S]+$/, (s) => quote(s)) // quote
    .replaceAll("\\x5c", "\\\\"); // shorten backslash escape (this must be done last)

//

const data = await Deno.readFile("wyhash.wasm");

const encoded = Array.from(data)
  .map((n) => String.fromCharCode(n))
  .join("")
  .split(/([\s\S]{64})/g)
  .filter((s) => s)
  .map((s) => `  ${toStringLiteral(s)}`)
  .join(" +\n  ");
const code = `
function decode(str: string): Uint8Array {
  const bytes = new Uint8Array(str.length);
  for (let i = 0; i < str.length; i++) {
    bytes[i] = str.charCodeAt(i);
  }
  return bytes;
}

export const WYHASH_WASM_DATA = decode(
${encoded}
);
`.trimStart();

await Deno.writeTextFile("wasmData.ts", code);
