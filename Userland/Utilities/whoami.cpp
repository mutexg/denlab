/*
 * Copyright (c) 2018-2021, Andreas Kling <kling@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <LibCore/System.h>
#include <LibMain/Main.h>
#include <stdio.h>
#include <unistd.h>

ErrorOr<int> denlab_main(Main::Arguments)
{
    TRY(Core::System::pledge("stdio rpath"));
    TRY(Core::System::unveil("/etc/passwd", "r"));
    TRY(Core::System::unveil(nullptr, nullptr));

    puts(getlogin());
    return 0;
}
