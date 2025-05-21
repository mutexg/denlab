denlab_component(
    RunContainer
    RECOMMENDED
    TARGETS RunContainer
)

set(SOURCES
    LayoutParsing.cpp
    VFSRootContextLayout.cpp
    main.cpp
)

denlab_app(RunContainer ICON app-assistant)
target_link_libraries(RunContainer PRIVATE LibCore LibMain LibFileSystem)
