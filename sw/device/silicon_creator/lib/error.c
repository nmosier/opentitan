// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/silicon_creator/lib/error.h"

const char *rom_error_strerror(rom_error_t err) {
  const char *s = NULL;
#define ROM_ERROR_STRERROR_X(name, ...) (s = name == err ? #name : s)
  DEFINE_ERRORS(ROM_ERROR_STRERROR_X);
#undef ROM_ERROR_STRERROR_X
  return s;
}
