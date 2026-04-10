#!/bin/bash
set -euo pipefail

TARGET_DIR="${1:-.}"
PREFIX="${2:-file}"
START_NUM="${3:-1}"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Directorio no válido: $TARGET_DIR"
    exit 1
fi

counter="$START_NUM"

for file in "$TARGET_DIR"/*; do
    [[ -f "$file" ]] || continue

    extension="${file##*.}"
    new_name=$(printf "%s/%s_%03d.%s" "$TARGET_DIR" "$PREFIX" "$counter" "$extension")

    mv -n "$file" "$new_name"
    echo "Renombrado: $(basename "$file") -> $(basename "$new_name")"

    counter=$((counter + 1))
done