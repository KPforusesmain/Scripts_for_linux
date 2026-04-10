#!/bin/bash
set -euo pipefail

THRESHOLD="${1:-80}"

echo "Revisando particiones con uso mayor a ${THRESHOLD}%"
df -hP | awk -v threshold="$THRESHOLD" '
NR > 1 {
    gsub("%", "", $5)
    if ($5 > threshold) {
        print "ALERTA:", $6, "usa", $5"%"
    }
}'