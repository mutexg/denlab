denlab_component(
    KeyboardPreferenceLoader
    REQUIRED
    TARGETS KeyboardPreferenceLoader keymap
)

set(SOURCES
    main.cpp
)

denlab_bin(KeyboardPreferenceLoader)
target_link_libraries(KeyboardPreferenceLoader PRIVATE LibCore LibMain)
