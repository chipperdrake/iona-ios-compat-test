#!/usr/bin/env bash
# Iona Maya1: prepare notices from an existing pinned audio.cpp checkout.
# No builds, model downloads, or protected voice files are touched.
set -euo pipefail
source_root="${1:?Usage: bash scripts/package_iona_licenses.sh SOURCE_ROOT PACKAGE_ROOT}"
package_root="${2:?Usage: bash scripts/package_iona_licenses.sh SOURCE_ROOT PACKAGE_ROOT}"
expected="4faef969850e2dd485e717fe2159875b91cfa3dc"
actual="$(git -C "$source_root" rev-parse HEAD)"
if [[ "$actual" != "$expected" ]]; then
  echo "REFUSE: expected pinned source $expected; got $actual" >&2
  exit 2
fi
mkdir -p "$package_root/licenses"
declare -a paths=(
  "LICENSE"
  "external/ggml/LICENSE"
  "external/cJSON/LICENSE"
  "external/libyaml/License"
  "external/sentencepiece/LICENSE"
  "external/sentencepiece/third_party/absl/LICENSE"
  "external/sentencepiece/third_party/darts_clone/LICENSE"
  "external/sentencepiece/third_party/esaxx/LICENSE"
  "external/sentencepiece/third_party/protobuf-lite/LICENSE"
)
for rel in "${paths[@]}"; do
  src="$source_root/$rel"
  if [[ ! -s "$src" ]]; then
    echo "REFUSE: missing or empty license: $rel" >&2
    exit 3
  fi
  mkdir -p "$package_root/licenses/$(dirname "$rel")"
  cp "$src" "$package_root/licenses/$rel"
done
# Inspect conventional NOTICE paths without inventing missing notices.
# If any exist, preserve them in the redistribution package.
declare -a notice_paths=(
  "NOTICE"
  "NOTICE.md"
  "external/ggml/NOTICE"
  "external/cJSON/NOTICE"
  "external/libyaml/NOTICE"
  "external/sentencepiece/NOTICE"
  "external/sentencepiece/third_party/absl/NOTICE"
  "external/sentencepiece/third_party/darts_clone/NOTICE"
  "external/sentencepiece/third_party/esaxx/NOTICE"
  "external/sentencepiece/third_party/protobuf-lite/NOTICE"
)
for rel in "${notice_paths[@]}"; do
  if [[ -s "$source_root/$rel" ]]; then
    mkdir -p "$package_root/licenses/$(dirname "$rel")"
    cp "$source_root/$rel" "$package_root/licenses/$rel"
    echo "Preserved NOTICE: $rel"
  fi
done
# Conservatively preserve the upstream llama.cpp MIT notice for the vendored
# llama_tokenizer code. Exact historical code provenance remains under audit.
notice_source="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/notices/llama.cpp-MIT-LICENSE"
if [[ ! -s "$notice_source" ]]; then
  echo "REFUSE: missing vendored tokenizer MIT notice" >&2
  exit 4
fi
mkdir -p "$package_root/licenses/external/llama_tokenizer"
cp "$notice_source" "$package_root/licenses/external/llama_tokenizer/LICENSE"
# Provenance record: useful for review, not a substitute for mandatory notices.
if [[ -s "$source_root/external/ggml/AUTHORS" ]]; then
  cp "$source_root/external/ggml/AUTHORS" "$package_root/licenses/external/ggml/AUTHORS"
fi
printf '%s\n' "$actual" > "$package_root/UPSTREAM_COMMIT.txt"
(
  cd "$package_root"
  find licenses -type f -print0 | sort -z | xargs -0 shasum -a 256
) > "$package_root/LICENSE_MANIFEST_SHA256.txt"
echo "Prepared 9 pinned-source licenses plus llama.cpp MIT notice and optional ggml AUTHORS from pinned source $actual"
echo "NOTE: No final app link map or model-weight license validation; NOT commercially cleared."
