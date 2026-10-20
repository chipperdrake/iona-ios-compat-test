# Iona Maya1 voice identity and consent gate — 2026-10-19

Status: OPEN; not cleared for commercial launch.

## Primary-source findings
- Maya Research's public Maya1 model card says voice generation is conditioned by a natural-language description rather than a required reference recording. It describes curated studio recordings and selected clean clips, but does not supply a per-speaker consent/license chain for any specific output voice.
  Source: https://huggingface.co/maya-research/maya1
- The model card states Apache-2.0 permits commercial use of the model, while expressly separating rights to reference material, training data and a person's voice.
- Maya Research's Terms of Use say its *hosted Services* may generate commercial output, claim consent for shipped voices, and assign certain output rights. These Terms describe the Services and do not independently establish that every output of locally run open weights has cleared speaker/persona rights.
  Source: https://www.mayaresearch.ai/terms/
- Model card explicitly discourages deceptive impersonation and calls for consent and safeguards.

## Product-specific safe direction
- Iona is a fictional coach, not an impersonation target.
- Prefer text-only voice description with no real-person name, voice reference, voice cloning, or borrowed demo recording.
- No specific generated voice has been auditioned or accepted; no real-device test and no model-weight execution established.
- Before approving a selected voice: record exact prompt/settings and generated sample; check whether it resembles an identifiable real speaker, retain evidence of originality and relevant permissions, and seek legal review if ambiguity remains.
- Apache-2.0 and MIT model notices were packaged in the successful run #20, but that does not resolve persona/voice rights.
- Keep approved Everett recording and assets untouched.

## Next gate
Define an original non-impersonating Iona voice-description candidate; determine feasible $0 execution/testing route and memory requirements before any download. Do not represent voice rights as conclusively cleared.
