#!/bin/bash
set -euo pipefail

TARGET_DIR="${1:-.}"
TOP_N="${2:-20}"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Directorio no válido: $TARGET_DIR"
    exit 1
fi

echo "Buscando los $TOP_N archivos más grandes en: $TARGET_DIR"
find "$TARGET_DIR" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n "$TOP_N"