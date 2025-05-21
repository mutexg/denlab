/*
 * Copyright (c) 2021, the DenLabOS developers.
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <AK/ByteString.h>
#include <AK/Format.h>
#include <LibCore/System.h>
#include <LibMain/Main.h>

ErrorOr<int> denlab_main(Main::Arguments)
{
    TRY(Core::System::pledge("rpath stdio"));
    outln(TRY(Core::System::getcwd()));
    return 0;
}
