#!/bin/bash
set -euo pipefail

PROCESS_NAME="${1:-}"
INTERVAL="${2:-10}"
RESTART_COMMAND="${3:-}"

if [[ -z "$PROCESS_NAME" ]]; then
    read -rp "Nombre del proceso a vigilar: " PROCESS_NAME
fi

if [[ -z "$PROCESS_NAME" ]]; then
    echo "Debes indicar un proceso."
    exit 1
fi

if [[ ! "$INTERVAL" =~ ^[0-9]+$ ]]; then
    echo "El intervalo debe ser numérico."
    exit 1
fi

echo "Vigilando proceso: $PROCESS_NAME cada $INTERVAL segundo(s). Ctrl+C para salir."

while true; do
    if pgrep -f "$PROCESS_NAME" >/dev/null 2>&1; then
        echo "$(date '+%H:%M:%S') OK: $PROCESS_NAME activo"
    else
        echo "$(date '+%H:%M:%S') ALERTA: $PROCESS_NAME no está activo"
        if [[ -n "$RESTART_COMMAND" ]]; then
            echo "Intentando reinicio..."
            bash -lc "$RESTART_COMMAND" || true
        fi
    fi
    sleep "$INTERVAL"
done
