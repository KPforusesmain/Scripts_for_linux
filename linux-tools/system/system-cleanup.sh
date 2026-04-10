#!/bin/bash
set -euo pipefail

echo "Iniciando limpieza del sistema..."

if command -v apt >/dev/null 2>&1; then
    sudo apt autoremove -y
    sudo apt autoclean -y
fi

echo "Limpiando /tmp de archivos antiguos mayores a 7 días..."
find /tmp -type f -mtime +7 2>/dev/null | while read -r file; do
    rm -f "$file"
done

echo "Limpieza completada."