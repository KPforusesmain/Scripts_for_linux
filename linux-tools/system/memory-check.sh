#!/bin/bash
set -euo pipefail

echo "===== MEMORIA ====="
free -h
echo
echo "===== SWAP ====="
swapon --show || true
echo
echo "===== TOP PROCESOS POR MEMORIA ====="
ps aux --sort=-%mem | head -n 10