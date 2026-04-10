#!/bin/bash
set -euo pipefail

TARGET_FILE="${1:-}"
EXPECTED_HASH="${2:-}"

if [[ -z "$TARGET_FILE" ]]; then
    echo "Uso: $0 <archivo> [hash_esperado]"
    exit 1
fi

if [[ ! -f "$TARGET_FILE" ]]; then
    echo "Archivo no válido: $TARGET_FILE"
    exit 1
fi

CURRENT_HASH="$(sha256sum "$TARGET_FILE" | awk '{print $1}')"
echo "SHA256: $CURRENT_HASH"

if [[ -n "$EXPECTED_HASH" ]]; then
    if [[ "$CURRENT_HASH" == "$EXPECTED_HASH" ]]; then
        echo "Hash verificado correctamente."
    else
        echo "Hash distinto al esperado."
        exit 1
    fi
fi
