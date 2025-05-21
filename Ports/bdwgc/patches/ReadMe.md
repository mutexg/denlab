# Patches for bdwgc on DenLabOS

## `0001-Teach-os_dep-and-gcconfig.h-about-denlab.patch`

Teach os_dep and gcconfig.h about denlab


## `0002-Error-on-unknown-arch.patch`

Error on unknown arch


## `0003-Teach-dyn_load.c-about-denlab.patch`

Teach dyn_load.c about denlab


## `0004-Teach-bdwgc-about-denlab-signals.patch`

Teach bdwgc about denlab signals

DenLab doesn't have the realtime POSIX signals, so use SIGXCPU and
SIGXFSZ instead.

## `0005-Make-the-collector-build-with-threads.patch`

Make the collector build with threads

In an extremely limited way for now:
- No extra threads
    More threads always lead to exactly one borked thread that's stuck
    in no man's land, doing who-knows-what, and definitely not
    responding to signals.
    However, the APIs are there and they work, so they *can* be used to
    make threads.
- No fork handling
    Seems borked for unknown reasons.

## `0006-Add-denlab-to-the-configure-list-of-pthread-unixes.patch`

Add denlab to the configure list of pthread unixes


