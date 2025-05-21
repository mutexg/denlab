/*
 * Copyright (c) 2020, Peter Elliott <pelliott@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

#include <AK/Error.h>
#include <LibCore/SecretString.h>

namespace Core {

ErrorOr<SecretString> get_password(StringView prompt = "Password: "sv);

}
