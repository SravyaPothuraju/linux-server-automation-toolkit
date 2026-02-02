#!/bin/bash
set -euo pipefail

CONFIG_FILE="../config/toolkit.conf"
LOG_FILE="../logs/toolkit.log"

source "$CONFIG_FILE"

DATE=$(date "+%Y-%m-%d")

# Fail fast if config is broken
: "${BACKUP_DIR:?BACKUP_DIR not set}"
: "${SOURCE_DIR:?SOURCE_DIR not set}"

# Validate source directory
if [ ! -d "$SOURCE_DIR" ]; then
  echo "[$DATE] ERROR: Source directory does not exist: $SOURCE_DIR" >> "$LOG_FILE"
  exit 1
fi

mkdir -p "$BACKUP_DIR"

if tar -czf "$BACKUP_DIR/etc_backup_$DATE.tar.gz" "$SOURCE_DIR" >> "$LOG_FILE" 2>&1; then
  echo "[$DATE] Backup completed successfully" >> "$LOG_FILE"
else
  echo "[$DATE] Backup failed" >> "$LOG_FILE"
fi
