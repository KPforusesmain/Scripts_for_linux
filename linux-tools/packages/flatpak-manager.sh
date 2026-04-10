#!/bin/bash
set -euo pipefail

if ! command -v flatpak >/dev/null 2>&1; then
    echo "Flatpak no está instalado o no está disponible en PATH."
    exit 1
fi

echo "1) Listar aplicaciones instaladas"
echo "2) Buscar aplicación"
echo "3) Instalar aplicación"
echo "4) Eliminar aplicación"
echo "5) Listar remotos"
read -rp "Selecciona una opción: " opt

case "$opt" in
    1)
        flatpak list --app
        ;;
    2)
        read -rp "Texto a buscar: " query
        if [[ -z "$query" ]]; then
            echo "Debes indicar un término de búsqueda."
            exit 1
        fi
        flatpak search "$query"
        ;;
    3)
        read -rp "Application ID o ref a instalar: " ref
        if [[ -z "$ref" ]]; then
            echo "Debes indicar una aplicación para instalar."
            exit 1
        fi
        flatpak install -y flathub "$ref"
        ;;
    4)
        read -rp "Application ID a eliminar: " app_id
        if [[ -z "$app_id" ]]; then
            echo "Debes indicar una aplicación para eliminar."
            exit 1
        fi
        flatpak uninstall -y "$app_id"
        ;;
    5)
        flatpak remotes
        ;;
    *)
        echo "Opción inválida."
        exit 1
        ;;
esac
