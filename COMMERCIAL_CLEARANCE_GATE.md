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
