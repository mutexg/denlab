/*
 * Copyright (c) 2023, Andrew Kaster <akaster@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <Ladybird/FontPlugin.h>
#include <Ladybird/HelperProcess.h>
#include <Ladybird/Utilities.h>
#include <LibCore/ArgsParser.h>
#include <LibCore/EventLoop.h>
#include <LibCore/LocalServer.h>
#include <LibCore/StandardPaths.h>
#include <LibCore/System.h>
#include <LibFileSystem/FileSystem.h>
#include <LibIPC/SingleServer.h>
#include <LibMain/Main.h>
#include <LibWeb/Bindings/MainThreadVM.h>
#include <LibWeb/Loader/GeneratedPagesLoader.h>
#include <LibWeb/Loader/ResourceLoader.h>
#include <LibWeb/Platform/EventLoopPlugin.h>
#include <LibWeb/Platform/EventLoopPluginDenLab.h>
#include <LibWeb/Platform/FontPluginDenLab.h>
#include <LibWeb/WebSockets/WebSocket.h>
#include <LibWebView/RequestServerAdapter.h>
#include <LibWebView/WebSocketClientAdapter.h>
#include <WebWorker/ConnectionFromClient.h>

#if defined(HAVE_QT)
#    include <Ladybird/Qt/EventLoopImplementationQt.h>
#    include <Ladybird/Qt/RequestManagerQt.h>
#    include <QCoreApplication>
#endif

static ErrorOr<void> initialize_lagom_networking(int request_server_socket);

ErrorOr<int> denlab_main(Main::Arguments arguments)
{
    AK::set_rich_debug_enabled(true);

    int request_server_socket { -1 };
    StringView denlab_resource_root;
    bool use_lagom_networking { false };

    Core::ArgsParser args_parser;
    args_parser.add_option(request_server_socket, "File descriptor of the request server socket", "request-server-socket", 's', "request-server-socket");
    args_parser.add_option(denlab_resource_root, "Absolute path to directory for denlab resources", "denlab-resource-root", 'r', "denlab-resource-root");
    args_parser.add_option(use_lagom_networking, "Enable Lagom servers for networking", "use-lagom-networking");
    args_parser.parse(arguments);

#if defined(HAVE_QT)
    QCoreApplication app(arguments.argc, arguments.argv);
    Core::EventLoopManager::install(*new Ladybird::EventLoopManagerQt);
#endif
    Core::EventLoop event_loop;

    platform_init();

    Web::Platform::EventLoopPlugin::install(*new Web::Platform::EventLoopPluginDenLab);

    Web::Platform::FontPlugin::install(*new Web::Platform::FontPluginDenLab);

#if defined(HAVE_QT)
    if (!use_lagom_networking)
        Web::ResourceLoader::initialize(Ladybird::RequestManagerQt::create());
    else
#endif
        TRY(initialize_lagom_networking(request_server_socket));

    TRY(Web::Bindings::initialize_main_thread_vm(Web::HTML::EventLoop::Type::Worker));

    auto client = TRY(IPC::take_over_accepted_client_from_system_server<WebWorker::ConnectionFromClient>());

    return event_loop.exec();
}

static ErrorOr<void> initialize_lagom_networking(int request_server_socket)
{
    auto socket = TRY(Core::LocalSocket::adopt_fd(request_server_socket));
    TRY(socket->set_blocking(true));

    auto new_client = TRY(try_make_ref_counted<Protocol::RequestClient>(move(socket)));

    Web::ResourceLoader::initialize(TRY(WebView::RequestServerAdapter::try_create(move(new_client))));

    return {};
}
