# Patches for libassuan on DenLabOS

## `0001-Include-sys-time.h.patch`

Include sys/time.h


## `0002-libtool-Enable-shared-library-support-for-DenLabOS.patch`

libtool: Enable shared library support for DenLabOS

For some odd reason, libtool handles the configuration for shared
libraries entirely statically and in its configure script. If no
shared library support is "present", building shared libraries is
disabled entirely.

Fix that by just adding the appropriate configuration options for
`denlab`. This allows us to finally create dynamic libraries
automatically using libtool, without having to manually link the
static library into a shared library.

