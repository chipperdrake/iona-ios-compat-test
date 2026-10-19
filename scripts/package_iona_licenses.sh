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
# Provenance record: useful for review, not a substitute for mandatory notices.
if [[ -s "$source_root/external/ggml/AUTHORS" ]]; then
  cp "$source_root/external/ggml/AUTHORS" "$package_root/licenses/external/ggml/AUTHORS"
fi
printf '%s\n' "$actual" > "$package_root/UPSTREAM_COMMIT.txt"
(
  cd "$package_root"
  find licenses -type f -print0 | sort -z | xargs -0 shasum -a 256
) > "$package_root/LICENSE_MANIFEST_SHA256.txt"
echo "Prepared 9 license files and optional ggml AUTHORS from pinned source $actual"
echo "NOTE: No final app link map or model-weight license validation; NOT commercially cleared."
