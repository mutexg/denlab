set(TEST_SOURCES
    TestThread.cpp
)

foreach(source IN LISTS TEST_SOURCES)
    denlab_test("${source}" LibThreading LIBS LibThreading)
endforeach()
