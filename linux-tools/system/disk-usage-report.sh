#!/bin/bash
set -euo pipefail

TARGET_DIR="${1:-.}"
TOP_N="${2:-15}"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Directorio no válido: $TARGET_DIR"
    exit 1
fi

echo "Uso de disco en: $TARGET_DIR"
echo "Mostrando top $TOP_N elementos:"
du -h --max-depth=1 "$TARGET_DIR" 2>/dev/null | sort -hr | head -n "$TOP_N"