# Iona Maya1 — static archive reachability checkpoint

Artifact: successful iPhone ARM64 run `39313556482`, artifact `12215833862`; pinned audio.cpp source `4faef969850e2dd485e717fe2159875b91cfa3dc`.

## Direct inspection
- The archive contains 8 static libraries; 9 license files and ggml AUTHORS are already verified.
- `libengine_runtime.a` contains `snac_decoder_runtime.cpp.o`, but also `nemo_nano_codec_runtime.cpp.o`, `fsq_audio_codec_runtime.cpp.o`, `fish_dac_codec_runtime.cpp.o`, `mimi_codec_runtime.cpp.o`, `moss_audio_tokenizer_codec_runtime.cpp.o`, and `redae_codec_runtime.cpp.o`.
- `libsentencepiece.a` contains `sentencepiece.pb.cc.o` and `sentencepiece_model.pb.cc.o`.
- These findings establish **archive membership only**. They do not prove that unrelated codec objects or embedded SentencePiece dependencies will be linked into the final application.
- The artifact contains no installable app, so no final application link map is available. **Final redistribution reachability remains unverified.**

## Required next gate
Generate a minimal iOS application link using only the intended Maya1/SNAC entry points and produce a linker map (`-Wl,-map,<output-path>` using Apple ld). Audit included object members, system frameworks, and embedded third-party notices against that map. Do not treat the presence of public headers or unused archive members as shipped code. Keep model weights out until their commercial/redistribution and speaker-rights checks pass.

No change to Everett, no paid dependency, no model download. Commercial release **PENDING**.

## Run #6 evidence verification (2026-10-19)
- Workflow run `39317186825`: completed SUCCESS, all steps green.
- Downloaded linkage evidence artifact `12218132012` and inspected its ZIP directly.
- Contains exactly **8 nonempty `.members.txt`** and **8 nonempty `.symbols.txt`** reports, one per static library (`libengine_runtime`, `libggml`, `libggml-base`, `libggml-cpu`, `libggml-blas`, `libsentencepiece`, `libcjson_vendor`, `libyaml_vendor`), plus `archives.txt` and `README.txt`.
- The previous glob-related missing-report problem is **resolved**. Reports contain actual symbols, including ggml, cJSON, libyaml and SentencePiece.
- **Limit:** Archive members and exported symbols do not prove which objects a final executable links. The final app linker-map gate is still OPEN; do not claim full dependency exclusion or commercial release clearance.
