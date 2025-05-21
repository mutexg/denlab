set(SOURCES
    MapWidget.cpp
)

denlab_lib(LibMaps maps)
target_link_libraries(LibMaps PRIVATE LibConfig LibCore LibDesktop LibGfx LibGUI LibProtocol LibURL)
