#!/bin/bash
set -euo pipefail

PROJECT_NAME="${1:-}"
PROJECT_TYPE="${2:-generic}"

if [[ -z "$PROJECT_NAME" ]]; then
    echo "Uso: $0 <nombre_proyecto> [generic|python|web|cli]"
    exit 1
fi

mkdir -p "$PROJECT_NAME"

case "$PROJECT_TYPE" in
    python)
        mkdir -p "$PROJECT_NAME"/{src,tests,data,docs,output,config}
        touch "$PROJECT_NAME/README.md"
        touch "$PROJECT_NAME/requirements.txt"
        touch "$PROJECT_NAME/.gitignore"
        touch "$PROJECT_NAME/src/main.py"
        touch "$PROJECT_NAME/config/settings.yaml"
        ;;
    web)
        mkdir -p "$PROJECT_NAME"/{src,public,assets,css,js,docs}
        touch "$PROJECT_NAME/README.md"
        touch "$PROJECT_NAME/.gitignore"
        touch "$PROJECT_NAME/src/index.html"
        touch "$PROJECT_NAME/css/styles.css"
        touch "$PROJECT_NAME/js/app.js"
        ;;
    cli)
        mkdir -p "$PROJECT_NAME"/{bin,src,docs,tests}
        touch "$PROJECT_NAME/README.md"
        touch "$PROJECT_NAME/.gitignore"
        touch "$PROJECT_NAME/src/main.sh"
        chmod +x "$PROJECT_NAME/src/main.sh"
        ;;
    generic)
        mkdir -p "$PROJECT_NAME"/{src,docs,assets,config,output}
        touch "$PROJECT_NAME/README.md"
        touch "$PROJECT_NAME/.gitignore"
        ;;
    *)
        echo "Tipo de proyecto no válido: $PROJECT_TYPE"
        exit 1
        ;;
esac

echo "Proyecto creado: $PROJECT_NAME ($PROJECT_TYPE)"