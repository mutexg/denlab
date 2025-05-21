# Patches for llvm on DenLabOS

## `0001-clang-Add-support-for-DenLabOS.patch`

Add support for DenLabOS

Adds support for the `$arch-pc-denlab` target to the Clang front end.
This makes the compiler look for libraries and headers in the right
places, and enables some security mitigations like stack-smashing
protection and position-independent code by default.

## `0002-llvm-Add-support-for-building-LLVM-on-DenLabOS.patch`

Add support for building LLVM on DenLabOS

Adds DenLabOS `#ifdef`s for platform-specific code.

We stub out wait4, as DenLabOS doesn't support querying a child
process's resource usage information.

POSIX shm is not supported by DenLabOS yet, so disable it in Orc.

DenLab gives each thread a default of 1MiB of stack. Increase the
default stack size for llvm applications when running on DenLabOS.

## `0003-tools-Support-building-shared-libLLVM-and-libClang-f.patch`

Support building shared libLLVM and libClang for DenLabOS

This patch tells CMake that the --whole-archive linker option should be
used for specifying the archives whose members will constitute these
shared libraries.

Symbol versioning is disabled, as the DenLabOS loader doesn't support
it, and the ELF sections that store version data would just waste space.

## `0004-compiler-rt-Enable-profile-instrumentation-for-Seren.patch`

Enable profile instrumentation for DenLabOS

Treat DenLabOS the same as other *NIX platforms that behave close
enough to linux to use the pre-canned InstrProfiling implementation.

## `0005-libcxx-Add-support-for-DenLabOS.patch`

Add support for DenLabOS

This commit teaches libc++ about what features are available in our
LibC, namely:
* We do not have locale support, so no-op shims should be used in place
  of the C locale API.
* The number of errno constants defined by us is given by the value of
  the `ELAST` macro.
* Multithreading is implemented though the pthread library.
* Use libc++'s builtin character type table instead of the one provided
  by LibC as there's a lot of extra porting work to convince the rest of
  locale.cpp to use our character type table properly.
