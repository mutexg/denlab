/*
 * Copyright (c) 2018-2020, Andreas Kling <kling@denlabos.org>
 * Copyright (c) 2022, Alex Major
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <LibMain/Main.h>
#include <unistd.h>

ErrorOr<int> denlab_main(Main::Arguments)
{
    sync();
    return 0;
}
