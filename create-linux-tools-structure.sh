#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME="${1:-linux-tools}"

echo "Creando estructura del proyecto: $PROJECT_NAME"

# Crear carpeta principal
mkdir -p "$PROJECT_NAME"

# Crear subcarpetas
directories=(
  "system"
  "files"
  "network"
  "security"
  "monitoring"
  "backups"
  "dev"
  "text"
  "automation"
)

for dir in "${directories[@]}"; do
  mkdir -p "$PROJECT_NAME/$dir"
done

# Crear archivos principales
touch "$PROJECT_NAME/launcher.sh"
touch "$PROJECT_NAME/README.md"

# Lista completa de scripts
scripts=(
  "system/system-update.sh"
  "system/system-cleanup.sh"
  "system/disk-usage-report.sh"
  "system/memory-check.sh"
  "system/top-processes.sh"
  "system/service-check.sh"
  "system/startup-info.sh"

  "files/find-large-files.sh"
  "files/bulk-rename.sh"
  "files/organize-downloads.sh"
  "files/duplicate-finder.sh"
  "files/folder-size-ranking.sh"
  "files/empty-files-cleaner.sh"
  "files/compress-folder.sh"

  "network/network-info.sh"
  "network/ping-check.sh"
  "network/port-check.sh"
  "network/local-port-scan.sh"
  "network/internet-speed-test.sh"
  "network/dns-lookup.sh"
  "network/public-ip.sh"

  "security/failed-logins.sh"
  "security/ssh-log-monitor.sh"
  "security/permissions-audit.sh"
  "security/world-writable-files.sh"
  "security/suid-sgid-check.sh"
  "security/hash-checker.sh"
  "security/integrity-snapshot.sh"

  "monitoring/server-health.sh"
  "monitoring/cpu-watch.sh"
  "monitoring/log-tail-filter.sh"
  "monitoring/disk-alert.sh"
  "monitoring/website-check.sh"
  "monitoring/process-watchdog.sh"

  "backups/backup-home.sh"
  "backups/backup-project.sh"
  "backups/mysql-backup.sh"
  "backups/postgres-backup.sh"
  "backups/incremental-backup.sh"
  "backups/restore-backup.sh"
  "backups/rotate-backups.sh"

  "dev/create-project.sh"
  "dev/git-quick-status.sh"
  "dev/git-auto-commit.sh"
  "dev/venv-create.sh"
  "dev/run-python-project.sh"
  "dev/docker-clean.sh"
  "dev/env-check.sh"

  "text/count-lines.sh"
  "text/extract-emails.sh"
  "text/csv-column-preview.sh"
  "text/keyword-search.sh"
  "text/replace-text-bulk.sh"
  "text/log-summary.sh"

  "automation/daily-routine.sh"
  "automation/notes-backup.sh"
  "automation/screenshot-organizer.sh"
  "automation/reminder-terminal.sh"
  "automation/workspace-opener.sh"
  "automation/task-timer.sh"
)

# Crear scripts con plantilla base
for script in "${scripts[@]}"; do
  full_path="$PROJECT_NAME/$script"

  cat > "$full_path" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

echo "Script pendiente de implementar: $(basename "$0")"
EOF

  chmod +x "$full_path"
done

# Crear launcher básico
cat > "$PROJECT_NAME/launcher.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

pause() {
  read -rp "Presiona Enter para continuar..."
}

while true; do
  clear
  echo "=============================="
  echo "      LINUX TOOLS LAUNCHER"
  echo "=============================="
  echo "1) System"
  echo "2) Files"
  echo "3) Network"
  echo "4) Security"
  echo "5) Monitoring"
  echo "6) Backups"
  echo "7) Dev"
  echo "8) Text"
  echo "9) Automation"
  echo "0) Salir"
  echo
  read -rp "Selecciona una opción: " opt

  case "$opt" in
    1) echo "Carpeta: $BASE_DIR/system"; pause ;;
    2) echo "Carpeta: $BASE_DIR/files"; pause ;;
    3) echo "Carpeta: $BASE_DIR/network"; pause ;;
    4) echo "Carpeta: $BASE_DIR/security"; pause ;;
    5) echo "Carpeta: $BASE_DIR/monitoring"; pause ;;
    6) echo "Carpeta: $BASE_DIR/backups"; pause ;;
    7) echo "Carpeta: $BASE_DIR/dev"; pause ;;
    8) echo "Carpeta: $BASE_DIR/text"; pause ;;
    9) echo "Carpeta: $BASE_DIR/automation"; pause ;;
    0) echo "Saliendo..."; exit 0 ;;
    *) echo "Opción inválida"; pause ;;
  esac
done
EOF

chmod +x "$PROJECT_NAME/launcher.sh"

# Crear README
cat > "$PROJECT_NAME/README.md" <<EOF
# $PROJECT_NAME

Colección de herramientas Linux organizadas por categorías.

## Estructura
- system
- files
- network
- security
- monitoring
- backups
- dev
- text
- automation

## Uso

Dar permisos al generador:
\`\`\`bash
chmod +x create-linux-tools-structure.sh
\`\`\`

Ejecutar el generador:
\`\`\`bash
./create-linux-tools-structure.sh
\`\`\`

Entrar al proyecto:
\`\`\`bash
cd $PROJECT_NAME
\`\`\`

Ejecutar launcher:
\`\`\`bash
./launcher.sh
\`\`\`
EOF

echo
echo "Estructura creada correctamente en: $PROJECT_NAME"
echo "Resumen:"
find "$PROJECT_NAME" -type d | sort
echo
echo "Total de scripts creados:"
find "$PROJECT_NAME" -type f -name "*.sh" | wc -l
