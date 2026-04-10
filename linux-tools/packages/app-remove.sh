#!/bin/bash
set -euo pipefail

APP_NAME="${1:-}"

if [[ -z "$APP_NAME" ]]; then
    read -rp "Nombre del paquete a eliminar: " APP_NAME
fi

if [[ -z "$APP_NAME" ]]; then
    echo "Debes indicar un paquete."
    exit 1
fi

echo "Se intentará eliminar: $APP_NAME"
read -rp "¿Continuar? (s/n): " confirm

if [[ ! "$confirm" =~ ^[sS]$ ]]; then
    echo "Operación cancelada."
    exit 0
fi

if command -v apt >/dev/null 2>&1; then
    if dpkg -s "$APP_NAME" >/dev/null 2>&1; then
        echo "Paquete detectado en dpkg."
    else
        echo "No se encontró el paquete en dpkg: $APP_NAME"
        exit 1
    fi
    sudo apt remove --purge -y "$APP_NAME"
    sudo apt autoremove -y
elif command -v dnf >/dev/null 2>&1; then
    dnf list installed "$APP_NAME" >/dev/null 2>&1 || {
        echo "No se encontró el paquete instalado: $APP_NAME"
        exit 1
    }
    sudo dnf remove -y "$APP_NAME"
elif command -v pacman >/dev/null 2>&1; then
    pacman -Q "$APP_NAME" >/dev/null 2>&1 || {
        echo "No se encontró el paquete instalado: $APP_NAME"
        exit 1
    }
    sudo pacman -Rns --noconfirm "$APP_NAME"
else
    echo "No se detectó un gestor de paquetes compatible."
    exit 1
fi

echo "Proceso finalizado."
