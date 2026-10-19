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
