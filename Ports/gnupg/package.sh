#!/usr/bin/env -S bash ../.port_include.sh
port='gnupg'
version='2.4.5'
useconfigure='true'
use_fresh_config_sub='true'
config_sub_paths=(
    'build-aux/config.sub'
)
files=(
    "https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${version}.tar.bz2#f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277"
)
depends=(
    'libassuan'
    'libgcrypt'
    'libgpg-error'
    'libiconv'
    'libksba'
    'npth'
    'ntbtls'
)

pre_configure() {
    export GPGRT_CONFIG="${DENLAB_INSTALL_ROOT}/usr/local/bin/gpgrt-config"
    export CFLAGS="-L${DENLAB_INSTALL_ROOT}/usr/local/include"
    export LDFLAGS="-L${DENLAB_INSTALL_ROOT}/usr/local/lib -lm -liconv -ldl"
}

configure() {
    run ./configure \
        --host="${DENLAB_ARCH}-pc-denlab" \
        --build="$("${workdir}/build-aux/config.guess")" \
        --with-libgpg-error-prefix="${DENLAB_INSTALL_ROOT}/usr/local" \
        --with-libgcrypt-prefix="${DENLAB_INSTALL_ROOT}/usr/local" \
        --with-ksba-prefix="${DENLAB_INSTALL_ROOT}/usr/local" \
        --with-libassuan-prefix="${DENLAB_INSTALL_ROOT}/usr/local" \
        --with-ntbtls-prefix="${DENLAB_INSTALL_ROOT}/usr/local" \
        --with-npth-prefix="${DENLAB_INSTALL_ROOT}/usr/local" \
        --disable-dirmngr
}
