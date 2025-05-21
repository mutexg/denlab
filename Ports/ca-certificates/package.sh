#!/usr/bin/env -S bash ../.port_include.sh
port='ca-certificates'
version='2025-02-25'
files=(
    "https://curl.se/ca/cacert-${version}.pem#50a6277ec69113f00c5fd45f09e8b97a4b3e32daa35d3a95ab30137a55386cef"
)
workdir='.'

configure() {
    :
}

build() {
    :
}

install() {
    mkdir -p "${DENLAB_INSTALL_ROOT}/etc/ssl/certs"
    cp -vf "cacert-${version}.pem" "${DENLAB_INSTALL_ROOT}/etc/ssl/certs/ca-certificates.crt"

    # Create symlinks in /usr/local/ssl since some ports don't read /etc/ssl
    mkdir -p "${DENLAB_INSTALL_ROOT}/usr/local/ssl"
    rm -rvf "${DENLAB_INSTALL_ROOT}/usr/local/ssl/certs"
    ln -svf "/etc/ssl/certs" "${DENLAB_INSTALL_ROOT}/usr/local/ssl"
    ln -svf "/etc/ssl/certs/ca-certificates.crt" "${DENLAB_INSTALL_ROOT}/usr/local/ssl/cert.pem"
}
