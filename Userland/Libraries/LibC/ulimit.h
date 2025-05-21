/*
 * Copyright (c) 2018-2020, Andreas Kling <kling@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

#include <sys/cdefs.h>

__BEGIN_DECLS

long ulimit(int cmd, long newlimit);

__END_DECLS
