set(SOURCES
    Connection.cpp
    Decoder.cpp
    Encoder.cpp
    Message.cpp
)

denlab_lib(LibIPC ipc)
target_link_libraries(LibIPC PRIVATE LibCore LibURL)
