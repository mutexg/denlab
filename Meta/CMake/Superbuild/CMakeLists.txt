cmake_minimum_required(VERSION 3.20)

project(
    DenLabSuperbuild
    DESCRIPTION "Orchestrate host and target builds in a single build"
    LANGUAGES NONE
)

# NOTE: Before CMake 3.19, if a custom command is attached to multiple step targets for Makefile and Visual Studio generators,
#       it might be run multiple times during the build. Enable new behavior of policy CMP0114 to avoid this.
cmake_policy(SET CMP0114 NEW)

get_filename_component(
    DENLAB_SOURCE_DIR "${PROJECT_SOURCE_DIR}/../../.."
    ABSOLUTE CACHE
)
set(DENLAB_ARCH "x86_64" CACHE STRING "Target architecture for DenLabOS.")
set(DENLAB_TOOLCHAIN "GNU" CACHE STRING "Compiler toolchain to use for DenLab (GNU or Clang)")

# FIXME: It is preferred to keep all the sub-build artifacts below the binary directory for the superbuild
#        However, this has an impact on developer's IDE settings and more significantly, the Ports tree.
#        See https://github.com/DenLabOS/denlab/pull/9297#discussion_r697877603
set(DENLAB_BUILD_DIR_SUFFIX "")
if(NOT DENLAB_TOOLCHAIN STREQUAL "GNU")
  string(TOLOWER "${DENLAB_TOOLCHAIN}" DENLAB_BUILD_DIR_SUFFIX)
endif()
set(DENLAB_BUILD_DIR "${PROJECT_BINARY_DIR}/../${DENLAB_ARCH}${DENLAB_BUILD_DIR_SUFFIX}")

# Pkgconf incorrectly discards a sysroot if it doesn't match the start of the path to the
# library file. To avoid that, resolve our sysroot into an absolute and canonical path
# that matches pkgconf's result for resolving the library file.
get_filename_component(DENLAB_BUILD_DIR "${DENLAB_BUILD_DIR}" ABSOLUTE)

# TODO: Figure out if and how we can skip this when building on DenLab.
configure_file("${DENLAB_SOURCE_DIR}/Toolchain/CMake/${DENLAB_TOOLCHAIN}Toolchain.txt.in" "${DENLAB_BUILD_DIR}/CMakeToolchain.txt" @ONLY)
set(DENLAB_TOOLCHAIN_FILE "${DENLAB_BUILD_DIR}/CMakeToolchain.txt" CACHE PATH "Toolchain file to use for cross-compilation")
# Support non-cross builds by stuffing this in a variable
set(DENLAB_TOOLCHAIN_FILE_ARG "-DCMAKE_TOOLCHAIN_FILE:STRING=${DENLAB_TOOLCHAIN_FILE}")

configure_file("${DENLAB_SOURCE_DIR}/Toolchain/CMake/meson-cross-file-${DENLAB_TOOLCHAIN}.txt.in" "${DENLAB_BUILD_DIR}/meson-cross-file.txt" @ONLY)

# Allow the Ninja generators to output messages as they happen by assigning
# these jobs to the 'console' job pool
set(console_access "")
if(CMAKE_GENERATOR MATCHES "^Ninja")
  set(
      console_access
      USES_TERMINAL_CONFIGURE YES
      USES_TERMINAL_BUILD YES
      USES_TERMINAL_INSTALL YES
  )
endif()

include(ExternalProject)

# Collect options for Lagom build
set(lagom_options "")
macro(denlab_option name)
    set(${ARGV})
    get_property(type CACHE "${name}" PROPERTY TYPE)
    list(APPEND lagom_options "-D${name}:${type}=${${name}}")
endmacro()
include("${DENLAB_SOURCE_DIR}/Meta/CMake/lagom_options.cmake")

# Forward user defined host toolchain to lagom build
if (DEFINED CMAKE_C_COMPILER)
    set(CMAKE_C_COMPILER "${CMAKE_C_COMPILER}" CACHE STRING "C Compiler to use for host builds")
    list(APPEND lagom_options "-DCMAKE_C_COMPILER:STRING=${CMAKE_C_COMPILER}")
endif()
if (DEFINED CMAKE_CXX_COMPILER)
    set(CMAKE_CXX_COMPILER "${CMAKE_CXX_COMPILER}" CACHE STRING "C++ Compiler to use for host builds")
    list(APPEND lagom_options "-DCMAKE_CXX_COMPILER:STRING=${CMAKE_CXX_COMPILER}")
endif()

ExternalProject_Add(
    lagom
    SOURCE_DIR "${DENLAB_SOURCE_DIR}/Meta/Lagom"
    BINARY_DIR "${PROJECT_BINARY_DIR}/../lagom"
    INSTALL_DIR "${PROJECT_BINARY_DIR}/../lagom-install"
    EXCLUDE_FROM_ALL YES
    CMAKE_CACHE_ARGS
    "-DCMAKE_INSTALL_PREFIX:STRING=<INSTALL_DIR>"
    "-DDENLAB_CACHE_DIR:STRING=${DENLAB_CACHE_DIR}"
    ${lagom_options}
    # Always call the build step of tools, so keeping things up-to-date is easy
    BUILD_ALWAYS YES
    # Expose install step as a target, so it can be depended on
    STEP_TARGETS install
    ${console_access}
)

# Collect options for denlab build
set(denlab_options "")
macro(denlab_option name)
    set(${ARGV})
    get_property(type CACHE "${name}" PROPERTY TYPE)
    list(APPEND denlab_options "-D${name}:${type}=${${name}}")
endmacro()
include("${DENLAB_SOURCE_DIR}/Meta/CMake/denlab_options.cmake")

ExternalProject_Add(
    denlab
    SOURCE_DIR "${DENLAB_SOURCE_DIR}"
    BINARY_DIR "${DENLAB_BUILD_DIR}"
    CMAKE_CACHE_ARGS
    # Tell the find_package(Lagom REQUIRED) command call where to find
    # the CMake package
    "-DCMAKE_PREFIX_PATH:STRING=${PROJECT_BINARY_DIR}/../lagom-install"
    "-DDENLAB_CACHE_DIR:STRING=${DENLAB_CACHE_DIR}"
    "-DDENLAB_ARCH:STRING=${DENLAB_ARCH}"
    "${DENLAB_TOOLCHAIN_FILE_ARG}"
    ${denlab_options}
    # Always call the build step
    BUILD_ALWAYS YES
    # Host tools must be built and installed before the OS can be built
    DEPENDS lagom-install
    STEP_TARGETS configure install
    ${console_access}
)
