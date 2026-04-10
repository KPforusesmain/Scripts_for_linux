
# Linux Tools

[![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Linux](https://img.shields.io/badge/OS-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://www.linux.org/)
[![Version](https://img.shields.io/badge/version-1.0.0-blue?style=for-the-badge)]()

> Colección de scripts Bash para tareas frecuentes de administración, monitoreo, automatización, redes, texto, seguridad y mantenimiento en Linux.

---

## Tabla de Contenidos

1. [Descripción General](#descripcion-general)
2. [Estado del Proyecto](#estado-del-proyecto)
3. [Estructura por Categorías](#estructura-por-categorias)
4. [Scripts Disponibles](#scripts-disponibles)
5. [Requisitos del Sistema](#requisitos-del-sistema)
6. [Instalación y Configuración](#instalacion-y-configuracion)
7. [Guía de Uso](#guia-de-uso)
8. [Uso del Launcher](#uso-del-launcher)
9. [Ejemplos Prácticos](#ejemplos-practicos)
10. [Seguridad y Buenas Prácticas](#seguridad-y-buenas-practicas)
11. [Roadmap](#roadmap)
12. [Contribuciones](#contribuciones)
13. [Nota Final](#nota-final)

---

## Descripción General

Linux Tools es una colección organizada de scripts Bash diseñados para dos formas de uso:

| Método | Descripción |
|--------|-------------|
| **Launcher Interactivo** | `launcher.sh` - Menú persistente con categorías y submenús |
| **Ejecución Directa** | Scripts individuales - Para usuarios que ya conocen la herramienta necesaria |

El proyecto cubre áreas como administración del sistema, procesamiento de archivos, monitoreo de red, auditoría de seguridad, backups, desarrollo, automatización y gestión de paquetes.

---

## Estado del Proyecto

### Funcionalidades Actuales

```
[✓] Menú interactivo persistente con categorías y submenús
[✓] Organización por dominios: system, files, network, security, monitoring, backups, dev, text, automation, packages
[✓] Scripts implementados para:

    +------------------+--------------------------------------------------+
    | Categoría        | Scripts disponibles                              |
    +------------------+--------------------------------------------------+
    | Monitoreo básico | health checks, resource usage, disk alerts       |
    | Backups locales  | project backup, incremental, rotation, restore   |
    | Utilidades red   | network info, speed test, port scanning          |
    | Procesamiento txt | search & replace, line counting, keyword search  |
    | Auditoría seg.   | integrity checks, hash validation                 |
    | Automatización   | screenshot organizer, reminders, timers          |
    | Gestión paquetes  | system packages, flatpak, VS Code extensions     |
    +------------------+--------------------------------------------------+
```

### Funcionalidades Futuras

```
[-] Más validaciones previas antes de operaciones sensibles
[-] Modo no interactivo uniforme para todos los scripts
[-] Logging mejorado y reportes exportables
[-] Tests automáticos para validar comportamiento
[-] Integraciones opcionales con herramientas del sistema
[-] Documentación por script con ejemplos concretos
```

---

## Estructura por Categorías

```
linux-tools/
│
├── launcher.sh                 # Punto de entrada interactivo
├── create-linux-tools-structure.sh  # Generador de estructura
│
├── system/                     # Mantenimiento general del sistema
│   ├── system-update.sh
│   ├── disk-cleanup.sh
│   ├── memory-monitor.sh
│   └── service-manager.sh
│
├── files/                      # Operaciones sobre archivos y carpetas
│   ├── duplicate-finder.sh
│   ├── bulk-rename.sh
│   ├── compress-folder.sh
│   └── size-ranking.sh
│
├── network/                    # Diagnóstico de conectividad y red
│   ├── network-info.sh
│   ├── port-scanner.sh
│   ├── dns-lookup.sh
│   └── internet-speed-test.sh
│
├── security/                   # Auditorías y revisiones rápidas
│   ├── integrity-snapshot.sh
│   ├── hash-checker.sh
│   ├── failed-logins.sh
│   └── world-writable-finder.sh
│
├── monitoring/                 # Observación continua o puntual
│   ├── server-health.sh
│   ├── disk-alerts.sh
│   ├── watchdog.sh
│   └── log-monitor.sh
│
├── backups/                    # Respaldo y restauración
│   ├── backup-project.sh
│   ├── backup-home.sh
│   ├── incremental-backup.sh
│   ├── rotate-backups.sh
│   └── restore-backup.sh
│
├── dev/                        # Soporte al trabajo de desarrollo
│   ├── project-structure.sh
│   ├── git-helper.sh
│   ├── venv-manager.sh
│   └── dev-utils.sh
│
├── text/                       # Procesamiento de texto y logs
│   ├── count-lines.sh
│   ├── keyword-search.sh
│   ├── extract-emails.sh
│   ├── csv-processor.sh
│   └── replace-text-bulk.sh
│
├── automation/                 # Tareas repetitivas del escritorio
│   ├── reminder.sh
│   ├── timer.sh
│   ├── backup-notes.sh
│   └── screenshot-organizer.sh
│
└── packages/                   # Gestión de software instalado
    ├── package-manager.sh
    ├── flatpak-manager.sh
    └── vscode-extensions.sh
```

### Tabla de Categorías

| Categoría | Propósito | Scripts Actuales |
|-----------|-----------|------------------|
| `system` | Mantenimiento general del sistema | actualización, limpieza, uso de disco, memoria, servicios |
| `files` | Operaciones sobre archivos y carpetas | duplicados, renombrado masivo, compresión, ranking por tamaño |
| `network` | Diagnóstico de conectividad y red | ping, puertos, DNS, IP pública, speed test básico |
| `security` | Auditorías y revisiones rápidas | hashes, intentos fallidos, world-writable, SUID/SGID |
| `monitoring` | Observación continua o puntual | salud del servidor, alertas de disco, watchdog, logs |
| `backups` | Respaldo y restauración | home, proyecto, incremental, rotación, restore |
| `dev` | Soporte al trabajo de desarrollo | estructuras de proyecto, git, entornos, utilidades varias |
| `text` | Procesamiento de texto y logs | conteo de líneas, emails, CSV, búsqueda, reemplazos |
| `automation` | Tareas repetitivas del escritorio | recordatorios, temporizador, backup de notas, screenshots |
| `packages` | Gestión de software instalado | paquetes del sistema, Flatpak, extensiones VS Code |

---

## Scripts Disponibles

### Núcleo del Proyecto

| Script | Descripción |
|--------|-------------|
| `linux-tools/launcher.sh` | Punto de entrada interactivo con menú persistente |
| `linux-tools/create-linux-tools-structure.sh` | Generador automático de estructura base del proyecto |

### Scripts Implementados

| Ubicación | Script | Función |
|-----------|--------|---------|
| `files/` | duplicate-finder.sh | Busca archivos duplicados en un directorio |
| `files/` | compress-folder.sh | Comprime carpetas con diferentes algoritmos |
| `network/` | network-info.sh | Muestra información detallada de red |
| `network/` | internet-speed-test.sh | Prueba velocidad de conexión |
| `security/` | integrity-snapshot.sh | Crea y verifica snapshots de integridad |
| `text/` | replace-text-bulk.sh | Reemplazo masivo de texto en múltiples archivos |
| `automation/` | screenshot-organizer.sh | Organiza capturas de pantalla automáticamente |
| `backups/` | restore-backup.sh | Restaura backups desde diferentes orígenes |
| `packages/` | package-manager.sh | Gestión unificada de paquetes del sistema |

---

## Requisitos del Sistema

### Base (Obligatorio)

```
+------------------+--------------------------------------------------+
| Requisito        | Detalle                                          |
+------------------+--------------------------------------------------+
| Sistema          | Linux (cualquier distribución)                   |
| Shell            | Bash 4.0+                                        |
| Utilidades base  | find, grep, awk, tar, sed, ps, df, free         |
+------------------+--------------------------------------------------+
```

### Dependencias Opcionales

Algunos scripts mejoran su comportamiento si estas herramientas están instaladas:

| Herramienta | Scripts que la utilizan | Instalación (Ubuntu/Debian) |
|-------------|------------------------|-----------------------------|
| `rg` (ripgrep) | text/keyword-search.sh | `sudo apt install ripgrep` |
| `rsync` | backups/*, files/* | `sudo apt install rsync` |
| `curl` | network/*, monitoring/* | `sudo apt install curl` |
| `dig`/`nslookup` | network/dns-lookup.sh | `sudo apt install dnsutils` |
| `nc` (netcat) | network/port-scanner.sh | `sudo apt install netcat` |
| `flatpak` | packages/flatpak-manager.sh | `sudo apt install flatpak` |
| `code` | packages/vscode-extensions.sh | Descargar de VS Code |
| `journalctl` | monitoring/log-monitor.sh | Nativo (systemd) |
| `notify-send` | automation/* | `sudo apt install libnotify-bin` |

---

## Instalación y Configuración

### Paso 1: Acceder al proyecto

```bash
cd /home/kdell/Escritorio/SCRIPTS/linux-tools
```

### Paso 2: Dar permisos de ejecución

```bash
# Permiso para el launcher principal
chmod +x launcher.sh

# Permiso para todos los scripts .sh
find . -type f -name "*.sh" -exec chmod +x {} \;
```

### Paso 3: Verificar estructura

```bash
# Listar todas las categorías
ls -la */

# Verificar que los scripts son ejecutables
file */**.sh
```

### Opcional: Agregar al PATH

```bash
# Para ejecutar desde cualquier ubicación
export PATH="$PATH:/home/kdell/Escritorio/SCRIPTS/linux-tools"

# O crear un alias
alias lt='/home/kdell/Escritorio/SCRIPTS/linux-tools/launcher.sh'
```

---

## Guía de Uso

### Modo 1: Launcher Interactivo (Recomendado)

```bash
./launcher.sh
```

### Modo 2: Ejecución Directa

```bash
# Scripts de texto
./text/count-lines.sh /ruta/a/archivo.txt

# Scripts de archivos
./files/compress-folder.sh /ruta/a/carpeta

# Scripts de seguridad
./security/hash-checker.sh /ruta/a/archivo
```

### Modo 3: Con parámetros

```bash
# Con parámetros específicos
./files/duplicate-finder.sh ~/Descargas --delete

# Modo verbose
./monitoring/server-health.sh --verbose

# Modo seco (solo vista previa)
./text/replace-text-bulk.sh "viejo" "nuevo" . --dry-run
```

---

## Uso del Launcher

### Comportamiento del Menú Principal

```
+------------------------------------------------------------------+
|                     LINUX TOOLS - LAUNCHER                        |
+------------------------------------------------------------------+
|                                                                  |
|  1) System Tools        6) Backups                               |
|  2) File Tools          7) Development Tools                     |
|  3) Network Tools       8) Text Processing                       |
|  4) Security Tools      9) Automation Tools                      |
|  5) Monitoring Tools    10) Package Management                   |
|                                                                  |
|  0) Exit                                                        |
|                                                                  |
+------------------------------------------------------------------+
|  Seleccione una opción: _                                        |
+------------------------------------------------------------------+
```

### Reglas de Funcionamiento

| Situación | Comportamiento |
|-----------|----------------|
| Script falla | El launcher NO se cierra, muestra error y vuelve al menú |
| Script termina correctamente | Retorna al menú principal |
| Usuario presiona `0` | Sale del launcher |
| Entrada termina por EOF | Cierra de forma controlada |
| Opción inválida | Muestra mensaje y solicita nueva entrada |

### Navegación

```bash
# Desde el menú principal
1   # Entra a System Tools
2   # Entra a File Tools
0   # Sale

# Dentro de un submenú
1   # Ejecuta el primer script
b   # Vuelve al menú principal
0   # Sale del launcher
```


---

## Seguridad y Buenas Prácticas

### Antes de Usar

```
+------------------------------------------------------------------+
|                    LISTA DE VERIFICACIÓN                         |
+------------------------------------------------------------------+
| [ ] Revisar cada script antes de usarlo en entornos sensibles   |
| [ ] Identificar comandos con sudo, borrado o cambios de paquetes |
| [ ] Verificar que las rutas de origen/destino sean correctas    |
| [ ] Asegurar que las herramientas cliente están instaladas      |
+------------------------------------------------------------------+
```

### Durante el Uso

| Acción | Recomendación |
|--------|---------------|
| Scripts de reemplazo | Usar `--dry-run` primero |
| Compresión/rotación | Probar en carpetas temporales |
| Backups/restauraciones | Verificar rutas antes de ejecutar |
| Scripts de base de datos | Confirmar credenciales configuradas |
| Scripts con `sudo` | Entender qué comandos se ejecutan |

### Post-Ejecución

```
+------------------------------------------------------------------+
| [✓] Verificar logs de operación (si están habilitados)          |
| [✓] Validar integridad de backups creados                       |
| [✓] Confirmar que los cambios fueron los esperados              |
| [✓] Mantener backups antes de operaciones destructivas          |
+------------------------------------------------------------------+
```

---

## Roadmap

### Corto Plazo (Q2 2026)

```
[-] Mejorar ayuda integrada por script (--help)
[-] Estandarizar parámetros y mensajes de error
[-] Añadir más ejemplos en la documentación
[-] Implementar --quiet para modo silencioso
```

### Mediano Plazo (Q3 2026)

```
[-] Añadir pruebas automáticas para scripts clave
[-] Crear reportes más legibles (formato JSON/CSV)
[-] Incorporar más opciones interactivas dentro del launcher
[-] Agregar logging rotativo para todas las operaciones
```

### Largo Plazo (2027)

```
[-] Modo de configuración central (archivo .ltrc)
[-] Perfiles por entorno (desarrollo/producción)
[-] Exportación de resultados a archivos de reporte
[-] Integración con herramientas de orquestación
```

---

## Contribuciones

### Áreas de Enfoque

Si quieres mejorar el proyecto, estas son las áreas prioritarias:

```
+------------------------------------------------------------------+
| PRIORIDAD | ÁREA                    | DESCRIPCIÓN                |
+-----------+-------------------------+----------------------------+
| Alta      | Validaciones            | Endurecer checks previos   |
| Alta      | Documentación           | Añadir ejemplos de uso     |
| Media     | Interfaz homogénea      | Uniformizar mensajes       |
| Media     | Tests                   | Añadir para scripts críticos|
| Baja      | Dependencias            | Documentar casos límite    |
+-----------+-------------------------+----------------------------+
```

### Cómo Contribuir

```bash
# 1. Fork del repositorio
# 2. Crear una rama para tu contribución
git checkout -b feature/nueva-herramienta

# 3. Hacer cambios y commit
git commit -m "Agregar script para monitoreo de temperatura"

# 4. Push y crear Pull Request
git push origin feature/nueva-herramienta
```

### Estándares de Código

```
+------------------------------------------------------------------+
| Regla                          | Aplicación                     |
+-------------------------------+--------------------------------+
| Shebang                        | #!/usr/bin/env bash           |
| Exit codes                     | 0=éxito, 1=error general,     |
|                                | 2=parámetros inválidos         |
| Verbose mode                   | Soportar --verbose             |
| Dry-run                        | Soportar --dry-run cuando aplique|
| Help                           | Soportar --help                |
+-------------------------------+--------------------------------+
```

---

## Nota Final

Este proyecto está orientado a **productividad personal y administración práctica**.

Algunas utilidades son deliberadamente simples para:

```
[✓] Mantenerlas legibles y educativas
[✓] Fáciles de adaptar a necesidades específicas
[✓] Rápidas de ejecutar sin dependencias pesadas
[✓] Modificables por el usuario final
```



<div align="center">
  <hr width="80%">
  <p><b>Linux Tools</b> | Colección de scripts Bash para administración y automatización</p>
  <p>Versión 1.0.0 | Actualizado: Marzo 2026</p>
  <hr width="80%">
</div>


