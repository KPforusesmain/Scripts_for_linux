#!/bin/bash
set -euo pipefail

if command -v apt >/dev/null 2>&1; then
    echo "Actualizando sistema con apt..."
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean -y
elif command -v dnf >/dev/null 2>&1; then
    echo "Actualizando sistema con dnf..."
    sudo dnf upgrade --refresh -y
    sudo dnf autoremove -y
elif command -v pacman >/dev/null 2>&1; then
    echo "Actualizando sistema con pacman..."
    sudo pacman -Syu --noconfirm
else
    echo "No se detectó un gestor de paquetes compatible."
    exit 1
fi

echo "Actualización completada."