# Patches for qt6-qtbase on DenLabOS

## `0001-Add-a-DenLabOS-platform-definition.patch`

Add a DenLabOS platform definition


## `0002-Disable-shared-memory-and-semaphores.patch`

Disable shared memory and semaphores

It's probably not done in the cleanest way but it works

## `0003-DenLab-doesn-t-support-utimensat-and-UTIME_NOW.patch`

DenLab doesn't support utimensat and UTIME_NOW


## `0004-Hack-Force-searching-for-plugins-in-usr-local.patch`

Hack: Force searching for plugins in /usr/local

I really don't know how else to do this but I'm sure there is a proper
way to handle this. But this works and doesn't break the system so
whatever for now.

## `0005-Disable-version-tagging.patch`

Disable version tagging

This is necessary because as of now, DenLab doesn't support DT_VERSYM
and other related ELF objects

## `0006-DenLab-Disable-local-domain-name-lookup-via-resolv.patch`

DenLab: Disable local domain name lookup via resolv

DenLab doesn't support /etc/resolv.conf or the structures in
<resolv.h> to do Unix-like domain name resolution.

## `0007-Disable-QDnsLookup-entirely.patch`

Disable QDnsLookup entirely

It seems that we used to include the host's system headers, which we no
longer do. Now this feature breaks the package, which is why we have to
disable it in order to build Qt6.

