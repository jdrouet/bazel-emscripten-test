#!/bin/bash

set -euo pipefail

export LLVM_ROOT='external/emscripten_clang'
export EMSCRIPTEN_NATIVE_OPTIMIZER='external/emscripten_clang/optimizer'
export BINARYEN_ROOT='external/emscripten_clang/binaryen'
export NODE_JS='/usr/bin/node'
export EMSCRIPTEN_ROOT='external/emscripten_toolchain'
export SPIDERMONKEY_ENGINE=''
export EMCC_SKIP_SANITY_CHECK=1
export EMCC_WASM_BACKEND=1
export EMCC_DEBUG=1

# Run emscripten to compile and link
python external/emscripten_toolchain/emcc.py "$@"
