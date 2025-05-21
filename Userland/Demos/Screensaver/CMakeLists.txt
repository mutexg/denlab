denlab_component(
    Screensaver
    TARGETS Screensaver
)

set(SOURCES
    main.cpp
)

denlab_app(Screensaver ICON app-screensaver)
target_link_libraries(Screensaver PRIVATE LibDesktop LibGUI LibCore LibGfx LibMain)
