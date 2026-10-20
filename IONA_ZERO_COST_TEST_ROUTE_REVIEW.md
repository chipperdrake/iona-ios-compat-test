# Iona $0 voice test route review — 2026-10-19

Status: no voice generation performed; no zero-cost execution route proven.

## Findings
- Maya1 upstream recommends 16GB+ VRAM for its reference GPU inference. Source: https://huggingface.co/maya-research/maya1
- Existing GitHub Actions ARM64 CI verifies compilation and weight-free linkage, not real iPhone inference.
- Hugging Face public demos may be useful for auditioning but free availability and output rights require individual confirmation; they are not a verified production backend.
- Hugging Face Spaces basic CPU hardware is listed as free, but creating new compute-backed Gradio/Docker Spaces may require a paid plan; do not assume $0 GPU access. Source: https://huggingface.co/docs/hub/spaces-overview
- Candidate Iona text-only voice description is recorded in IONA_VOICE_DESCRIPTION_CANDIDATE_01.md; no reference speaker used.

## Next evidence gate
Find an accessible free GPU notebook session with enough available GPU VRAM (prefer >=16 GB), permitted use and no billing; verify hardware and runtime first, without downloading weights. If not available, evaluate quantized runtime feasibility without claiming actual iPhone performance.

## Protections
No audio, weights, paid resources or protected Everett files touched. Full voice identity and commercial clearance remain open.
