# Patches for ffmpeg on DenLabOS

## `0001-Assume-that-EDOM-exists.patch`

Assume that EDOM exists

Since errno values are not numeric constants on denlab, this won't
work in cpp, assume that it exists.

## `0002-Adapt-to-the-DenLab-thread-name-interface.patch`

Adapt to the DenLab thread name interface


