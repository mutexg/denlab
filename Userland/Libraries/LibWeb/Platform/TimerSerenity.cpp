/*
 * Copyright (c) 2022, Andreas Kling <kling@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include "TimerDenLab.h"
#include <AK/NonnullRefPtr.h>
#include <LibCore/Timer.h>

namespace Web::Platform {

NonnullRefPtr<TimerDenLab> TimerDenLab::create()
{
    return adopt_ref(*new TimerDenLab);
}

TimerDenLab::TimerDenLab()
    : m_timer(Core::Timer::try_create().release_value_but_fixme_should_propagate_errors())
{
    m_timer->on_timeout = [this] {
        if (on_timeout)
            on_timeout();
    };
}

TimerDenLab::~TimerDenLab() = default;

void TimerDenLab::start()
{
    m_timer->start();
}

void TimerDenLab::start(int interval_ms)
{
    m_timer->start(interval_ms);
}

void TimerDenLab::restart()
{
    m_timer->restart();
}

void TimerDenLab::restart(int interval_ms)
{
    m_timer->restart(interval_ms);
}

void TimerDenLab::stop()
{
    m_timer->stop();
}

void TimerDenLab::set_active(bool active)
{
    m_timer->set_active(active);
}

bool TimerDenLab::is_active() const
{
    return m_timer->is_active();
}

int TimerDenLab::interval() const
{
    return m_timer->interval();
}

void TimerDenLab::set_interval(int interval_ms)
{
    m_timer->set_interval(interval_ms);
}

bool TimerDenLab::is_single_shot() const
{
    return m_timer->is_single_shot();
}

void TimerDenLab::set_single_shot(bool single_shot)
{
    m_timer->set_single_shot(single_shot);
}

}
