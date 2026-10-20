# Run 17 — Direct redistribution artifact inspection (2026-10-19)

Workflow: https://github.com/chipperdrake/iona-ios-compat-test/actions/runs/39368232982
Artifact: `iona-maya1-iphone-arm64-libraries` ID `12240805044`.

Downloaded ZIP and directly inspected with Python zipfile/hashlib:
- ZIP contains 8 static `.a` libraries.
- `licenses/` includes 9 license files and `external/ggml/AUTHORS` (10 hashed items).
- All **10 of 10 SHA256 manifest entries matched** independently; 0 mismatches.
- `UPSTREAM_COMMIT.txt`: `4faef969850e2dd485e717fe2159875b91cfa3dc`, matches pinned source.
- No paths named NOTICE/NOTICE.txt/NOTICE.md in the packaged ZIP. This means conventional NOTICE files were not packaged, **not** proof that no other attribution obligations exist.
- The optional NOTICE-copy step succeeded. At the inspected source paths it did not result in additional files.

**Remaining gate:** Review source headers/embedded third-party notices, model and decoder weights, voice/persona rights, final app SBOM, and actual device feasibility. This package is unsigned static libraries, not a functioning iPhone app. Commercial redistribution remains **PENDING**. Everett untouched.
