#!/usr/bin/env -S bash ../.port_include.sh
port=gcc
version=14.2.0
useconfigure=true
configopts=("--target=${DENLAB_ARCH}-pc-denlab" "--with-sysroot=/" "--with-build-sysroot=${DENLAB_INSTALL_ROOT}" "--enable-languages=c,c++" "--disable-lto" "--disable-nls" "--enable-shared" "--enable-default-pie" "--enable-host-shared" "--enable-threads=posix" "--enable-initfini-array" "--with-linker-hash-style=gnu")
files=(
    "https://ftpmirror.gnu.org/gnu/gcc/gcc-${version}/gcc-${version}.tar.xz#a7b39bc69cbf9e25826c5a60ab26477001f7c08d85cec04bc0e29cabed6f3cc9"
)
makeopts=("all-gcc" "all-target-libgcc" "all-target-libstdc++-v3" "-j$(nproc)")
installopts=("DESTDIR=${DENLAB_INSTALL_ROOT}" "install-gcc" "install-target-libgcc" "install-target-libstdc++-v3")
depends=("binutils" "gmp" "mpfr" "mpc" "isl")


build() {
    run make "${makeopts[@]}"
    run find "./host-${DENLAB_ARCH}-pc-denlab/gcc/" -maxdepth 1 -type f -executable -exec $STRIP --strip-debug {} \; || echo
}

install() {
    run make "${installopts[@]}"
    run ln -sf gcc "${DENLAB_INSTALL_ROOT}/usr/local/bin/cc"
    run ln -sf g++ "${DENLAB_INSTALL_ROOT}/usr/local/bin/c++"
}
