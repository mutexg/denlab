set(SOURCES
    Chess.cpp
    UCICommand.cpp
    UCIEndpoint.cpp
)

denlab_lib(LibChess chess)
target_link_libraries(LibChess PRIVATE LibCore)
