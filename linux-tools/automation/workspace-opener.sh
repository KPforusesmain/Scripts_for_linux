#!/bin/bash
set -euo pipefail

WORKSPACE_DIR="${1:-$PWD}"

if [[ ! -d "$WORKSPACE_DIR" ]]; then
    echo "Directorio no válido: $WORKSPACE_DIR"
    exit 1
fi

echo "Workspace: $WORKSPACE_DIR"

if command -v code >/dev/null 2>&1; then
    code "$WORKSPACE_DIR"
    exit 0
fi

if command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$WORKSPACE_DIR" >/dev/null 2>&1 &
    exit 0
fi

echo "No se encontró un comando compatible para abrir el workspace."
exit 1
