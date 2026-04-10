#!/bin/bash
set -euo pipefail

echo "IP pública:"
curl -s ifconfig.me || curl -s api.ipify.org || echo "No se pudo obtener la IP pública."
echo