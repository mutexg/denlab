# Patches for fio on DenLabOS

## `0001-Remove-non-existent-header-sys-ipc.h.patch`

Remove non existent header sys/ipc.h

DenLab doesn't currently have this header, and
it doesn't appear to be needed on our platform so
remove it for the port.

## `0002-Add-DenLabOS-platform-support.patch`

Add DenLabOS platform support

`fio` abstracts individual operating system support out into to an
`os/os-<name>.h` header where you can select which platform features
are available and implement missing function stubs for our operating
system.

This patch implements basic OS support for DenLab just to get fio up
and running.

## `0003-Add-DenLabOS-support-to-configure.patch`

Add DenLabOS support to configure

This patch implements targetos detection for denlab, and also
disables shared memory support automatically for denlab, as it's not
currently supported.

## `0004-Disable-rdtsc-support-for-denlab.patch`

Disable rdtsc support for denlab

This patch disables the function which uses `rdtsc` to get the current
clock time, as that instruction isn't allowed to be called from user
space by denlab.

If you did attempt to call it you would trip a segfault.

