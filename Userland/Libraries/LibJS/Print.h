/*
 * Copyright (c) 2020-2021, Andreas Kling <kling@denlabos.org>
 * Copyright (c) 2020-2022, Linus Groh <linusg@denlabos.org>
 * Copyright (c) 2022, Ali Mohammad Pur <mpfard@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

#include <AK/HashTable.h>
#include <LibJS/Runtime/Value.h>

namespace JS {
struct PrintContext {
    JS::VM& vm;
    Stream& stream;
    bool strip_ansi { false };
};

ErrorOr<void> print(JS::Value value, PrintContext&);
}
