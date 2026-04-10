#!/bin/bash
set -euo pipefail

TEST_URL="${1:-https://speed.hetzner.de/1MB.bin}"

if command -v speedtest >/dev/null 2>&1; then
    speedtest || {
        echo "La prueba con speedtest falló. Revisa tu conectividad o DNS."
        exit 1
    }
elif command -v speedtest-cli >/dev/null 2>&1; then
    speedtest-cli || {
        echo "La prueba con speedtest-cli falló. Revisa tu conectividad o DNS."
        exit 1
    }
elif command -v curl >/dev/null 2>&1; then
    echo "Prueba básica contra: $TEST_URL"
    curl -L --max-time 20 -o /dev/null -s \
        -w 'DNS: %{time_namelookup}s\nConnect: %{time_connect}s\nTTFB: %{time_starttransfer}s\nTotal: %{time_total}s\nDescarga: %{speed_download} bytes/s\n' \
        "$TEST_URL"
else
    echo "No se encontró speedtest, speedtest-cli ni curl."
    exit 1
fi
