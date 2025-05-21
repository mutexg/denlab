set(SOURCES
    ShellComprehensionEngine.cpp
)

denlab_lib(LibShellComprehension shellcomprehension)
target_link_libraries(LibShellComprehension PRIVATE LibCodeComprehension)
