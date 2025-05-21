/*
 * Copyright (c) 2020-2022, the DenLabOS developers.
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <LibGemini/GeminiResponse.h>

namespace Gemini {

GeminiResponse::GeminiResponse(int status, ByteString meta)
    : m_status(status)
    , m_meta(meta)
{
}

}
