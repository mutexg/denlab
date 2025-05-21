set(SOURCES
    Origin.cpp
    Parser.cpp
    URL.cpp
)

denlab_lib(LibURL url)
target_link_libraries(LibURL PRIVATE LibUnicode LibTextCodec)
