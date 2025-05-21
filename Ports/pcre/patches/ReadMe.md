# Patches for pcre on DenLabOS

## `0001-test-Disable-S-on-denlab.patch`

test: Disable '-S' on denlab

This flag uses setrlimit(), which is not supported.

