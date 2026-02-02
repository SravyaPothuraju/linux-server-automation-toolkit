#!/bin/bash
set -euo pipefail

CONFIG_FILE="../config/toolkit.conf"
LOG_FILE="../logs/toolkit.log"

source "$CONFIG_FILE"

DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Defensive checks
: "${CPU_LOAD_THRESHOLD:?CPU_LOAD_THRESHOLD not set}"
: "${DISK_USAGE_THRESHOLD:?DISK_USAGE_THRESHOLD not set}"

# CPU load (1-minute average)
CPU_LOAD=$(awk '{print $1}' /proc/loadavg)

# Disk usage (root filesystem)
DISK_USAGE=$(df -P / | awk 'NR==2 {gsub("%",""); print $5}')

{
  echo "[$DATE] System Health Check"
  echo "CPU Load: $CPU_LOAD"
  echo "Disk Usage: $DISK_USAGE%"
} >> "$LOG_FILE"

# Floating point comparison
if echo "$CPU_LOAD > $CPU_LOAD_THRESHOLD" | bc -l | grep -q 1; then
  echo "WARNING: High CPU load" >> "$LOG_FILE"
fi

# Integer comparison
if [ "$DISK_USAGE" -gt "$DISK_USAGE_THRESHOLD" ]; then
  echo "WARNING: Disk usage exceeded threshold" >> "$LOG_FILE"
fi

echo "-----------------------------" >> "$LOG_FILE"
