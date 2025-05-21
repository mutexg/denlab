set(SOURCES
    Http11Connection.cpp
    HttpRequest.cpp
    HttpResponse.cpp
    HttpsJob.cpp
    Job.cpp
)

denlab_lib(LibHTTP http)
target_link_libraries(LibHTTP PRIVATE LibCompress LibCore LibTLS LibURL)
