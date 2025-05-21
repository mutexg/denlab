#!/usr/bin/env -S bash ../.port_include.sh
port=denlab-theming
version=955c25365c2e2e47af73b9f3acb68e8dcbc76520
workdir="theming-${version}"
files=(
    "https://github.com/DenLabOS/theming/archive/${version}.zip#976bc81bd3191e3acaa6dce1a6f5277b74f775a2203e2d8ea917cefbdecf0b4c"
)

build() {
    :
}

install() {
    :
}

post_install() {
    cp -r "${workdir}/icon-themes" "${DENLAB_INSTALL_ROOT}/res/"
    cp -r "${workdir}/cursor-themes" "${DENLAB_INSTALL_ROOT}/res/"
    cp -r "${workdir}/icons" "${DENLAB_INSTALL_ROOT}/res/"
    cp -r "${workdir}/themes" "${DENLAB_INSTALL_ROOT}/res/"
    cp -r "${workdir}/fonts" "${DENLAB_INSTALL_ROOT}/res/"
    cp -r "${workdir}/color-palettes" "${DENLAB_INSTALL_ROOT}/res/"
    cp -r "${workdir}/emoji" "${DENLAB_INSTALL_ROOT}/res/"
    cp -r "${workdir}/graphics" "${DENLAB_INSTALL_ROOT}/res/"
    cp -r "${workdir}/color-schemes" "${DENLAB_INSTALL_ROOT}/res/color-schemes/"
    cp -r "${workdir}/wallpapers" "${DENLAB_INSTALL_ROOT}/res/"
    cp "${workdir}/emoji-theming.txt" "${DENLAB_INSTALL_ROOT}/home/anon/Documents/emoji-theming.txt"
}
