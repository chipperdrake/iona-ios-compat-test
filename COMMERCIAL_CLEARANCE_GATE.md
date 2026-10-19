# Iona Maya1 — commercial release gate (2026-10-19)

**Status: PENDING — NOT CLEARED FOR COMMERCIAL RELEASE.**

## Verified build evidence
- iOS Simulator ARM64 compiled successfully (GitHub Actions run 39306873041).
- iPhone device ARM64 compiled successfully (run 39307789515).
- Unsigned static libraries packaged (run 39308689820); not a working iOS app.
- License inventory generated (run 39310625283), upstream at `4faef969850e2dd485e717fe2159875b91cfa3dc`.
- audio.cpp upstream LICENSE is Apache-2.0, copyright 2026 ShugoAI LLC, verified directly from upstream file.
- The build's source checkout was unpinned and could differ from the license inventory commit. **Do not assume identical sources.**

## Components needing file-by-file licensing verification
- audio.cpp core and model-specific Maya1 implementation, and upstream LICENSE/NOTICE obligations.
- ggml and CPU/BLAS backends.
- SentencePiece and embedded third-party code (absl, darts_clone, esaxx, protobuf-lite).
- cJSON, libyaml, utf8proc, cpp-httplib, any miniaudio and server-frontends code actually included.
- SNAC decoder source **and separately distributed SNAC weights**.
- Maya1 model weights, tokenizer, config, and any model-card usage restrictions; exact version/revision must be pinned.
- Check each dependency's actual linked/packaged inclusion; inventory is broader than actual build.
- Attribution, modification notices, license-copy requirements, patent terms, third-party media/voice-data restrictions, hosting/service terms.
- Verify that any runtime model downloads and redistributed assets are permitted for commercial deployment.

## Hard acceptance gates
1. Pin exact source and weight revisions; produce SHA256 hashes.
2. Generate complete software bill of materials of **linked and distributed** dependencies, not only files with LICENSE in name.
3. Read each applicable full license and any NOTICE/third-party attribution files; record commercial-use and redistribution conclusions with evidence.
4. Inspect model cards and weight repositories, including gated files, separate licenses, acceptable-use terms and dependencies.
5. Bundle all required attribution and notices; verify archive contains them.
6. Test real iPhone 17 Pro voice generation for latency, memory, quality, and device heat.
7. Do not label commercially cleared until all checks pass; no fees or paid-only dependencies.

## Protected project boundaries
- This repository is an isolated Iona compatibility test.
- Do not modify Everett, protected voices, or other app repositories.
- $0 expenditure rule.


## Verified weight provenance (2026-10-19)
- Original model: https://huggingface.co/maya-research/maya1 — repository metadata declares Apache-2.0; original BF16 checkpoint totals approximately 6.6 GB.
- Official audio.cpp converted package: https://huggingface.co/audio-cpp/audio.cpp-gguf/blob/main/Maya1-GGUF/README.md
- The converted package explicitly names original Maya1 revision `21c682a0afef8c13a89b2512733c8bf5f0c52eb7` and SNAC revision `d73ad176a12188fcf4f360ba3bf2c2fbbe8f58ec`.
- The GGUF package states `LICENSE-MAYA1` (Apache-2.0) and `LICENSE-SNAC` (MIT) both apply. The conversion does not remove obligations.
- Package names: `maya1-orig.gguf` (mixed BF16/FP32), `maya1-q8_0.gguf` (quantized, ~4.04 GB at published upload).
- Published package SHA256 for q8_0: `559703c4b31fa93f7092c6c8c76723b9584c1ec2644083c9ff17f8ab14d10a58`; original: `52b3d12ec44bd484cad61a3630dfd4645c70e124c7f285f714c484b1a4b7e390` (verify filenames and content before adoption).
- **Remaining:** Pin converted repository revision; inspect full license files and any additional terms, confirm dependencies and complete notices, verify downloaded GGUF hashes, test actual device memory/latency/heat. These weight files have not been downloaded into the project.

## October 19 continuation — additional documented checks
- **PASS (published provenance only):** Converted GGUF package introduction is traceable to Hugging Face commit `d63ec81f9a9ccf85d3d906df0d2a89a54c463b00`; it added `Maya1-GGUF/LICENSE-MAYA1`, `LICENSE-SNAC`, README and both LFS pointers. Source: https://huggingface.co/audio-cpp/audio.cpp-gguf/commit/d63ec81f9a9ccf85d3d906df0d2a89a54c463b00 . This is a reproducible candidate package revision, not proof that current main remains identical.
- **PASS (published package notice identification):** Maya1-GGUF README explicitly identifies Apache-2.0 for Maya1 and MIT for bundled SNAC, and requires retaining both licenses: https://huggingface.co/audio-cpp/audio.cpp-gguf/blob/main/Maya1-GGUF/README.md . Full license contents and applicable downstream notices still require review.
- **PASS (published model-card clarification):** Maya1 model card explicitly says Apache-2.0 permits commercial use subject to its terms, but rights to reference material, training data, and an individual's voice are separate: https://huggingface.co/maya-research/maya1/blame/main/README.md . This does not independently certify training-data or speaker rights.
- **PASS (published LFS pointers, not local file hashes):** At converted-package introduction commit, `maya1-orig.gguf` LFS SHA256 `52b3d12ec44bd484cad61a3630dfd4645c70e124c7f285f714c484b1a4b7e390` and size 6,682,824,288 bytes; `maya1-q8_0.gguf` LFS SHA256 `559703c4b31fa93f7092c6c8c76723b9584c1ec2644083c9ff17f8ab14d10a58` and size 4,040,216,160 bytes. Source: same conversion commit. No downloads or independent hashing performed.
- **PENDING:** Inspect full two license files at pinned package commit; independently confirm revision consistency and model card at original revision; pin audio.cpp source; determine actual static-library linked code, dependencies and NOTICE obligations; verify package and device performance. **Overall status remains NOT CLEARED.**

## October 19 — full converted GGUF license texts verified (new evidence)
- **PASS — full LICENSE-MAYA1 inspected:** At pinned converted package commit `d63ec81f9a9ccf85d3d906df0d2a89a54c463b00`, the entire 202-line `Maya1-GGUF/LICENSE-MAYA1` is the Apache License Version 2.0 (January 2004). Its section 2 permits royalty-free reproduction, derivatives and distribution; section 4 requires including a copy of the license, marking modified files, preserving applicable source notices, and including upstream NOTICE attribution if present. Section 6 does not grant trademark rights; section 3 has patent terms/termination. Evidence: https://huggingface.co/audio-cpp/audio.cpp-gguf/commit/d63ec81f9a9ccf85d3d906df0d2a89a54c463b00 (LICENSE-MAYA1 diff, lines 1–202).
- **PASS — full LICENSE-SNAC inspected:** Same pinned package commit contains the entire 22-line `Maya1-GGUF/LICENSE-SNAC`, MIT License, copyright (c) 2023 Descript and (c) 2024 Hubert Siuzdak. It permits commercial use, modification and redistribution subject to retaining its copyright and permission notice in copies/substantial portions. Evidence: same commit (LICENSE-SNAC diff, lines 1–22).
- **PASS — package-level license pairing:** The pinned README states combined GGUF includes Maya1 and SNAC, both licenses apply; no additional license text was present in the six-file introduction commit. This does NOT rule out upstream NOTICE or third-party obligations elsewhere.
- **PENDING — release gate:** Inspect original revisions for additional NOTICE, model-card restrictions, speaker/data rights; audit actual linked libraries, create a redistribution attribution bundle, independently verify GGUF contents and device performance. **Commercial release remains NOT CLEARED.**

## October 19 — direct iPhone archive inspection (verified)
- Downloaded GitHub artifact `12215197770` from successful packaging run `39308689820`; inspected its ZIP and `ar` static-library members. Archive contains exactly 8 `.a` files: `libengine_runtime.a`, `libcjson_vendor.a`, `libggml-base.a`, `libggml-blas.a`, `libggml-cpu.a`, `libggml.a`, `libsentencepiece.a`, `libyaml_vendor.a`.
- Confirmed `libengine_runtime.a` has `snac_decoder_runtime.cpp.o`, `json.cpp.o`, `yaml.cpp.o`, `hf_tokenizer_json.cpp.o`, `sentencepiece.cpp.o`; generic `session.cpp.o` and `assets.cpp.o` filenames occur multiple times, so they do not alone prove model-specific linkage.
- Only `licenses/LICENSE` was included, containing upstream audio.cpp Apache 2.0 text; no separate third-party license bundle found in archive. **NOTICE PACKAGING GATE: FAIL / remediation required before distribution.**
- Static `.a` archives contain object members that may not all be linked into the final application; this establishes packaged library contents, not final executable reachability. Need verify exact vendored licenses for ggml, SentencePiece and its incorporated subcomponents, cJSON, libyaml, and any other code identified from symbols; add required license/notice files and check final shipped bundle.
- No weights included; Maya1/SNAC weights still require separate distribution verification. Overall commercial release remains PENDING.
