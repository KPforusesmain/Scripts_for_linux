#!/bin/bash
set -euo pipefail

TARGET_DIR="${1:-.}"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Directorio no válido: $TARGET_DIR"
    exit 1
fi

echo "Auditoría básica de permisos en: $TARGET_DIR"
echo
echo "Archivos con permisos 777:"
find "$TARGET_DIR" -type f -perm 0777 -printf '%M %u:%g %p\n' 2>/dev/null || true
echo
echo "Directorios con permisos 777:"
find "$TARGET_DIR" -type d -perm 0777 -printf '%M %u:%g %p\n' 2>/dev/null || true
echo
echo "Elementos world-writable:"
find "$TARGET_DIR" -perm -0002 -printf '%M %u:%g %p\n' 2>/dev/null || true
