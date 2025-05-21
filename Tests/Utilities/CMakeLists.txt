set(TEST_SOURCES
    TestSed.cpp
    TestPatch.cpp
    TestUniq.cpp
)

foreach(source IN LISTS TEST_SOURCES)
    denlab_test("${source}" Utilities)
endforeach()
