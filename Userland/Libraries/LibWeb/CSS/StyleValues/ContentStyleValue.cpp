/*
 * Copyright (c) 2018-2020, Andreas Kling <kling@denlabos.org>
 * Copyright (c) 2021, Tobias Christiansen <tobyase@denlabos.org>
 * Copyright (c) 2021-2023, Sam Atkins <atkinssj@denlabos.org>
 * Copyright (c) 2022-2023, MacDue <macdue@dueutil.tech>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include "ContentStyleValue.h"
#include <LibWeb/CSS/StyleValues/StyleValueList.h>

namespace Web::CSS {

String ContentStyleValue::to_string() const
{
    if (has_alt_text())
        return MUST(String::formatted("{} / {}", m_properties.content->to_string(), m_properties.alt_text->to_string()));
    return m_properties.content->to_string();
}

}
