/*
 * Copyright (c) 2022, Luke Wilde <lukew@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <LibWeb/Bindings/MainThreadVM.h>
#include <LibWeb/CSS/Parser/Parser.h>
#include <LibWeb/Platform/EventLoopPluginDenLab.h>

namespace {

struct Globals {
    Globals();
} globals;

Globals::Globals()
{
    Web::Platform::EventLoopPlugin::install(*new Web::Platform::EventLoopPluginDenLab);
    MUST(Web::Bindings::initialize_main_thread_vm(Web::HTML::EventLoop::Type::Window));
}

}

extern "C" int LLVMFuzzerTestOneInput(uint8_t const* data, size_t size)
{
    AK::set_debug_enabled(false);

    // FIXME: There's got to be a better way to do this "correctly"
    auto& vm = Web::Bindings::main_thread_vm();
    (void)Web::parse_css_stylesheet(Web::CSS::Parser::ParsingContext(*vm.current_realm()), { data, size });
    return 0;
}
