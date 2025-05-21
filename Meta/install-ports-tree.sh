#!/usr/bin/env bash

DENLAB_PORTS_DIR="${DENLAB_SOURCE_DIR}/Build/${DENLAB_ARCH}/Root/usr/Ports"

for file in $(git ls-files "${DENLAB_SOURCE_DIR}/Ports"); do
    if [ "$(basename "$file")" != ".hosted_defs.sh" ]; then
        target=${DENLAB_PORTS_DIR}/$(realpath --relative-to="${DENLAB_SOURCE_DIR}/Ports" "$file")
        mkdir -p "$(dirname "$target")" && cp "$file" "$target"
    fi
done
