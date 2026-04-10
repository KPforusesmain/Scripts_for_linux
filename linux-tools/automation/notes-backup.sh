#!/bin/bash
set -euo pipefail

SOURCE_DIR="${1:-$HOME/Documents}"
BACKUP_DIR="${2:-$HOME/backups/notes}"

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Directorio de notas no válido: $SOURCE_DIR"
    exit 1
fi

mkdir -p "$BACKUP_DIR"
OUTPUT_FILE="$BACKUP_DIR/notes_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

tar -czf "$OUTPUT_FILE" -C "$SOURCE_DIR" .
echo "Backup creado: $OUTPUT_FILE"
