#!/bin/bash
set -euo pipefail

SEARCH_TEXT="${1:-}"
REPLACE_TEXT="${2:-}"
TARGET_DIR="${3:-.}"
MODE="${4:---dry-run}"

if [[ -z "$SEARCH_TEXT" || -z "$REPLACE_TEXT" ]]; then
    echo "Uso: $0 <buscar> <reemplazar> [directorio] [--dry-run|--apply]"
    exit 1
fi

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Directorio no válido: $TARGET_DIR"
    exit 1
fi

mapfile -d '' files < <(grep -RIlZ -- "$SEARCH_TEXT" "$TARGET_DIR")

if [[ "${#files[@]}" -eq 0 ]]; then
    echo "No se encontraron coincidencias."
    exit 0
fi

printf 'Archivos afectados:\n'
printf '%s\n' "${files[@]}"

if [[ "$MODE" == "--dry-run" ]]; then
    exit 0
fi

if [[ "$MODE" != "--apply" ]]; then
    echo "Modo no válido: $MODE"
    exit 1
fi

SEARCH_TEXT="$SEARCH_TEXT" REPLACE_TEXT="$REPLACE_TEXT" perl -0pi -e '
    my $search = $ENV{SEARCH_TEXT};
    my $replace = $ENV{REPLACE_TEXT};
    s/\Q$search\E/$replace/g;
' "${files[@]}"

echo "Reemplazo completado."
