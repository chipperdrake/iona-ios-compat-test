# Run 13 — Maya1 model-loading linkage verified (2026-10-19)

Workflow run: https://github.com/chipperdrake/iona-ios-compat-test/actions/runs/39324495376

- GitHub workflow **SUCCESS**; artifact `iona-iphone-link-probe` ID `12221518767` downloaded and examined.
- `link.exitcode` = **0**; `iona-link-probe` = **4,733,488 bytes**; `iona-link.map` = **1,505,200 bytes**.
- The link probe's source now references `audiocpp_registry_create` and `audiocpp_model_load` with `config.family_hint="maya1"`, gated on a command-line argument. CI only links; it does not run on a physical iPhone or load model weights.
- Apple's `# Object files:` section has **118 entries**. Archive objects by name: 74 `libengine_runtime.a`, 12 `libggml-cpu.a`, 7 `libggml-base.a`, 5 `libyaml_vendor.a`, 2 `libggml.a`, 1 `libggml-blas.a`, 1 `libcjson_vendor.a`; other entries 16.
- Despite explicit Maya1 family hint in probe source, **no object filename containing `maya1`**, **no SentencePiece object**, and **no protobuf object** appears in the final linked-object list. This could reflect registry architecture, weak registration or linker dead stripping. **Do not claim Maya1 generation code is linked merely because the C API call references its family name.**
- Next: inspect model registration and the engine runtime's actual symbol/object graph. Ensure Maya1 model implementation is strongly retained in a representative test executable before considering any speech test or redistribution. No weights, voice tests, or Everett changes. Commercial clearance **PENDING**.
