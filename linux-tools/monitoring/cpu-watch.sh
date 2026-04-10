#!/bin/bash
set -euo pipefail

INTERVAL="${1:-2}"

echo "Monitoreando CPU cada $INTERVAL segundos. Ctrl+C para salir."
while true; do
    clear
    date
    echo
    top -bn1 | head -n 15
    sleep "$INTERVAL"
done