#!/bin/bash
set -euo pipefail

if [[ -f /var/log/auth.log ]]; then
    echo "Monitoreando eventos SSH desde /var/log/auth.log"
    tail -f /var/log/auth.log | grep --line-buffered -i ssh
elif [[ -f /var/log/secure ]]; then
    echo "Monitoreando eventos SSH desde /var/log/secure"
    tail -f /var/log/secure | grep --line-buffered -i ssh
elif command -v journalctl >/dev/null 2>&1; then
    echo "Monitoreando eventos SSH con journalctl"
    journalctl -f -u ssh -u sshd
else
    echo "No se encontró una fuente de logs SSH compatible."
    exit 1
fi
