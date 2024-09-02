#!/bin/bash

BACKUP_DIR="/backup"
TIMESTAMP=$(date +"%F")
BACKUP_FILE="$BACKUP_DIR/backup-$TIMESTAMP.tar.gz"

SPRINGBOOT_PROJECT_DIR="/home/user/myapp"
NGINX_CONFIG_DIR="/home/user/nginx"

SOURCE_DIRS=("$SPRINGBOOT_PROJECT_DIR" "$NGINX_CONFIG_DIR")

mkdir -p $BACKUP_DIR

tar -czf $BACKUP_FILE ${SOURCE_DIRS[@]}

echo "Backup created at $BACKUP_FILE"
