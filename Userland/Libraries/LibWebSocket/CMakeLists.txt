set(SOURCES
    ConnectionInfo.cpp
    Impl/WebSocketImpl.cpp
    Impl/WebSocketImplDenLab.cpp
    WebSocket.cpp
)

denlab_lib(LibWebSocket websocket)
target_link_libraries(LibWebSocket PRIVATE LibCore LibCrypto LibTLS LibURL)
