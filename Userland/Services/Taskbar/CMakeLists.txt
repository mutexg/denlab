denlab_component(
    Taskbar
    REQUIRED
    TARGETS Taskbar
)

set(SOURCES
    main.cpp
    ClockWidget.cpp
    QuickLaunchWidget.cpp
    ShutdownDialog.cpp
    TaskbarButton.cpp
    TaskbarFrame.cpp
    TaskbarWindow.cpp
    WindowList.cpp
)

denlab_bin(Taskbar)
target_link_libraries(Taskbar PRIVATE LibCore LibGfx LibGUI LibDesktop LibConfig LibIPC LibMain LibURL)
denlab_install_headers(Services/Taskbar)
