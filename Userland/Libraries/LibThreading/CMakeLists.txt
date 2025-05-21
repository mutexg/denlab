set(SOURCES
    BackgroundAction.cpp
    Thread.cpp
)

denlab_lib(LibThreading threading)
target_link_libraries(LibThreading PRIVATE LibCore)
