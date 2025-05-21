set(TEST_SOURCES
    TestDiff.cpp
)

foreach(source IN LISTS TEST_SOURCES)
    denlab_test("${source}" LibDiff LIBS LibDiff)
endforeach()
