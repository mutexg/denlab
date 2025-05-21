/*
 * Copyright (c) 2023, Tim Flynn <trflynn89@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#if defined(MACOS_UGLY_WORKAROUND)
#    error Header.h was included again before Footer.h.
#endif

#define Duration DurationMacOS
#define FixedPoint FixedPointMacOS

#define MACOS_UGLY_WORKAROUND
