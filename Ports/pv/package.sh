#!/usr/bin/env -S bash ../.port_include.sh
port=pv
version=1.6.20
useconfigure=true
configopts=("--disable-nls")
files=(
    "http://www.ivarch.com/programs/sources/pv-${version}.tar.bz2#e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88d5a3188814fdc603"
)

export CFLAGS=-Wno-deprecated-declarations

# Map LD to the denlab Toolchain, otherwise the host LD is used.
if [ "$DENLAB_TOOLCHAIN" = "Clang" ]; then
    export LD=$(CC)
else
    export LD="${DENLAB_ARCH}-pc-denlab-ld"
fi
