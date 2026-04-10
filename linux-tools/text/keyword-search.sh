#!/bin/bash
set -euo pipefail

PATTERN="${1:-}"
TARGET="${2:-.}"

if [[ -z "$PATTERN" ]]; then
    echo "Uso: $0 <patron> [ruta]"
    exit 1
fi

if command -v rg >/dev/null 2>&1; then
    rg -n --color=never -- "$PATTERN" "$TARGET" || {
        echo "No se encontraron coincidencias."
        exit 0
    }
else
    grep -RIn -- "$PATTERN" "$TARGET" || {
        echo "No se encontraron coincidencias."
        exit 0
    }
fi
