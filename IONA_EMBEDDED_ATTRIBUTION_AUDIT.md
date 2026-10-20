# Iona — Embedded attribution audit, first verified pass (2026-10-19)

Pinned source: `0xShug0/audio.cpp` at `4faef969850e2dd485e717fe2159875b91cfa3dc`.

## Verified obligations
- `external/sentencepiece/third_party/protobuf-lite/LICENSE`: copyright 2008 Google Inc. Its BSD-style terms explicitly require binary redistributions to reproduce the copyright, conditions and disclaimer in documentation and/or other materials. They also prohibit endorsement by Google's name without permission. The file additionally explains that generated Protocol Buffer code is owned by the input-file owner and depends on a separately licensed support library.
- `external/sentencepiece/third_party/darts_clone/LICENSE`: copyright 2008–2011 Susumu Yata. Its BSD-style terms likewise require binary redistribution of the copyright, conditions and disclaimer, and prohibit endorsement without permission. The license text contains a literal `<ORGANIZATION>` placeholder; preserve the verbatim license, do not silently substitute an organization.

## Effect on the iPhone artifact
The Run 17 package contains both full license files under `licenses/external/sentencepiece/third_party/...`, which is an appropriate way to provide these notices **if those files accompany the binary distribution and are made accessible to recipients**. No separate file named NOTICE is required by these two texts. This does **not** establish that all third-party headers/embedded components have been identified or that a future app will expose the notices correctly.

## Remaining checks
- Audit pinned source for any additional copyright/license notices in compiled files and generated code that require preservation.
- Confirm exactly which third-party code is retained in final application and distribute a complete accessible license bundle.
- Inspect weight/model provenance, voice and speaker rights; no commercial clearance yet.
- No device execution, no voice testing, no protected Everett changes.

**Status: PARTIAL PASS on two embedded license texts; overall release NOT CLEARED.**
