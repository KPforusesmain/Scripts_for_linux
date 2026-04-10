#!/bin/bash
set -euo pipefail

detect_pm() {
    if command -v apt >/dev/null 2>&1; then
        echo "apt"
    elif command -v dnf >/dev/null 2>&1; then
        echo "dnf"
    elif command -v pacman >/dev/null 2>&1; then
        echo "pacman"
    else
        echo ""
    fi
}

PM="$(detect_pm)"

if [[ -z "$PM" ]]; then
    echo "No se detectó gestor de paquetes compatible."
    exit 1
fi

echo "Gestor detectado: $PM"
echo "1) Buscar paquete"
echo "2) Instalar paquete"
echo "3) Eliminar paquete"
echo "4) Actualizar sistema"
echo "5) Listar paquetes instalados relacionados"
read -rp "Selecciona una opción: " opt

case "$PM:$opt" in
    apt:1)
        read -rp "Paquete a buscar: " pkg
        apt search "$pkg"
        ;;
    apt:2)
        read -rp "Paquete a instalar: " pkg
        sudo apt install -y "$pkg"
        ;;
    apt:3)
        read -rp "Paquete a eliminar: " pkg
        sudo apt remove --purge -y "$pkg"
        ;;
    apt:4)
        sudo apt update && sudo apt upgrade -y
        ;;
    apt:5)
        read -rp "Texto a filtrar: " pkg
        dpkg -l | grep -i -- "$pkg" || echo "Sin coincidencias."
        ;;
    dnf:1)
        read -rp "Paquete a buscar: " pkg
        dnf search "$pkg"
        ;;
    dnf:2)
        read -rp "Paquete a instalar: " pkg
        sudo dnf install -y "$pkg"
        ;;
    dnf:3)
        read -rp "Paquete a eliminar: " pkg
        sudo dnf remove -y "$pkg"
        ;;
    dnf:4)
        sudo dnf upgrade --refresh -y
        ;;
    dnf:5)
        read -rp "Texto a filtrar: " pkg
        dnf list installed | grep -i -- "$pkg" || echo "Sin coincidencias."
        ;;
    pacman:1)
        read -rp "Paquete a buscar: " pkg
        pacman -Ss "$pkg"
        ;;
    pacman:2)
        read -rp "Paquete a instalar: " pkg
        sudo pacman -S --noconfirm "$pkg"
        ;;
    pacman:3)
        read -rp "Paquete a eliminar: " pkg
        sudo pacman -Rns --noconfirm "$pkg"
        ;;
    pacman:4)
        sudo pacman -Syu --noconfirm
        ;;
    pacman:5)
        read -rp "Texto a filtrar: " pkg
        pacman -Q | grep -i -- "$pkg" || echo "Sin coincidencias."
        ;;
    *)
        echo "Opción inválida."
        exit 1
        ;;
esac
