denlab_component(
    EchoServer
    TARGETS EchoServer
)

set(SOURCES
    Client.cpp
    main.cpp
)

denlab_bin(EchoServer)
target_link_libraries(EchoServer PRIVATE LibCore LibMain)
