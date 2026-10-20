# Iona Run 16 — Dependency and redistribution gate (2026-10-19)

Run: https://github.com/chipperdrake/iona-ios-compat-test/actions/runs/39367577349

## Confirmed by GitHub Actions
- Overall run completed SUCCESS.
- Explicit `Enforce successful link and Maya1 implementation evidence` step completed SUCCESS. Its conditions require link exit code 0, nonempty executable and map, and `Maya1LlamaGenerator` and `load_maya1_assets` symbols in final map.
- `Package device libraries, public headers, and source licenses` completed SUCCESS. Pinned-source packaging script requires nine nonempty source license files, optional ggml AUTHORS and SHA256 manifest.
- Artifact IDs: `iona-iphone-link-probe` 12240167975; `iona-static-linkage-evidence` 12240088279; `iona-maya1-iphone-arm64-libraries` 12240073147.
- Workflow fetches pinned audio.cpp commit `4faef969850e2dd485e717fe2159875b91cfa3dc`.

## What this does NOT establish
- GitHub's macOS runner only cross-compiles an unsigned iPhone ARM64 executable; **no iPhone device runtime test** has been executed.
- The `--registry-only` smoke path exists in the test source but has **not** been executed. No weights downloaded or speech generated.
- Nine copied license files are not necessarily a complete **final-app** SBOM or notices for all included source, generated code and model assets.
- Original Maya1 and SNAC rights, speaker identity/voice persona, reference/training material rights and commercial redistribution remain under review.
- 4.04 GB q8_0 GGUF weight memory, iPhone performance, heat and feasibility remain untested.

## Next concrete audit task
Inspect the pinned build's generated object and link map against all source-embedded third-party attribution; determine whether additional notices are needed beyond nine license files. Do not claim release clearance until every component and voice/speaker-rights gate is resolved.

**Status: NOT COMMERCIALLY CLEARED.** Everett protected and untouched.
