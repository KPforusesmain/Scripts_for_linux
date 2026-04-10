#!/bin/bash
set -euo pipefail

LOG_FILE="${1:-}"
FILTER="${2:-}"

if [[ -z "$LOG_FILE" ]]; then
    read -rp "Archivo log a monitorear: " LOG_FILE
fi

if [[ -z "$FILTER" ]]; then
    read -rp "Filtro regex (vacío para todo): " FILTER
fi

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Archivo no válido: $LOG_FILE"
    exit 1
fi

echo "Monitoreando: $LOG_FILE"
if [[ -n "$FILTER" ]]; then
    tail -f "$LOG_FILE" | grep --line-buffered -E "$FILTER"
else
    tail -f "$LOG_FILE"
fi
