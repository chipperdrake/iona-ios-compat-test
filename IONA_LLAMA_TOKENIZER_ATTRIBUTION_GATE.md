# Iona llama tokenizer attribution gate — 2026-10-19

Pinned audio.cpp revision: `4faef969850e2dd485e717fe2159875b91cfa3dc`.

## Verified
- `external/llama_tokenizer/bpe-core.cpp` and `.h` exist in pinned audio.cpp; `src/framework/tokenizers/llama_bpe.cpp` includes `bpe-core.h`.
- Source comparison with `ggml-org/llama.cpp` `src/llama-vocab.cpp` found distinctive shared identifiers: `llama_priority_queue`, `llm_bigram_bpe`, `llm_symbol`. This supports a derived relationship, but **does not establish an exact upstream commit or exhaustive origin**.
- Pinned audio.cpp root LICENSE is Apache-2.0, copyright 2026 ShugoAI LLC. No `external/llama_tokenizer/LICENSE` was found.
- Current `ggml-org/llama.cpp` root LICENSE is MIT: `Copyright (c) 2023-2026 The ggml authors`; license requires copyright and permission notice with copies/substantial portions.
- The existing nine-license redistribution bundle does not separately identify the vendored llama tokenizer's MIT provenance.

## Open gate
1. Identify source revision / original copyright provenance of vendored tokenizer (including unicode.cpp and unicode-data.cpp).
2. Determine the applicable historical MIT notice and include it verbatim in redistributed license bundle, preserving all applicable upstream notices.
3. Rerun package, verify manifest hashes, and inspect artifact.

Do not claim this component or Maya1 weights/speaker rights commercially cleared yet. Everett protected and untouched.
