#!/bin/bash
set -euo pipefail

echo "Puertos locales en escucha:"
if command -v ss >/dev/null 2>&1; then
    ss -tuln
elif command -v netstat >/dev/null 2>&1; then
    netstat -tuln
else
    echo "No se encontró ss ni netstat."
    exit 1
fi