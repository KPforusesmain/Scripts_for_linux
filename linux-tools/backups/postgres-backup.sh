#!/bin/bash
set -euo pipefail

DB_NAME="${1:-}"
OUTPUT_DIR="${2:-$HOME/backups/postgres}"

if ! command -v pg_dump >/dev/null 2>&1; then
    echo "pg_dump no está instalado."
    exit 1
fi

if [[ -z "$DB_NAME" ]]; then
    read -rp "Nombre de la base de datos PostgreSQL: " DB_NAME
fi

if [[ -z "$DB_NAME" ]]; then
    echo "Debes indicar una base de datos."
    exit 1
fi

mkdir -p "$OUTPUT_DIR"
OUTPUT_FILE="$OUTPUT_DIR/${DB_NAME}_$(date +%Y-%m-%d_%H-%M-%S).sql"

pg_dump "$DB_NAME" > "$OUTPUT_FILE"
echo "Backup PostgreSQL creado: $OUTPUT_FILE"
