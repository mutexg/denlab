denlab_component(
    Eyes
    TARGETS Eyes
)

set(SOURCES
    main.cpp
    EyesWidget.cpp
)

denlab_app(Eyes ICON app-eyes)
target_link_libraries(Eyes PRIVATE LibCore LibDesktop LibGUI LibGfx LibMain LibURL)
