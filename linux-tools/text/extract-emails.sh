#!/bin/bash
set -euo pipefail

TARGET="${1:-.}"
EMAIL_REGEX='[[:alnum:]._%+-]+@[[:alnum:].-]+\.[[:alpha:]]{2,}'

if [[ -f "$TARGET" ]]; then
    grep -Eo "$EMAIL_REGEX" "$TARGET" | sort -u || true
elif [[ -d "$TARGET" ]]; then
    grep -RhoE "$EMAIL_REGEX" "$TARGET" | sort -u || true
else
    echo "Ruta no válida: $TARGET"
    exit 1
fi
