/*
 * Copyright (c) 2020, the DenLabOS developers.
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <AK/Types.h>
#include <assert.h>
#include <stdio.h>
#include <sys/internals.h>
#include <unistd.h>

#ifndef _DYNAMIC_LOADER
void* __dso_handle __attribute__((__weak__));
#endif
