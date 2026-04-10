#!/bin/bash
set -euo pipefail

SOURCE_DIR="${1:-$HOME/Pictures}"
DEST_DIR="${2:-$HOME/Pictures/Screenshots-Organized}"

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Directorio origen no válido: $SOURCE_DIR"
    exit 1
fi

mkdir -p "$DEST_DIR"

find "$SOURCE_DIR" -maxdepth 1 -type f \
    \( -iname 'screenshot*' -o -iname 'captura*' -o -iname 'screen_shot*' \) \
    -print0 | while IFS= read -r -d '' file; do
    folder_name="$(date -r "$file" +%Y-%m)"
    mkdir -p "$DEST_DIR/$folder_name"
    mv -n "$file" "$DEST_DIR/$folder_name/"
    echo "Movido: $file -> $DEST_DIR/$folder_name/"
done
