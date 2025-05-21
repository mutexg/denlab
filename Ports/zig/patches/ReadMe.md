# Patches for zig on DenLabOS

## `0001-Support-Add-support-for-building-LLVM-on-DenLabOS.patch`

Add support for building LLVM on DenLabOS

Adds DenLabOS `#ifdef`s for platform-specific code.

We stub out wait4, as DenLabOS doesn't support querying a child
process's resource usage information.

## `0002-Triple-Add-triple-for-DenLabOS.patch`

Add triple for DenLabOS


## `0003-Driver-Add-support-for-DenLabOS.patch`

Add support for DenLabOS

Adds support for the `$arch-pc-denlab` target to the Clang front end.
This makes the compiler look for libraries and headers in the right
places, and enables some security mitigations like stack-smashing
protection and position-independent code by default.

Co-authored-by: kleines Filmröllchen <filmroellchen@denlabos.org>

## `0004-Driver-Default-to-ftls-model-initial-exec-on-Serenit.patch`

Default to -ftls-model=initial-exec on DenLabOS

This is a hack to make Clang use the initial-exec TLS model instead of
the default local-exec when building code for DenLab.

This patch should be removed when we implement proper TLS support.

## `0005-libc-Add-support-for-DenLabOS.patch`

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

This commit is an adaptation of the LLVM patch by Daniel Bertalan to fit
the layout of the zig-bootstrap project.


## `0006-cmake-Allow-undefined-symbols-on-DenLabOS.patch`

Allow undefined symbols on DenLabOS

Allow undefined symbols in LLVM libraries, which is needed because only
stubs are available for DenLabOS libraries when libc++ and libunwind
are built.

## `0007-cmake-Support-building-shared-libLLVM-and-libClang-f.patch`

Support building shared libLLVM and libClang for DenLabOS

This patch tells CMake that the --whole-archive linker option should be
used for specifying the archives whose members will constitute these
shared libraries.

Symbol versioning is disabled, as the DenLabOS loader doesn't support
it, and the ELF sections that store version data would just waste space.

## `0008-Add-DenLabOS-to-config.guess.patch`

Add DenLabOS to config.guess


## `0009-llvm-Prevent-the-use-of-POSIX-shm-on-DenLabOS.patch`

Prevent the use of POSIX shm on DenLabOS

POSIX shm is not supported by DenLabOS yet, so this causes a
compilation error.

## `0010-cmake-Increase-the-default-stack-size-when-running-o.patch`

cmake: Increase the default stack size when running on DenLabOS


## `0011-Add-DenLabOS-target.patch`

Add DenLabOS target

Named "denlab" within the code to match what LLVM says.

## `0012-Implement-DenLabOS-support-in-std.patch`

Implement DenLabOS support in std


## `0013-build-Adjust-build-process-for-DenLabOS.patch`

build: Adjust build process for DenLabOS


## `0014-zlib-Fix-implicit-write-method-declaration-error.patch`

zlib: Fix implicit write() method declaration error


## `0015-build-Remove-unsupported-zig-linker-flag-z-seperate-.patch`

build: Remove unsupported zig linker flag -z seperate-code


## `0016-docgen-Filter-ZIG_LIBC-from-the-environment.patch`

docgen: Filter ZIG_LIBC from the environment

This environment variable can leak into the doctest builds and cause
them to look for the host libraries in the target libc locations.

## `0017-build-Set-Zig-version-to-0.12.0-dev.141-ddf5859c2.patch`

build: Set Zig version to 0.12.0-dev.141+ddf5859c2


