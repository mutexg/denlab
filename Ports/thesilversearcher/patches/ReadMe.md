# Patches for thesilversearcher on DenLabOS

## `0001-Add-the-thread-pledge-to-the-pledge-list.patch`

Add the thread pledge to the pledge list

On OpenBSD, stdio typically grants thread, but on DenLab it is its own
option.

