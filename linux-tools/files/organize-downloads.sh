#!/bin/bash
set -euo pipefail

DOWNLOADS_DIR="${1:-$HOME/Downloads}"

if [[ ! -d "$DOWNLOADS_DIR" ]]; then
    echo "Directorio no válido: $DOWNLOADS_DIR"
    exit 1
fi

declare -A folders=(
    ["jpg"]="images" ["jpeg"]="images" ["png"]="images" ["gif"]="images" ["webp"]="images" ["svg"]="images"
    ["pdf"]="documents" ["doc"]="documents" ["docx"]="documents" ["txt"]="documents" ["odt"]="documents"
    ["xls"]="spreadsheets" ["xlsx"]="spreadsheets" ["csv"]="spreadsheets"
    ["zip"]="compressed" ["rar"]="compressed" ["7z"]="compressed" ["tar"]="compressed" ["gz"]="compressed"
    ["mp4"]="videos" ["mkv"]="videos" ["avi"]="videos" ["mov"]="videos"
    ["mp3"]="audio" ["wav"]="audio" ["flac"]="audio"
    ["sh"]="scripts" ["py"]="scripts" ["js"]="scripts" ["ts"]="scripts"
)

shopt -s nullglob

for file in "$DOWNLOADS_DIR"/*; do
    [[ -f "$file" ]] || continue

    filename="$(basename "$file")"
    extension="${filename##*.}"
    extension="$(echo "$extension" | tr '[:upper:]' '[:lower:]')"

    target_folder="${folders[$extension]:-others}"
    mkdir -p "$DOWNLOADS_DIR/$target_folder"
    mv -n "$file" "$DOWNLOADS_DIR/$target_folder/"
done

echo "Descargas organizadas en: $DOWNLOADS_DIR"