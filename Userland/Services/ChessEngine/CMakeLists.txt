denlab_component(
    ChessEngine
    TARGETS ChessEngine
)

set(SOURCES
    ChessEngine.cpp
    main.cpp
    MCTSTree.cpp
)

denlab_bin(ChessEngine)
target_link_libraries(ChessEngine PRIVATE LibChess LibCore LibMain)
