# Iona Run 7 — iPhone link-probe outcome (2026-10-19)

Workflow: https://github.com/chipperdrake/iona-ios-compat-test/actions/runs/39318909028

- GitHub Actions job **SUCCESS**, all steps completed, artifacts uploaded.
- Link probe artifact `12218333546` inspected directly: `link.exitcode` = **1** (failure); `link.stdout` empty.
- Linker diagnostics: unresolved `_audiocpp_abi_version` and `_audiocpp_build_version` from `tests/iona_ios_link_probe.c`. The link command passed only `/tmp/iona-build/libengine_runtime.a`.
- Header warning about `model_specs/*.json` nested comment is nonblocking.
- **Do not interpret workflow green as successful executable link.** No valid final executable or link map established.
- Next: locate upstream C ABI implementation/target in pinned audio.cpp source and identify its build target/dependencies. Then revise diagnostic to link that implementation and all required libraries, or use a proven exported engine API. Avoid model weights, protected voice assets, and any commercial clearance claim.
