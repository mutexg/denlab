# Patches for nesalizer on DenLabOS

## `0001-Add-DenLab-to-Makefile.patch`

Add DenLab to Makefile

- Add `-lSDL2 -lgui -lipc -lgfx -lcore -lcoreminimal -lpthread -lregex`
- Disable RTTI
- Add SDL2 include path to compile flags

## `0002-Disable-backtracing.patch`

Disable backtracing


