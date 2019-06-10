cc_binary(
    name = "helloworld",
    srcs = ["hello-world.cc"],
    copts = [
        "-isystem",
        "external/emscripten_toolchain/system/include/libcxx",
        "-isystem",
        "external/emscripten_toolchain/system/include/libc",
    ],
)
