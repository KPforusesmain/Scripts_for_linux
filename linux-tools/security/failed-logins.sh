#!/bin/bash
set -euo pipefail

LIMIT="${1:-20}"

if [[ ! "$LIMIT" =~ ^[0-9]+$ ]]; then
    echo "Uso: $0 [limite]"
    exit 1
fi

show_matches() {
    local content="$1"

    if [[ -z "$content" ]]; then
        echo "No se encontraron intentos fallidos recientes."
        return 0
    fi

    printf '%s\n' "$content"
}

if [[ -f /var/log/auth.log ]]; then
    echo "Mostrando últimos $LIMIT intentos fallidos desde /var/log/auth.log"
    show_matches "$(grep -iE "failed password|authentication failure" /var/log/auth.log | tail -n "$LIMIT" || true)"
elif [[ -f /var/log/secure ]]; then
    echo "Mostrando últimos $LIMIT intentos fallidos desde /var/log/secure"
    show_matches "$(grep -iE "failed password|authentication failure" /var/log/secure | tail -n "$LIMIT" || true)"
elif command -v journalctl >/dev/null 2>&1; then
    echo "Mostrando últimos $LIMIT eventos fallidos desde journalctl"
    show_matches "$(
        journalctl --no-pager -n 500 2>/dev/null \
            | grep -iE "failed password|authentication failure" \
            | tail -n "$LIMIT" || true
    )"
else
    echo "No se encontró una fuente de logs compatible."
    exit 1
fi
