cmake_minimum_required(VERSION 3.22)

if (NOT DEFINED DENLAB_ARCH OR NOT DEFINED DENLAB_SYSROOT)
    message(FATAL_ERROR "DENLAB_ARCH and DENLAB_SYSROOT must be defined")
endif()

# DENLAB_ARCH is used by the included file.
include(Userland/Libraries/LibC/Headers.cmake)

link_libc_headers("${CMAKE_CURRENT_SOURCE_DIR}/Userland/Libraries/LibC" "${DENLAB_SYSROOT}/usr/include")
