#!/bin/bash
set -euo pipefail

HOST="${1:-127.0.0.1}"
PORT="${2:-80}"

echo "Revisando $HOST:$PORT"

if command -v nc >/dev/null 2>&1; then
    nc -zv "$HOST" "$PORT"
else
    timeout 3 bash -c "echo > /dev/tcp/$HOST/$PORT" \
        && echo "Puerto abierto" \
        || echo "Puerto cerrado o inaccesible"
fi