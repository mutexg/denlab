/*
 * Copyright (c) 2023, the DenLabOS developers.
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

#include <LibWeb/Painting/PaintContext.h>

namespace Web::Painting {

void paint_table_borders(PaintContext&, PaintableBox const& table_paintable);

}
