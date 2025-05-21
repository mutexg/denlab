set(TEST_SOURCES
    TestHID.cpp
)

foreach(source IN LISTS TEST_SOURCES)
    denlab_test("${source}" LibHID LIBS LibHID)
endforeach()
