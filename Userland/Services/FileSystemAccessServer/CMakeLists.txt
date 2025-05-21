denlab_component(
    FileSystemAccessServer
    REQUIRED
    TARGETS FileSystemAccessServer
)

compile_ipc(FileSystemAccessServer.ipc FileSystemAccessServerEndpoint.h)
compile_ipc(FileSystemAccessClient.ipc FileSystemAccessClientEndpoint.h)

set(SOURCES
    ConnectionFromClient.cpp
    main.cpp
)

set(GENERATED_SOURCES
    FileSystemAccessServerEndpoint.h
    FileSystemAccessClientEndpoint.h
)

denlab_bin(FileSystemAccessServer)
target_link_libraries(FileSystemAccessServer PRIVATE LibCore LibFileSystem LibGfx LibGUI LibIPC LibMain LibURL)
add_dependencies(FileSystemAccessServer WindowServer)
