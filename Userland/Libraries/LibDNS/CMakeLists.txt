set(SOURCES
    Answer.cpp
    Name.cpp
    Packet.cpp
)

denlab_lib(LibDNS dns)
target_link_libraries(LibDNS PRIVATE LibIPC)
