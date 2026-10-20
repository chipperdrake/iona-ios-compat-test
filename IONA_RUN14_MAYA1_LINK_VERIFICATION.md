# Run 14 — Maya1 linker evidence (2026-10-19)

Run: https://github.com/chipperdrake/iona-ios-compat-test/actions/runs/39365988979
Artifact: `iona-iphone-link-probe` ID `12239511360`. ZIP inspected.

- Workflow completed successfully; `link.exitcode` contains **0**.
- `iona-link.map` includes **311 case-insensitive mentions of maya1**. Specific linked symbols include `engine::models::maya1::load_maya1_assets`, `Maya1LlamaGenerator` constructor and `Maya1LlamaGenerator::Impl::generate`. This is stronger than Run 13: actual Maya1 generation implementation appears in the linked symbol map.
- `link.stderr` contains warnings about C source being compiled as C++ and an upstream nested comment; no link errors.
- No `sentencepiece` or `protobuf` literal mentions were found in the map. This does not establish that every runtime dependency or weight-loading path works.
- This was **link-only**, not a physical-iPhone execution, model weight load, inference, audio quality, memory or latency test.
- Commercial license, model weights, voice/speaker permissions and redistribution remain **PENDING**. Do not modify Everett or generate voice before clearance.
- Next technical checkpoint: compile/run a weight-free iPhone device-side registry enumeration smoke test to prove Maya1 family registration at runtime; linker symbols alone do not establish successful execution.
