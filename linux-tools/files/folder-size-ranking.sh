#!/bin/bash
set -euo pipefail

TARGET_DIR="${1:-.}"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Directorio no válido: $TARGET_DIR"
    exit 1
fi

echo "Ranking de carpetas por tamaño en: $TARGET_DIR"
du -h --max-depth=1 "$TARGET_DIR" 2>/dev/null | sort -hr