/*
 * Copyright (c) 2021, Peter Elliott <pelliott@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <LibCore/SessionManagement.h>
#include <LibCore/System.h>
#include <LibMain/Main.h>
#include <signal.h>

ErrorOr<int> denlab_main(Main::Arguments)
{
    TRY(Core::System::pledge("stdio proc rpath"));
    TRY(Core::System::unveil("/etc/passwd", "r"));
    TRY(Core::System::unveil(nullptr, nullptr));

    TRY(Core::SessionManagement::logout());

    return 0;
}
