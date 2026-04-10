#!/bin/bash
set -euo pipefail

TARGET_DIR="${1:-.}"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Directorio no válido: $TARGET_DIR"
    exit 1
fi

echo "Archivos vacíos encontrados en: $TARGET_DIR"
find "$TARGET_DIR" -type f -empty

echo
read -rp "¿Deseas eliminarlos? (s/n): " confirm

if [[ "$confirm" =~ ^[sS]$ ]]; then
    find "$TARGET_DIR" -type f -empty -delete
    echo "Archivos vacíos eliminados."
else
    echo "Operación cancelada."
fi