#!/bin/bash
set -euo pipefail

echo "===== INFORMACIÓN DEL SISTEMA ====="
echo "Hostname: $(hostname)"
echo "Usuario: $(whoami)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo

echo "===== CPU ====="
lscpu | grep -E 'Model name|CPU\(s\)' || true
echo

echo "===== MEMORIA ====="
free -h
echo

echo "===== DISCO ====="
df -h /
echo

echo "===== RED ====="
ip -brief addr || true