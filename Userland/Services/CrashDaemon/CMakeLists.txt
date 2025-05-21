denlab_component(
    CrashDaemon
    REQUIRED
    TARGETS CrashDaemon
)

set(SOURCES
    main.cpp
)

denlab_bin(CrashDaemon)
target_link_libraries(CrashDaemon PRIVATE LibCompress LibCore LibCoredump LibMain)
