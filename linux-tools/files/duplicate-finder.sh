#!/bin/bash
set -euo pipefail

TARGET_DIR="${1:-.}"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Directorio no válido: $TARGET_DIR"
    exit 1
fi

echo "Buscando duplicados en: $TARGET_DIR"

tmpfile="$(mktemp)"
trap 'rm -f "$tmpfile"' EXIT

find "$TARGET_DIR" -type f -print0 2>/dev/null \
    | xargs -0 sha256sum -z 2>/dev/null \
    | sort -z > "$tmpfile"

awk -v RS='\0' '
{
    hash=$1
    sub(/^[^[:space:]]+[[:space:]]+/, "", $0)
    file=$0
    files[hash]=files[hash] "\n" file
    count[hash]++
}
END {
    for (h in count) {
        if (count[h] > 1) {
            print "HASH:", h
            print files[h]
            print "---------------------------"
        }
    }
}' "$tmpfile"
