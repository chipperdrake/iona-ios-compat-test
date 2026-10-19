#include "audiocpp.h"
#include <stdint.h>
#include <stdio.h>

/* Link-only probe. No model is loaded during CI; argv[1] is never provided. */
int main(int argc, char **argv) {
  uint32_t version = audiocpp_abi_version();
  const char *build = audiocpp_build_version();
  printf("audio.cpp ABI=%u build=%s\n", version, build ? build : "unknown");
  if (argc > 1) {
    audiocpp_registry *registry = NULL;
    audiocpp_model *model = NULL;
    audiocpp_model_config config = {0};
    config.family_hint = "maya1";
    audiocpp_status status = audiocpp_registry_create(NULL, &registry);
    if (status == AUDIOCPP_OK) {
      status = audiocpp_model_load(registry, argv[1], &config, NULL, &model);
    }
    audiocpp_model_free(model);
    audiocpp_registry_free(registry);
    return (int)status;
  }
  return version == 0;
}
