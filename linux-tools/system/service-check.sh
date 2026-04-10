#!/bin/bash
set -euo pipefail

SERVICE_NAME="${1:-}"

if [[ -z "$SERVICE_NAME" ]]; then
    echo "Uso: $0 <nombre_del_servicio>"
    exit 1
fi

if ! command -v systemctl >/dev/null 2>&1; then
    echo "systemctl no está disponible en este sistema."
    exit 1
fi

echo "Estado del servicio: $SERVICE_NAME"
systemctl status "$SERVICE_NAME" --no-pager