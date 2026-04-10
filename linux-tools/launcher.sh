#!/bin/bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

clear_screen() {
    if [[ -t 1 && -n "${TERM:-}" ]]; then
        clear
    fi
}

pause() {
    echo
    read -rp "Presiona Enter para continuar..." || true
}

prompt_input() {
    local prompt="$1"
    local __resultvar="$2"
    local input=""

    if ! read -rp "$prompt" input; then
        echo
        echo "Entrada finalizada. Saliendo..."
        exit 0
    fi

    printf -v "$__resultvar" '%s' "$input"
}

run_script() {
    local script_path="$1"
    local exit_code=0

    if [[ ! -f "$script_path" ]]; then
        echo "Script no encontrado: $script_path"
        pause
        return
    fi

    if [[ ! -x "$script_path" ]]; then
        chmod +x "$script_path"
    fi

    clear_screen
    echo "======================================"
    echo "Ejecutando: $(basename "$script_path")"
    echo "======================================"
    echo
    if bash "$script_path"; then
        echo
        echo "Script completado correctamente."
    else
        exit_code=$?
        echo
        echo "El script terminó con código: $exit_code"
    fi

    echo
    pause
}

system_menu() {
    while true; do
        clear_screen
        echo "========== SYSTEM =========="
        echo "1) Actualizar sistema"
        echo "2) Limpieza del sistema"
        echo "3) Reporte de uso de disco"
        echo "4) Revisar memoria"
        echo "5) Top procesos"
        echo "6) Revisar servicio"
        echo "7) Info de arranque"
        echo "0) Volver"
        echo
        prompt_input "Selecciona una opción: " opt

        case "$opt" in
            1) run_script "$BASE_DIR/system/system-update.sh" ;;
            2) run_script "$BASE_DIR/system/system-cleanup.sh" ;;
            3) run_script "$BASE_DIR/system/disk-usage-report.sh" ;;
            4) run_script "$BASE_DIR/system/memory-check.sh" ;;
            5) run_script "$BASE_DIR/system/top-processes.sh" ;;
            6) run_script "$BASE_DIR/system/service-check.sh" ;;
            7) run_script "$BASE_DIR/system/startup-info.sh" ;;
            0) break ;;
            *) echo "Opción inválida"; pause ;;
        esac
    done
}

files_menu() {
    while true; do
        clear_screen
        echo "========== FILES =========="
        echo "1) Buscar archivos grandes"
        echo "2) Renombrado masivo"
        echo "3) Organizar descargas"
        echo "4) Buscar duplicados"
        echo "5) Ranking de carpetas por tamaño"
        echo "6) Limpiar archivos vacíos"
        echo "7) Comprimir carpeta"
        echo "0) Volver"
        echo
        prompt_input "Selecciona una opción: " opt

        case "$opt" in
            1) run_script "$BASE_DIR/files/find-large-files.sh" ;;
            2) run_script "$BASE_DIR/files/bulk-rename.sh" ;;
            3) run_script "$BASE_DIR/files/organize-downloads.sh" ;;
            4) run_script "$BASE_DIR/files/duplicate-finder.sh" ;;
            5) run_script "$BASE_DIR/files/folder-size-ranking.sh" ;;
            6) run_script "$BASE_DIR/files/empty-files-cleaner.sh" ;;
            7) run_script "$BASE_DIR/files/compress-folder.sh" ;;
            0) break ;;
            *) echo "Opción inválida"; pause ;;
        esac
    done
}

network_menu() {
    while true; do
        clear_screen
        echo "========== NETWORK =========="
        echo "1) Información de red"
        echo "2) Ping a host"
        echo "3) Revisar puerto"
        echo "4) Escaneo de puertos locales"
        echo "5) DNS lookup"
        echo "6) IP pública"
        echo "7) Test básico de velocidad"
        echo "0) Volver"
        echo
        prompt_input "Selecciona una opción: " opt

        case "$opt" in
            1) run_script "$BASE_DIR/network/network-info.sh" ;;
            2) run_script "$BASE_DIR/network/ping-check.sh" ;;
            3) run_script "$BASE_DIR/network/port-check.sh" ;;
            4) run_script "$BASE_DIR/network/local-port-scan.sh" ;;
            5) run_script "$BASE_DIR/network/dns-lookup.sh" ;;
            6) run_script "$BASE_DIR/network/public-ip.sh" ;;
            7) run_script "$BASE_DIR/network/internet-speed-test.sh" ;;
            0) break ;;
            *) echo "Opción inválida"; pause ;;
        esac
    done
}

monitoring_menu() {
    while true; do
        clear_screen
        echo "========== MONITORING =========="
        echo "1) Salud del servidor"
        echo "2) Vigilar CPU"
        echo "3) Alerta de disco"
        echo "4) Verificar sitio web"
        echo "5) Tail de logs con filtro"
        echo "6) Watchdog de proceso"
        echo "0) Volver"
        echo
        prompt_input "Selecciona una opción: " opt

        case "$opt" in
            1) run_script "$BASE_DIR/monitoring/server-health.sh" ;;
            2) run_script "$BASE_DIR/monitoring/cpu-watch.sh" ;;
            3) run_script "$BASE_DIR/monitoring/disk-alert.sh" ;;
            4) run_script "$BASE_DIR/monitoring/website-check.sh" ;;
            5) run_script "$BASE_DIR/monitoring/log-tail-filter.sh" ;;
            6) run_script "$BASE_DIR/monitoring/process-watchdog.sh" ;;
            0) break ;;
            *) echo "Opción inválida"; pause ;;
        esac
    done
}

security_menu() {
    while true; do
        clear_screen
        echo "========== SECURITY =========="
        echo "1) Intentos fallidos de login"
        echo "2) Monitor de logs SSH"
        echo "3) Auditoría de permisos"
        echo "4) Archivos world-writable"
        echo "5) Revisión SUID/SGID"
        echo "6) Verificador de hash"
        echo "7) Snapshot de integridad"
        echo "0) Volver"
        echo
        prompt_input "Selecciona una opción: " opt

        case "$opt" in
            1) run_script "$BASE_DIR/security/failed-logins.sh" ;;
            2) run_script "$BASE_DIR/security/ssh-log-monitor.sh" ;;
            3) run_script "$BASE_DIR/security/permissions-audit.sh" ;;
            4) run_script "$BASE_DIR/security/world-writable-files.sh" ;;
            5) run_script "$BASE_DIR/security/suid-sgid-check.sh" ;;
            6) run_script "$BASE_DIR/security/hash-checker.sh" ;;
            7) run_script "$BASE_DIR/security/integrity-snapshot.sh" ;;
            0) break ;;
            *) echo "Opción inválida"; pause ;;
        esac
    done
}

backups_menu() {
    while true; do
        clear_screen
        echo "========== BACKUPS =========="
        echo "1) Backup Home"
        echo "2) Backup Proyecto"
        echo "3) Backup incremental"
        echo "4) Rotar backups"
        echo "5) Backup MySQL"
        echo "6) Backup PostgreSQL"
        echo "7) Restaurar backup"
        echo "0) Volver"
        echo
        prompt_input "Selecciona una opción: " opt

        case "$opt" in
            1) run_script "$BASE_DIR/backups/backup-home.sh" ;;
            2) run_script "$BASE_DIR/backups/backup-project.sh" ;;
            3) run_script "$BASE_DIR/backups/incremental-backup.sh" ;;
            4) run_script "$BASE_DIR/backups/rotate-backups.sh" ;;
            5) run_script "$BASE_DIR/backups/mysql-backup.sh" ;;
            6) run_script "$BASE_DIR/backups/postgres-backup.sh" ;;
            7) run_script "$BASE_DIR/backups/restore-backup.sh" ;;
            0) break ;;
            *) echo "Opción inválida"; pause ;;
        esac
    done
}

dev_menu() {
    while true; do
        clear_screen
        echo "========== DEV =========="
        echo "1) Crear estructura de proyecto"
        echo "0) Volver"
        echo
        prompt_input "Selecciona una opción: " opt

        case "$opt" in
            1) run_script "$BASE_DIR/dev/create-project-structure.sh" ;;
            0) break ;;
            *) echo "Opción inválida"; pause ;;
        esac
    done
}

text_menu() {
    while true; do
        clear_screen
        echo "========== TEXT =========="
        echo "1) Contar líneas"
        echo "2) Extraer emails"
        echo "3) Vista previa de columnas CSV"
        echo "4) Buscar palabras clave"
        echo "5) Reemplazo masivo de texto"
        echo "6) Resumen de logs"
        echo "0) Volver"
        echo
        prompt_input "Selecciona una opción: " opt

        case "$opt" in
            1) run_script "$BASE_DIR/text/count-lines.sh" ;;
            2) run_script "$BASE_DIR/text/extract-emails.sh" ;;
            3) run_script "$BASE_DIR/text/csv-column-preview.sh" ;;
            4) run_script "$BASE_DIR/text/keyword-search.sh" ;;
            5) run_script "$BASE_DIR/text/replace-text-bulk.sh" ;;
            6) run_script "$BASE_DIR/text/log-summary.sh" ;;
            0) break ;;
            *) echo "Opción inválida"; pause ;;
        esac
    done
}

automation_menu() {
    while true; do
        clear_screen
        echo "========== AUTOMATION =========="
        echo "1) Rutina diaria"
        echo "2) Backup de notas"
        echo "3) Recordatorio en terminal"
        echo "4) Organizador de screenshots"
        echo "5) Temporizador de tareas"
        echo "6) Abrir workspace"
        echo "0) Volver"
        echo
        prompt_input "Selecciona una opción: " opt

        case "$opt" in
            1) run_script "$BASE_DIR/automation/daily-routine.sh" ;;
            2) run_script "$BASE_DIR/automation/notes-backup.sh" ;;
            3) run_script "$BASE_DIR/automation/reminder-terminal.sh" ;;
            4) run_script "$BASE_DIR/automation/screenshot-organizer.sh" ;;
            5) run_script "$BASE_DIR/automation/task-timer.sh" ;;
            6) run_script "$BASE_DIR/automation/workspace-opener.sh" ;;
            0) break ;;
            *) echo "Opción inválida"; pause ;;
        esac
    done
}

packages_menu() {
    while true; do
        clear_screen
        echo "========== PACKAGES =========="
        echo "1) Eliminar aplicación"
        echo "2) Administrador de paquetes"
        echo "3) Administrador de Flatpak"
        echo "4) Administrador de extensiones VS Code"
        echo "0) Volver"
        echo
        prompt_input "Selecciona una opción: " opt

        case "$opt" in
            1) run_script "$BASE_DIR/packages/app-remove.sh" ;;
            2) run_script "$BASE_DIR/packages/package-manager.sh" ;;
            3) run_script "$BASE_DIR/packages/flatpak-manager.sh" ;;
            4) run_script "$BASE_DIR/packages/extension-manager.sh" ;;
            0) break ;;
            *) echo "Opción inválida"; pause ;;
        esac
    done
}

main_menu() {
    while true; do
        clear_screen
        echo "======================================"
        echo "         LINUX TOOLS LAUNCHER         "
        echo "======================================"
        echo "1) System"
        echo "2) Files"
        echo "3) Network"
        echo "4) Security"
        echo "5) Monitoring"
        echo "6) Backups"
        echo "7) Dev"
        echo "8) Text"
        echo "9) Automation"
        echo "10) Packages"
        echo "0) Salir"
        echo
        prompt_input "Selecciona una categoría: " opt

        case "$opt" in
            1) system_menu ;;
            2) files_menu ;;
            3) network_menu ;;
            4) security_menu ;;
            5) monitoring_menu ;;
            6) backups_menu ;;
            7) dev_menu ;;
            8) text_menu ;;
            9) automation_menu ;;
            10) packages_menu ;;
            0) clear_screen; echo "Saliendo..."; exit 0 ;;
            *) echo "Opción inválida"; pause ;;
        esac
    done
}

main_menu
