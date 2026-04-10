#!/bin/bash
set -euo pipefail

echo "===== SALUD DEL SISTEMA ====="
echo "Fecha: $(date)"
echo "Uptime: $(uptime -p)"
echo

echo "Carga:"
uptime
echo

echo "Memoria:"
free -h
echo

echo "Disco:"
df -h
echo

echo "Top procesos CPU:"
ps -eo pid,cmd,%cpu,%mem --sort=-%cpu | head -n 10