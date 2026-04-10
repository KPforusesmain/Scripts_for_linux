#!/bin/bash
set -euo pipefail

TARGET_DIR="${1:-/}"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Directorio no válido: $TARGET_DIR"
    exit 1
fi

echo "Buscando archivos con bit SUID/SGID en: $TARGET_DIR"
find "$TARGET_DIR" -xdev \( -perm -4000 -o -perm -2000 \) -type f \
    -printf '%M %u:%g %p\n' 2>/dev/null | sort
