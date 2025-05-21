denlab_component(
    Debugger
    TARGETS Debugger
)

set(SOURCES
    main.cpp
)

denlab_bin(Debugger)
target_link_libraries(Debugger PRIVATE LibCore LibDebug LibLine LibMain LibDisassembly)
