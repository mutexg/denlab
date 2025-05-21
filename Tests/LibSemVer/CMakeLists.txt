set(TEST_SOURCES
    TestFromStringView.cpp
    TestSemVer.cpp
)

foreach(source IN LISTS TEST_SOURCES)
    denlab_test("${source}" LibSemVer LIBS LibSemVer)
endforeach()
