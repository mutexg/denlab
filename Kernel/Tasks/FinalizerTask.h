/*
 * Copyright (c) 2020, Andreas Kling <kling@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

namespace Kernel {
class FinalizerTask {
public:
    static void spawn();
};
}
