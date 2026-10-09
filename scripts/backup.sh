#!/bin/bash
set -e
BACKUP_DIR="$HOME/ict_lab2/backup"
DOCS_DIR="$HOME/ict_lab2/docs"
LOG_FILE="$HOME/ict_lab2/logs/backup.log"

if [ ! -d "$DOCS_DIR" ]; then
    echo "Error: Source directory $DOCS_DIR does not exist!" >&2
    exit 1
fi

FILENAME="docs_$(date +%Y%m%d_%H%M%S).tar.gz"
tar -czf "$BACKUP_DIR/$FILENAME" -C "$(dirname "$DOCS_DIR")" "$(basename "$DOCS_DIR")"
echo "[$(date)] Backup created: $FILENAME" >> "$LOG_FILE"

# Удаление архивов старше 7 дней
find "$BACKUP_DIR" -name "docs_*.tar.gz" -mtime +7 -delete
bad command without quotes
