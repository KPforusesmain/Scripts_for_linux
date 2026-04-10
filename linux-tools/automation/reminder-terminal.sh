#!/bin/bash
set -euo pipefail

MINUTES="${1:-1}"
MESSAGE="${2:-Recordatorio pendiente}"

if [[ ! "$MINUTES" =~ ^[0-9]+$ ]]; then
    echo "Uso: $0 [minutos] [mensaje]"
    exit 1
fi

echo "Recordatorio programado para $MINUTES minuto(s)."
sleep "$((MINUTES * 60))"

if command -v notify-send >/dev/null 2>&1; then
    notify-send "Recordatorio" "$MESSAGE"
fi

printf '\n=== RECORDATORIO ===\n%s\n' "$MESSAGE"
