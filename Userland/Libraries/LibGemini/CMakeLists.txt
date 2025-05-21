set(SOURCES
    Document.cpp
    GeminiRequest.cpp
    GeminiResponse.cpp
    Job.cpp
    Line.cpp
)

denlab_lib(LibGemini gemini)
target_link_libraries(LibGemini PRIVATE LibCore LibTLS LibURL)
