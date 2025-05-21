set(TEST_SOURCES
    TestEDID.cpp
)

foreach(source IN LISTS TEST_SOURCES)
    denlab_test("${source}" LibEDID LIBS LibEDID)
endforeach()
