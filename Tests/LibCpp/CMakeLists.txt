set(TEST_SOURCES
    test-cpp-parser.cpp
    test-cpp-preprocessor.cpp
)

foreach(source IN LISTS TEST_SOURCES)
    denlab_test("${source}" LibCpp LIBS LibCpp)
endforeach()
