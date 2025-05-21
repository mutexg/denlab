set(SOURCES
    CharacterMap.cpp
    CharacterMapFile.cpp
)

denlab_lib(LibKeyboard keyboard)
target_link_libraries(LibKeyboard PRIVATE LibCore)
