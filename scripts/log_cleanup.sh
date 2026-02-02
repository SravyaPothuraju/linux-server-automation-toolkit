#!/bin/bash

CONFIG_FILE="../config/toolkit.conf"
LOG_FILE="../logs/toolkit.log"

source $CONFIG_FILE
DATE=$(date "+%Y-%m-%d %H:%M:%S")

find ../logs -type f -mtime +$LOG_RETENTION_DAYS -exec rm {} \;

echo "[$DATE] Old logs cleaned up" >> $LOG_FILE
