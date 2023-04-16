@ECHO OFF

cd "%~dp0"

..\wasi-sdk\bin\clang.exe --target=wasm32-wasi --sysroot ../wasi-sdk/share/wasi-sysroot -nostartfiles -Oz -flto -Wall -Wextra -Wl,--no-entry -Wl,--strip-all -Wl,--lto-O3 -Wl,--export=__data_end -Wl,--export=__heap_base -z stack-size=256 -o wyhash.wasm wyhash.c
..\wabt\bin\wasm2wat.exe wyhash.wasm -o wyhash.wat
deno run --allow-read=wyhash.wasm --allow-write=wasmData.ts dump.ts
