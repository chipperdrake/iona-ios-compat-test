# Run 12 final linker-map object inventory — 2026-10-19

Source: `iona-iphone-link-probe` artifact 12220078780, workflow run 39322315765. ZIP `iona-link.map` parsed directly, using only Apple's `# Object files:` section, not symbol names or archive membership.

**118 listed entries**: 74 `libengine_runtime.a`, 12 `libggml-cpu.a`, 7 `libggml-base.a`, 5 `libyaml_vendor.a`, 2 `libggml.a`, 1 `libggml-blas.a`, 1 `libcjson_vendor.a`, and 16 non-archive entries (including linker-synthesized/system entries).

Key included objects: `snac_decoder_runtime.cpp.o`, `cJSON.c.o`, all five libyaml objects, GGML CPU/BLAS/base objects. **No Maya1-named object** and **no SentencePiece archive object** appear in this minimal probe's object-file list. No protobuf-named object appears. This corrects any earlier inference that the linker map proves Maya1's generation implementation was included. Its presence in a built archive or in symbol text is not equivalent to its inclusion in the executable.

**Scope limitation:** The minimal test only calls `audiocpp_abi_version` and `audiocpp_build_version`. It is not a representative synthesis call graph and cannot exclude SentencePiece or other dependencies from a fully exercised app. A real synthesis API linkage test and model/voice rights audit are still required before commercial clearance. Do not download weights or test protected voices until rights confirmed.
