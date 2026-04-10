#!/bin/bash
set -euo pipefail

HOST="${1:-8.8.8.8}"

echo "Probando conectividad con: $HOST"
ping -c 4 "$HOST"