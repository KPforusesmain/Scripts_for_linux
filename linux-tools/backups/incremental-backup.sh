#!/bin/bash
set -euo pipefail

SOURCE_DIR="${1:-}"
DEST_DIR="${2:-}"

if [[ -z "$SOURCE_DIR" ]]; then
    read -rp "Directorio origen: " SOURCE_DIR
fi

if [[ -z "$DEST_DIR" ]]; then
    read -rp "Directorio destino: " DEST_DIR
fi

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Directorio origen no válido: $SOURCE_DIR"
    exit 1
fi

mkdir -p "$DEST_DIR"

if command -v rsync >/dev/null 2>&1; then
    rsync -avh --delete --exclude='.git/' "$SOURCE_DIR"/ "$DEST_DIR"/
    echo "Backup incremental completado en: $DEST_DIR"
else
    echo "rsync no está instalado."
    exit 1
fi
