/*
 * Copyright (c) 2023, kleines Filmröllchen <filmroellchen@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

#include <LibGUI/Widget.h>

namespace LoginServer {

class Widget : public GUI::Widget {
    C_OBJECT_ABSTRACT(Widget)

public:
    static ErrorOr<NonnullRefPtr<Widget>> try_create();

private:
    Widget() = default;
};

}
