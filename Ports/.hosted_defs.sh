#!/usr/bin/env bash

SCRIPT="$(realpath $(dirname "${BASH_SOURCE[0]}"))"

export DENLAB_ARCH="${DENLAB_ARCH:-x86_64}"
export DENLAB_TOOLCHAIN="${DENLAB_TOOLCHAIN:-GNU}"

if [ -z "${HOST_CC:=}" ]; then
    export HOST_CC="${CC:=cc}"
    export HOST_CXX="${CXX:=c++}"
    export HOST_LD="${LD:=ld}"
    export HOST_AR="${AR:=ar}"
    export HOST_RANLIB="${RANLIB:=ranlib}"
    export HOST_PATH="${PATH:=}"
    export HOST_READELF="${READELF:=readelf}"
    export HOST_OBJCOPY="${OBJCOPY:=objcopy}"
    export HOST_OBJDUMP="${OBJDUMP:=objdump}"
    export HOST_STRIP="${STRIP:=strip}"
    export HOST_CXXFILT="${CXXFILT:=c++filt}"
    export HOST_PKG_CONFIG_DIR="${PKG_CONFIG_DIR:=}"
    export HOST_PKG_CONFIG_SYSROOT_DIR="${PKG_CONFIG_SYSROOT_DIR:=}"
    export HOST_PKG_CONFIG_LIBDIR="${PKG_CONFIG_LIBDIR:=}"
fi

export DENLAB_SOURCE_DIR="$(realpath "${SCRIPT}/../")"

if [ "$DENLAB_TOOLCHAIN" = "Clang" ]; then
    export DENLAB_BUILD_DIR="${DENLAB_SOURCE_DIR}/Build/${DENLAB_ARCH}clang"
    export DENLAB_TOOLCHAIN_BINDIR="${DENLAB_SOURCE_DIR}/Toolchain/Local/clang/bin"
    export CC="${DENLAB_ARCH}-pc-denlab-clang"
    export CXX="${DENLAB_ARCH}-pc-denlab-clang++"
    export LD="${DENLAB_TOOLCHAIN_BINDIR}/ld.lld"
    export AR="llvm-ar"
    export RANLIB="llvm-ranlib"
    export READELF="llvm-readelf"
    export OBJCOPY="llvm-objcopy"
    export OBJDUMP="llvm-objdump"
    export STRIP="llvm-strip"
    export CXXFILT="llvm-cxxfilt"
else
    export DENLAB_BUILD_DIR="${DENLAB_SOURCE_DIR}/Build/${DENLAB_ARCH}"
    export DENLAB_TOOLCHAIN_BINDIR="${DENLAB_SOURCE_DIR}/Toolchain/Local/${DENLAB_ARCH}/bin"
    export CC="${DENLAB_ARCH}-pc-denlab-gcc"
    export CXX="${DENLAB_ARCH}-pc-denlab-g++"
    export LD="${DENLAB_TOOLCHAIN_BINDIR}/${DENLAB_ARCH}-pc-denlab-ld"
    export AR="${DENLAB_ARCH}-pc-denlab-ar"
    export RANLIB="${DENLAB_ARCH}-pc-denlab-ranlib"
    export READELF="${DENLAB_ARCH}-pc-denlab-readelf"
    export OBJCOPY="${DENLAB_ARCH}-pc-denlab-objcopy"
    export OBJDUMP="${DENLAB_ARCH}-pc-denlab-objdump"
    export STRIP="${DENLAB_ARCH}-pc-denlab-strip"
    export CXXFILT="${DENLAB_ARCH}-pc-denlab-c++filt"
fi

export PATH="${DENLAB_TOOLCHAIN_BINDIR}:${DENLAB_SOURCE_DIR}/Toolchain/Local/cmake/bin:${HOST_PATH}"

export PKG_CONFIG_DIR=""
export PKG_CONFIG_SYSROOT_DIR="${DENLAB_BUILD_DIR}/Root"
export PKG_CONFIG_LIBDIR="${PKG_CONFIG_SYSROOT_DIR}/usr/local/lib/pkgconfig"

export DENLAB_INSTALL_ROOT="${DENLAB_BUILD_DIR}/Root"
export DENLAB_PORT_DIRS="${DENLAB_PORT_DIRS:+${DENLAB_PORT_DIRS}:}${DENLAB_SOURCE_DIR}/Ports"
