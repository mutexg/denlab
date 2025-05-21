denlab_component(
    WorkspacePicker.Applet
    REQUIRED
    TARGETS WorkspacePicker.Applet
)

set(SOURCES
    DesktopStatusWindow.cpp
    main.cpp
)

denlab_bin(WorkspacePicker.Applet)
target_link_libraries(WorkspacePicker.Applet PRIVATE LibGUI LibCore LibGfx LibIPC LibMain)
