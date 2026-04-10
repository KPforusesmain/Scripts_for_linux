#!/bin/bash
set -euo pipefail

MODE="${1:-create}"
TARGET_DIR="${2:-.}"
MANIFEST="${3:-integrity-snapshot.sha256}"
MANIFEST_DIR="$(cd "$(dirname "$MANIFEST")" 2>/dev/null && pwd || pwd)"
MANIFEST_PATH="$MANIFEST_DIR/$(basename "$MANIFEST")"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Directorio no válido: $TARGET_DIR"
    exit 1
fi

case "$MODE" in
    create)
        mkdir -p "$(dirname "$MANIFEST_PATH")"
        (
            cd "$TARGET_DIR"
            find . -type f ! -name "$(basename "$MANIFEST_PATH")" -print0 \
                | sort -z \
                | xargs -0 sha256sum
        ) > "$MANIFEST_PATH"
        echo "Snapshot creado en: $MANIFEST_PATH"
        ;;
    verify)
        if [[ ! -f "$MANIFEST_PATH" ]]; then
            echo "No existe el manifiesto: $MANIFEST_PATH"
            exit 1
        fi
        (
            cd "$TARGET_DIR"
            sha256sum -c "$MANIFEST_PATH"
        )
        ;;
    *)
        echo "Uso: $0 <create|verify> [directorio] [manifiesto]"
        exit 1
        ;;
esac
