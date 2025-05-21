/*
 * Copyright (c) 2021, Andreas Kling <kling@denlabos.org>
 * Copyright (c) 2022, the DenLabOS developers.
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

#include <AK/Error.h>
#include <AK/Span.h>
#include <AK/StringView.h>

namespace Main {

struct Arguments {
    int argc {};
    char** argv {};
    Span<StringView> strings;
};

int return_code_for_errors();
void set_return_code_for_errors(int);

}

ErrorOr<int> denlab_main(Main::Arguments);
