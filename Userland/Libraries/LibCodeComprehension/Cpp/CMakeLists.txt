set(SOURCES
    CppComprehensionEngine.cpp
)

denlab_lib(LibCppComprehension cppcomprehension)
target_link_libraries(LibCppComprehension PRIVATE LibCodeComprehension)

denlab_component(
    CppComprehensionTests
    TARGETS CppComprehensionTests
)

set(SOURCES
    CppComprehensionEngine.cpp
    Tests.cpp
)

denlab_bin(CppComprehensionTests)

target_link_libraries(CppComprehensionTests PRIVATE LibCodeComprehension LibCore LibCpp LibFileSystem LibRegex LibMain)
