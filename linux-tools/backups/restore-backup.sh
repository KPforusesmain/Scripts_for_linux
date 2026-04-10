#!/bin/bash
set -euo pipefail

ARCHIVE_FILE="${1:-}"
DEST_DIR="${2:-$PWD}"

if [[ -z "$ARCHIVE_FILE" ]]; then
    read -rp "Ruta del archivo backup (.tar.gz): " ARCHIVE_FILE
fi

if [[ ! -f "$ARCHIVE_FILE" ]]; then
    echo "Archivo de backup no válido: $ARCHIVE_FILE"
    exit 1
fi

mkdir -p "$DEST_DIR"
tar -xzf "$ARCHIVE_FILE" -C "$DEST_DIR"
echo "Backup restaurado en: $DEST_DIR"
