set(SOURCES
    Editor.cpp
    InternalFunctions.cpp
    KeyCallbackMachine.cpp
    SuggestionManager.cpp
    XtermSuggestionDisplay.cpp
)

denlab_lib(LibLine line)
target_link_libraries(LibLine PRIVATE LibCoreMinimal LibCoreBasic LibUnicode)
