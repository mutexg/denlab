/*
 * Copyright (c) 2018-2020, Andreas Kling <kling@denlabos.org>
 * Copyright (c) 2023, Andrew Kaster <akaster@denlabos.org>
 * Copyright (c) 2023, Lucas Chollet <lucas.chollet@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <ImageDecoder/ConnectionFromClient.h>
#include <LibCore/ArgsParser.h>
#include <LibCore/EventLoop.h>
#include <LibIPC/SingleServer.h>
#include <LibMain/Main.h>

ErrorOr<int> denlab_main(Main::Arguments)
{
    AK::set_rich_debug_enabled(true);

    Core::EventLoop event_loop;

    auto client = TRY(IPC::take_over_accepted_client_from_system_server<ImageDecoder::ConnectionFromClient>());

    return event_loop.exec();
}
