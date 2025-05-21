/*
 * Copyright (c) 2018-2021, Andreas Kling <kling@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <LibCore/File.h>
#include <LibCore/System.h>
#include <LibMain/Main.h>

ErrorOr<int> denlab_main(Main::Arguments)
{
    TRY(Core::System::pledge("stdio rpath"));
    TRY(Core::System::unveil("/sys/kernel/dmesg", "r"));
    TRY(Core::System::unveil(nullptr, nullptr));

    auto file = TRY(Core::File::open("/sys/kernel/dmesg"sv, Core::File::OpenMode::Read));
    auto buffer = TRY(file->read_until_eof());
    out("{}", StringView { buffer });
    return 0;
}
