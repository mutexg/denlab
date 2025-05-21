set(TEST_SOURCES
    TestHttp11Connection.cpp
)

foreach(source IN LISTS TEST_SOURCES)
    denlab_test("${source}" LibHTTP LIBS LibHTTP)
endforeach()
