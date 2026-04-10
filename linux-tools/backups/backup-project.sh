#!/bin/bash
set -euo pipefail

PROJECT_DIR="${1:-$PWD}"
BACKUP_DIR="${2:-$HOME/backups/projects}"

if [[ ! -d "$PROJECT_DIR" ]]; then
    echo "Directorio de proyecto no válido: $PROJECT_DIR"
    exit 1
fi

mkdir -p "$BACKUP_DIR"
project_name="$(basename "$PROJECT_DIR")"
output_path="$BACKUP_DIR/${project_name}_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

tar -czf "$output_path" -C "$(dirname "$PROJECT_DIR")" "$project_name"
echo "Backup del proyecto creado: $output_path"
