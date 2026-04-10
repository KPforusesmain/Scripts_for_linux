#!/bin/bash
set -euo pipefail

SOURCE_DIR="${1:-}"
OUTPUT_NAME="${2:-}"

if [[ -z "$SOURCE_DIR" ]]; then
    echo "Uso: $0 <carpeta_origen> [nombre_salida.tar.gz]"
    exit 1
fi

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "La carpeta no existe: $SOURCE_DIR"
    exit 1
fi

if [[ -z "$OUTPUT_NAME" ]]; then
    OUTPUT_NAME="$(basename "$SOURCE_DIR")_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"
fi

tar -czf "$OUTPUT_NAME" "$SOURCE_DIR"
echo "Compresión completada: $OUTPUT_NAME"