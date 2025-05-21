set(TEST_SOURCES
    TestWebViewURL.cpp
)

foreach(source IN LISTS TEST_SOURCES)
    denlab_test("${source}" LibWebView LIBS LibWebView LibURL)
endforeach()
