#!/bin/bash
set -euo pipefail

URL="${1:-https://google.com}"

echo "Verificando sitio: $URL"

if command -v curl >/dev/null 2>&1; then
    status=$(curl -o /dev/null -s -w "%{http_code}" "$URL")
    echo "HTTP Status: $status"
else
    echo "curl no está instalado."
    exit 1
fi