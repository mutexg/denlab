/*
 * Copyright (c) 2018-2020, Andreas Kling <kling@denlabos.org>
 * Copyright (c) 2022, the DenLabOS developers.
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

#include <LibGUI/Widget.h>

namespace GUI {

class ResizeCorner : public Widget {
    C_OBJECT(ResizeCorner)
public:
    virtual ~ResizeCorner() override = default;

protected:
    ResizeCorner();

    virtual void paint_event(PaintEvent&) override;
    virtual void mousedown_event(MouseEvent&) override;
};

}
