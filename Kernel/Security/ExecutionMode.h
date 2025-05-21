/*
 * Copyright (c) 2021, the DenLabOS developers.
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

#include <AK/Types.h>

namespace Kernel {

enum class ExecutionMode : u8 {
    Kernel = 0,
    User,
};

}
