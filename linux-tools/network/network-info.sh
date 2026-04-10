#!/bin/bash
set -euo pipefail

echo "===== INFORMACIÓN DE RED ====="
echo "Hostname: $(hostname)"
echo

echo "Interfaces:"
ip -brief addr || ifconfig || true
echo

echo "Gateway:"
ip route | grep default || true
echo

echo "DNS:"
grep nameserver /etc/resolv.conf || true