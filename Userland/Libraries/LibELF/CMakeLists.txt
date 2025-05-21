set(SOURCES
    Image.cpp
    Validation.cpp
)

denlab_install_headers("LibELF")
denlab_install_sources("Userland/Libraries/LibELF")

if (DENLABOS)
    list(APPEND SOURCES
        Arch/${DENLAB_ARCH}/entry.S
        Arch/${DENLAB_ARCH}/plt_trampoline.S
        Arch/${DENLAB_ARCH}/tls.cpp
        DynamicLinker.cpp
        DynamicLoader.cpp
        DynamicObject.cpp
        ELFBuild.cpp
        Relocation.cpp
    )

    if (DENLAB_ARCH STREQUAL "aarch64")
        list(APPEND SOURCES
            Arch/aarch64/tls.S
        )
    endif()

    add_library(DynamicLoader_LibELF STATIC ${SOURCES})
    target_link_libraries(DynamicLoader_LibELF
        PUBLIC DynamicLoader_CompileOptions
        PRIVATE DynamicLoader_LibC
    )
endif()

denlab_lib(LibELF elf ${SOURCES})
target_link_libraries(LibELF PRIVATE LibSystem)
