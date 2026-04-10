#!/bin/bash
set -euo pipefail

if ! command -v code >/dev/null 2>&1; then
    echo "VS Code no está disponible en PATH."
    exit 1
fi

echo "1) Listar extensiones"
echo "2) Instalar extensión"
echo "3) Desinstalar extensión"
echo "4) Mostrar versión de VS Code"
read -rp "Selecciona una opción: " opt

case "$opt" in
    1)
        code --list-extensions
        ;;
    2)
        read -rp "ID de la extensión: " ext
        code --install-extension "$ext"
        ;;
    3)
        read -rp "ID de la extensión: " ext
        code --uninstall-extension "$ext"
        ;;
    4)
        code --version
        ;;
    *)
        echo "Opción inválida."
        exit 1
        ;;
esac
