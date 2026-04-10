#!/bin/bash
set -euo pipefail

TARGET_DIR="${1:-.}"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Directorio no válido: $TARGET_DIR"
    exit 1
fi

echo "Archivos y directorios world-writable en: $TARGET_DIR"
find "$TARGET_DIR" -xdev -perm -0002 -printf '%M %u:%g %p\n' 2>/dev/null | sort
