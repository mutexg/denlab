denlab_component(
    LibGfxScaleDemo
    TARGETS LibGfxScaleDemo
)

set(SOURCES
    main.cpp
)

denlab_app(LibGfxScaleDemo ICON app-libgfx-demo)
target_link_libraries(LibGfxScaleDemo PRIVATE LibGUI LibIPC LibGfx LibCore LibMain)
