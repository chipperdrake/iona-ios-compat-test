#include "audiocpp.h"
#include <stdint.h>
#include <stdio.h>
int main(void) {
  uint32_t v = audiocpp_abi_version();
  const char *build = audiocpp_build_version();
  printf("audio.cpp ABI=%u build=%s\n", v, build ? build : "unknown");
  return v == 0;
}
