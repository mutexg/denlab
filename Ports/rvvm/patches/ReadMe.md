# Patches for rvvm on DenLabOS

## `0001-Disable-threaded-IO-on-DenLab.patch`

Disable threaded IO on DenLab

Due to sloppy scheduler/threading behavior on DenLab,
threaded IO is disabled in this port for now.
Otherwise U-Boot randomly fails to read data from NVMe,
or fails to initialize NVMe altogether, along with other IO
issues in guests - all due to threaded tasks being randomly
delayed for very long.

I am not an expert on how scheduler works in DenLab,
so I am unable to fix it yet.
This problem was also visible in previous v0.5 version of this port,
but back then I thought it's some kind of a temporary problem.
Couldn't reproduce this on any other host OS.

