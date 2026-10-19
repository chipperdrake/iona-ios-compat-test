# Iona Run 12 — successful physical iPhone link probe (2026-10-19)

GitHub Actions run: https://github.com/chipperdrake/iona-ios-compat-test/actions/runs/39322315765

- Workflow: SUCCESS. Link-probe artifact: `12220078780`; downloaded and inspected ZIP.
- `link.exitcode`: **0**. `iona-link-probe`: nonempty **4,732,040-byte** iPhone arm64 executable. `iona-link.map`: nonempty **1,504,500-byte** Apple linker map. `link.stderr` contains warning(s), no fatal errors.
- Link map **explicitly includes** `libengine_runtime.a(snac_decoder_runtime.cpp.o)`, Maya1-related symbols, `libcjson_vendor.a(cJSON.c.o)`, `libyaml_vendor.a` objects, and GGML backend objects.
- This validates a weight-free **C ABI smoke executable link**, not speech synthesis, actual device execution, runtime performance, or full final production-app linkage. A link map includes code from multiple model/runtime components; commercial audit must account for every linked component and applicable license/notice obligations.
- Link map did not contain textual `sentencepiece` or `protobuf` matches in this minimal probe; this does not prove such code cannot be drawn into a later fully exercised speech-generating app. 
- NEXT: extract authoritative object-file section of map into a linked-dependency matrix against source paths/licenses; distinguish included objects from unlinked archive members. Then establish independent model-weight/voice/speaker rights before any distribution or voice test.
- Everett protected and untouched. Commercial clearance remains **PENDING**.
