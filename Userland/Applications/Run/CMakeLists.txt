denlab_component(
    Run
    REQUIRED
    TARGETS Run
)

compile_gml(Run.gml RunGML.cpp)

set(SOURCES
    main.cpp
    RunWindow.cpp
    RunGML.cpp
)

denlab_app(Run ICON app-run)
target_link_libraries(Run PRIVATE LibCore LibFileSystem LibDesktop LibGfx LibGUI LibMain LibURL)
