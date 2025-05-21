#!/bin/sh

set -e

if [ -z "$DENLAB_SOURCE_DIR" ]
then
    DENLAB_SOURCE_DIR="$(git rev-parse --show-toplevel)"
    echo "DenLab root not set. This is fine! Other scripts may require you to set the environment variable first, e.g.:"
    echo "    export DENLAB_SOURCE_DIR=${DENLAB_SOURCE_DIR}"
fi

cd "$DENLAB_SOURCE_DIR"

find . \( -name Base -o -name Patches -o -name Ports -o -name Root -o -name Toolchain -o -name Build \) -prune -o \( -name '*.ipc' -or -name '*.cpp' -or -name '*.idl' -or -name '*.c' -or -name '*.h' -or -name '*.in' -or -name '*.S' -or -name '*.css' -or -name '*.cmake' -or -name '*.json' -or -name '*.gml' -or -name 'CMakeLists.txt' \) -print > denlab.files
