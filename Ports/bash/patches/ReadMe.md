# Patches for bash on DenLabOS

## `0001-accept.c-Include-sys-select.h.patch`

accept.c: Include sys/select.h

This is transitively pulled in by other headers in some systems,
denlab is not one of them.

## `0002-Remove-getopt-from-examples.patch`

Remove getopt from examples

We currently fail to build getconf.c because we are missing libintl.h and don't support multiple needed syscalls (from around 300 total syscalls).

