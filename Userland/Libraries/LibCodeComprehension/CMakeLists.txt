set(SOURCES
    CodeComprehensionEngine.cpp
    FileDB.cpp
)

denlab_lib(LibCodeComprehension codecomprehension)

add_subdirectory(Cpp)
add_subdirectory(Shell)
