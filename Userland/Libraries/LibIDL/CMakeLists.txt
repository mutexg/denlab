set(SOURCES
    IDLParser.cpp
    Types.cpp
)

denlab_lib(LibIDL idl)
target_link_libraries(LibIDL PRIVATE LibCoreMinimal LibFileSystem)
