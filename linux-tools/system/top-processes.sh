#!/bin/bash
set -euo pipefail

LIMIT="${1:-10}"

echo "Top $LIMIT procesos por uso de CPU:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n $((LIMIT + 1))

echo
echo "Top $LIMIT procesos por uso de memoria:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n $((LIMIT + 1))