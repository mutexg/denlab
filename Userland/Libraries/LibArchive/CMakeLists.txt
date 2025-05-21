set(SOURCES
        Tar.cpp
        TarStream.cpp
        Zip.cpp
        )

denlab_lib(LibArchive archive)
target_link_libraries(LibArchive PRIVATE LibCompress LibCore LibCrypto)
