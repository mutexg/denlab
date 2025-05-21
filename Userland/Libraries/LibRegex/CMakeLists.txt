set(SOURCES
    RegexByteCode.cpp
    RegexLexer.cpp
    RegexMatcher.cpp
    RegexOptimizer.cpp
    RegexParser.cpp
)

if(DENLABOS)
    list(APPEND SOURCES C/Regex.cpp)
endif()

denlab_lib(LibRegex regex)
target_link_libraries(LibRegex PRIVATE LibUnicode)
