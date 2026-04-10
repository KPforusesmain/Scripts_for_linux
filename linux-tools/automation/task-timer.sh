#!/bin/bash
set -euo pipefail

MINUTES="${1:-25}"
LABEL="${2:-Sesión de trabajo}"

if [[ ! "$MINUTES" =~ ^[0-9]+$ ]]; then
    echo "Uso: $0 [minutos] [etiqueta]"
    exit 1
fi

SECONDS_LEFT="$((MINUTES * 60))"
echo "Iniciando temporizador: $LABEL ($MINUTES min)"

while (( SECONDS_LEFT > 0 )); do
    printf '\rTiempo restante: %02d:%02d' "$((SECONDS_LEFT / 60))" "$((SECONDS_LEFT % 60))"
    sleep 1
    ((SECONDS_LEFT--))
done

printf '\nTiempo completado: %s\n' "$LABEL"

if command -v notify-send >/dev/null 2>&1; then
    notify-send "Temporizador finalizado" "$LABEL"
fi
