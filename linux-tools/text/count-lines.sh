#!/bin/bash
set -euo pipefail

TARGET="${1:-.}"

if [[ -f "$TARGET" ]]; then
    wc -l "$TARGET"
elif [[ -d "$TARGET" ]]; then
    find "$TARGET" -type f -print0 | xargs -0 -r wc -l
else
    echo "Ruta no válida: $TARGET"
    exit 1
fi
