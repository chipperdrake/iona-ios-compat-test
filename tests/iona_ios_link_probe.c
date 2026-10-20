#include "audiocpp.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

/* Device-side smoke: pass --registry-only to verify Maya1 without weights.
   CI only links this executable; it cannot run an iphoneos binary on macOS. */
int main(int argc, char **argv) {
  uint32_t version = audiocpp_abi_version();
  const char *build = audiocpp_build_version();
  printf("audio.cpp ABI=%u build=%s\n", version, build ? build : "unknown");
  if (argc > 1) {
    audiocpp_registry *registry = NULL;
    audiocpp_model *model = NULL;
    int registry_only = strcmp(argv[1], "--registry-only") == 0;
    audiocpp_model_config config = {0};
    config.family_hint = "maya1";
    audiocpp_status status = audiocpp_registry_create(NULL, &registry);
    if (status == AUDIOCPP_OK) {
      size_t count = audiocpp_registry_family_count(registry);
      int found_maya1 = 0;
      for (size_t i = 0; i < count; ++i) {
        const char *family = NULL;
        if (audiocpp_registry_family(registry, i, &family) == AUDIOCPP_OK && family && strcmp(family, "maya1") == 0) found_maya1 = 1;
      }
      if (!found_maya1) { fprintf(stderr, "Maya1 loader missing from registry\\n"); audiocpp_registry_free(registry); return 99; }
      if (registry_only) {
        puts("PASS: Maya1 registered on device");
      } else {
        status = audiocpp_model_load(registry, argv[1], &config, NULL, &model);
      }
    }
    if (status != AUDIOCPP_OK) fprintf(stderr, "Registry/model status=%d\n", (int)status);
    audiocpp_model_free(model);
    audiocpp_registry_free(registry);
    return (int)status;
  }
  return version == 0;
}
