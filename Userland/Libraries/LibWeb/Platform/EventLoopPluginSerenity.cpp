/*
 * Copyright (c) 2022, Andreas Kling <kling@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include "EventLoopPluginDenLab.h"
#include <AK/NonnullRefPtr.h>
#include <LibCore/EventLoop.h>
#include <LibWeb/Platform/TimerDenLab.h>

namespace Web::Platform {

EventLoopPluginDenLab::EventLoopPluginDenLab() = default;
EventLoopPluginDenLab::~EventLoopPluginDenLab() = default;

void EventLoopPluginDenLab::spin_until(JS::SafeFunction<bool()> goal_condition)
{
    Core::EventLoop::current().spin_until(move(goal_condition));
}

void EventLoopPluginDenLab::deferred_invoke(JS::SafeFunction<void()> function)
{
    VERIFY(function);
    Core::deferred_invoke(move(function));
}

NonnullRefPtr<Timer> EventLoopPluginDenLab::create_timer()
{
    return TimerDenLab::create();
}

void EventLoopPluginDenLab::quit()
{
    Core::EventLoop::current().quit(0);
}

}
