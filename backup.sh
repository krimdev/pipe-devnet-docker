#!/bin/bash

# Create backup with current date
DATE=$(date +%Y%m%d)
BACKUP_NAME="node_info.backup-$DATE"

# Make backup and copy to host
echo "Creating backup..."
docker-compose exec -T pipe-node cp node_info.json "$BACKUP_NAME" && \
docker cp pipe-node:/opt/pop/"$BACKUP_NAME" . && \
echo "Backup created: $BACKUP_NAME"
