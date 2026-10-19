# Iona Run 6 — static archive membership analysis

Source: run `39317186825`, artifact `12218132012`; archive member reports downloaded and inspected directly. **This is not a final application link map.**

| Library | Actual object files (excluding archive symbol index) |
|---|---:|
| libcjson_vendor.a | 1 |
| libengine_runtime.a | 188 |
| libggml-base.a | 9 |
| libggml-blas.a | 1 |
| libggml-cpu.a | 15 |
| libggml.a | 1 |
| libsentencepiece.a | 40 |
| libyaml_vendor.a | 5 |

The runtime archive explicitly contains `snac_decoder_runtime.cpp.o`. No member filenames in the eight archives directly contain `maya`, `httplib`, `utf8proc`, `miniaudio`, `absl`, `darts`, `esaxx`, or `protobuf`; filename absence is **not proof** that implementations are absent (generic names and compiled-in code exist). `libsentencepiece.a` has 40 object files, and generated protobuf objects have previously been observed. The symbol reports are evidence of exports/references, not final reachability.

**Next technical gate:** create a minimal Maya1/SNAC iPhone executable or test host with real runtime API calls, capture Apple's final linker map, and reconcile linked object files against notice inventory. This may require a working model-independent initialization path. Do not download weights or touch protected voices for this step. All commercial approval remains PENDING.
