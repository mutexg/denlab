denlab_component(
    NetworkSettings
    REQUIRED
    TARGETS NetworkSettings
)

compile_gml(NetworkSettings.gml NetworkSettingsGML.cpp)

set(SOURCES
    NetworkSettingsWidget.cpp
    NetworkSettingsGML.cpp
    main.cpp
)

denlab_app(NetworkSettings ICON network)
target_link_libraries(NetworkSettings PRIVATE LibCore LibGfx LibGUI LibMain)
