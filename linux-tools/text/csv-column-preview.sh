#!/bin/bash
set -euo pipefail

CSV_FILE="${1:-}"
DELIMITER="${2:-,}"
ROWS="${3:-5}"

if [[ -z "$CSV_FILE" ]]; then
    echo "Uso: $0 <archivo.csv> [delimitador] [filas]"
    exit 1
fi

if [[ ! -f "$CSV_FILE" ]]; then
    echo "Archivo no válido: $CSV_FILE"
    exit 1
fi

awk -F "$DELIMITER" -v rows="$ROWS" '
NR == 1 {
    print "Columnas detectadas:"
    for (i = 1; i <= NF; i++) {
        printf "  %d) %s\n", i, $i
    }
    print ""
    print "Primeras filas:"
}
NR <= rows + 1 { print }
' "$CSV_FILE"
