#!/bin/bash
set -euo pipefail

LOG_FILE="${1:-}"

if [[ -z "$LOG_FILE" ]]; then
    echo "Uso: $0 <archivo.log>"
    exit 1
fi

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Archivo no válido: $LOG_FILE"
    exit 1
fi

echo "Resumen de: $LOG_FILE"
echo "Total de líneas: $(wc -l < "$LOG_FILE")"
echo "ERROR: $(grep -ic 'error' "$LOG_FILE" || true)"
echo "WARN: $(grep -ic 'warn' "$LOG_FILE" || true)"
echo "INFO: $(grep -ic 'info' "$LOG_FILE" || true)"
echo
echo "Últimas líneas relevantes:"
grep -iE 'error|warn|info|fatal' "$LOG_FILE" | tail -n 10 || true
