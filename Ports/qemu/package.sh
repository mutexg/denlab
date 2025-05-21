#!/usr/bin/env -S bash ../.port_include.sh

source version.sh

port='qemu'
version="${QEMU_VERSION}"
useconfigure='true'
configopts=(
    '--target-list=aarch64-softmmu,i386-softmmu,riscv64-softmmu,x86_64-softmmu'
    "--cross-prefix=${DENLAB_ARCH}-pc-denlab-"
    '--extra-ldflags=-lm'
    '--without-default-features'
    '--disable-strip'
    '--enable-pie'
    '--enable-sdl'
    '--enable-slirp'
    '--enable-tcg'
    '--enable-tools'
)
depends=(
  'glib'
  'libslirp'
  'pixman'
  'SDL2'
)
files=(
    "${QEMU_ARCHIVE_URL}#${QEMU_ARCHIVE_SHA256SUM}"
)

pre_patch() {
    # Disable tests (those need way more stuff than QEMU itself) by clearing the respective meson file.
    echo '' > "${workdir}/tests/meson.build"
}

post_install() {
    # Add a drop-in fstab entry to make sure that we can use anonymous executable memory and bypass W^X
    mkdir -p "${DENLAB_INSTALL_ROOT}/etc/fstab.d"
    rm -rf "${DENLAB_INSTALL_ROOT}/etc/fstab.d/qemu"
    for i in /usr/local/bin/qemu-system-{aarch64,i386,riscv64,x86_64}; do
        echo "${i}	${i}	bind	bind,wxallowed,axallowed" >> "${DENLAB_INSTALL_ROOT}/etc/fstab.d/qemu"
    done
}

# We don't have '<arch>-pc-denlab-pkg-config', so just use the "normal" one.
export PKG_CONFIG="pkg-config"
