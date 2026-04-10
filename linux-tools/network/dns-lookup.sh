#!/bin/bash
set -euo pipefail

DOMAIN="${1:-google.com}"

echo "Consulta DNS para: $DOMAIN"

if command -v dig >/dev/null 2>&1; then
    dig "$DOMAIN" +short
elif command -v nslookup >/dev/null 2>&1; then
    nslookup "$DOMAIN"
else
    echo "No se encontró dig ni nslookup."
    exit 1
fi