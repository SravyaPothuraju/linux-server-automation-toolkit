# Linux Server Automation Toolkit

A Bash-based automation toolkit designed to simplify common Linux server administration tasks.  
This project focuses on automating repetitive operational activities such as system monitoring, user management, backups, and log maintenance.

** Project Overview

Managing Linux servers often involves repetitive manual tasks that are error-prone and time-consuming.  
This toolkit was created to automate those tasks using shell scripting and standard Linux utilities, following practices commonly used by system administrators and junior cloud engineers.

The project emphasizes:
- Automation over manual intervention
- Config-driven scripts
- Logging and traceability
- Scheduled execution using cron

## Features

- **System Health Monitoring**
  - CPU load monitoring
  - Disk usage checks
  - Threshold-based warnings

- **User Management Automation**
  - Create Linux users
  - Validate existing users
  - Log user management actions

- **Automated Backups**
  - Configurable source directories
  - Compressed backups
  - Timestamped backup files

- **Log Maintenance**
  - Centralized logging
  - Automated cleanup of old logs

- **Cron Scheduling**
  - Hourly, daily, and weekly task automation


## Technology Stack

- Linux
- Bash Scripting
- Cron
- Core Linux utilities (`awk`, `sed`, `df`, `uptime`, `tar`)



