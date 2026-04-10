#!/bin/bash
set -euo pipefail

BACKUP_DIR="${1:-$HOME/backups}"
KEEP_COUNT="${2:-5}"

if [[ ! -d "$BACKUP_DIR" ]]; then
    echo "Directorio no válido: $BACKUP_DIR"
    exit 1
fi

if [[ ! "$KEEP_COUNT" =~ ^[0-9]+$ ]]; then
    echo "Uso: $0 [directorio_backups] [cantidad_a_conservar]"
    exit 1
fi

mapfile -t files < <(find "$BACKUP_DIR" -maxdepth 1 -type f -printf '%T@ %p\n' | sort -nr | awk '{print substr($0, index($0,$2))}')

if (( ${#files[@]} <= KEEP_COUNT )); then
    echo "No hay backups antiguos para eliminar."
    exit 0
fi

for ((i=KEEP_COUNT; i<${#files[@]}; i++)); do
    rm -f -- "${files[$i]}"
    echo "Eliminado: ${files[$i]}"
done
