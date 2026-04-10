#!/bin/bash
set -euo pipefail

SOURCE_DIR="${1:-$HOME}"
BACKUP_DIR="${2:-$HOME/backups/home}"

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Directorio no válido: $SOURCE_DIR"
    exit 1
fi

mkdir -p "$BACKUP_DIR"
archive_name="home_backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"
output_path="$BACKUP_DIR/$archive_name"

tar --exclude="$BACKUP_DIR" -czf "$output_path" -C "$SOURCE_DIR" .
echo "Backup creado: $output_path"
