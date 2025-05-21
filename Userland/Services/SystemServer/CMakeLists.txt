denlab_component(
    SystemServer
    REQUIRED
    TARGETS SystemServer
)

set(SOURCES
    main.cpp
    Service.cpp
)

denlab_bin(SystemServer)
target_link_libraries(SystemServer PRIVATE LibCore LibFileSystem LibMain)
