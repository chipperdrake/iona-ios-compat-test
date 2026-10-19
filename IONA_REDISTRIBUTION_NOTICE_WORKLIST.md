# Iona Maya1 — redistribution notice preparation (NOT RELEASE APPROVAL)

Scope: unsigned iPhone ARM64 static-library artifact from run 39308689820. This is an inventory and packaging plan, not legal clearance.

## Libraries actually present
- libengine_runtime.a — audio.cpp runtime including Maya1/SNAC implementation
- libggml.a, libggml-base.a, libggml-cpu.a, libggml-blas.a — ggml components
- libsentencepiece.a — SentencePiece and potentially embedded third-party portions
- libcjson_vendor.a — cJSON
- libyaml_vendor.a — libyaml

## Required notice bundle: worklist
- audio.cpp: Apache-2.0 LICENSE and any applicable NOTICE/modification records. Top-level LICENSE is already present.
- ggml: preserve applicable MIT copyright and permission notice; inspect AUTHORS and embedded third-party components.
- SentencePiece: inspect full upstream LICENSE and incorporated absl, darts_clone, esaxx, protobuf-lite code and notices; do not assume all are linked.
- cJSON: verify exact license text and copyright.
- libyaml: verify exact license text and copyright.
- Maya1 GGUF model: Apache-2.0 LICENSE-MAYA1 plus applicable upstream NOTICE and changes.
- SNAC codec weights: MIT LICENSE-SNAC with copyright notices.
- Any other linked code: inspect compiled object/symbol list before inclusion or exclusion.

## Do not overstate
The source inventory also lists cpp-httplib, utf8proc, miniaudio and server-frontends. Their presence in a source checkout alone does not establish distribution or linkage. Conversely, runtime objects may embed other third-party code. Confirm before final notice manifest.

## Release gates still open
1. Pin audio.cpp source commit used for the packaged artifact (build workflow currently clones unpinned HEAD).
2. Read and reproduce exact licenses and any NOTICE/attribution from pinned sources; create actual redistribution notice files.
3. Verify final application linkage and shipped asset set.
4. Pin and hash downloaded Maya1 and SNAC GGUF contents; audit original model card/terms and voice-persona rights.
5. Validate actual iPhone 17 Pro memory, latency, heat and quality with a free viable route.

No protected Everett/Iona assets are present. Commercial clearance remains PENDING.

## Pinned upstream license text verification — October 19
Read complete files at audio.cpp commit `4faef969850e2dd485e717fe2159875b91cfa3dc`:
- **PASS ggml:** `external/ggml/LICENSE`, MIT, copyright 2023–2026 ggml authors. Preserve copyright and permission notice.
- **PASS cJSON:** `external/cJSON/LICENSE`, MIT, copyright 2009–2017 Dave Gamble and cJSON contributors. Preserve copyright and permission notice.
- **PASS libyaml:** `external/libyaml/License`, MIT, copyrights 2017–2020 Ingy döt Net and 2006–2016 Kirill Simonov. Preserve both copyright notices and permission notice.
- **PASS SentencePiece:** `external/sentencepiece/LICENSE`, Apache-2.0 with additional copyright/license notice at file end. Preserve complete file, inspect separate NOTICE and embedded third-party code obligations.
- These four license texts permit commercial redistribution subject to their terms. **This does not clear the entire application.** Exact source path evidence: `https://github.com/0xShug0/audio.cpp/tree/4faef969850e2dd485e717fe2159875b91cfa3dc`.
- **PENDING:** Read SentencePiece embedded third-party licenses, verify included code, assemble full actual notices; pin production source and weight revisions. Existing build archive remains missing these license files.

## SentencePiece embedded third-party license verification
Pinned source: `0xShug0/audio.cpp` commit `4faef969850e2dd485e717fe2159875b91cfa3dc`.
- **PASS absl:** Complete `external/sentencepiece/third_party/absl/LICENSE` reviewed: Apache-2.0, requires license copy and applicable notices/modified-file markings.
- **PASS darts_clone:** Complete `external/sentencepiece/third_party/darts_clone/LICENSE` reviewed: copyright 2008–2011 Susumu Yata; BSD-style redistribution terms require source or binary notice/disclaimer preservation.
- **PASS esaxx:** Complete `external/sentencepiece/third_party/esaxx/LICENSE` reviewed: copyright 2010 Daisuke Okanohara; MIT-style permission and notice retention.
- **PASS protobuf-lite:** Complete `external/sentencepiece/third_party/protobuf-lite/LICENSE` reviewed: copyright 2008 Google Inc.; BSD-style source/binary notice and disclaimer retention, with generated-code ownership note.
- These terms permit commercial redistribution subject to notice conditions. Their source presence is verified; exact inclusion of each embedded component in the final iPhone executable remains **PENDING**.
- Existing unsigned library artifact still lacks these license copies. No protected media, weights, or app files changed. **Commercial release remains NOT CLEARED.**

## NOTICE discovery check
At pinned audio.cpp commit `4faef969850e2dd485e717fe2159875b91cfa3dc`, direct path checks returned 404 for `NOTICE`, `external/sentencepiece/NOTICE`, and `external/sentencepiece/third_party/absl/NOTICE`. This means no files at those exact paths, **not** proof that no other notices or attribution requirements exist. `external/ggml/AUTHORS` exists (14,643 characters) and should be preserved as provenance evidence; its necessity for binary redistribution is not established by the MIT license alone. The full 9-file source-license collection is now committed as `IONA_IPHONE_THIRD_PARTY_LICENSE_TEXTS.md` (`989fbd4`). Next check: identify additional license/notice headers embedded in shipped source and link map; integrate actual files into packaging workflow. Commercial clearance still pending.

## Run #4 — verified packaged artifact (2026-10-19)
- GitHub Actions run `39313556482` completed SUCCESS; artifact `12215833862` (`iona-maya1-iphone-arm64-libraries`) downloaded and ZIP directly inspected.
- Exactly **8 `.a` libraries**, **9 license files** under `licenses/`, plus `licenses/external/ggml/AUTHORS`.
- `UPSTREAM_COMMIT.txt` equals pinned `4faef969850e2dd485e717fe2159875b91cfa3dc`.
- `LICENSE_MANIFEST_SHA256.txt`: **10 entries, 10 hashes independently recomputed and matched, 0 mismatches**.
- **Packaging notice omission fixed for this test archive.** This is NOT final commercial clearance: audit exact final linked app, model weights, provenance/voice rights, runtime feasibility and any other embedded notices before release.
