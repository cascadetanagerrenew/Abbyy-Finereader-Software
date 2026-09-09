#!/bin/sh

BACKUP_DIR="backup_$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR"

echo "Backup Directory: $BACKUP_DIR"

for item in *.txt *.log
do
    if [ -f "$item" ]; then
        cp "$item" "$BACKUP_DIR/"
        echo "Copied: $item"
    fi
done

echo ""
echo "Backup Summary"
echo "=============="

find "$BACKUP_DIR" -type f | while read file
do
    echo "$(basename "$file")"
done

echo ""
echo "Backup completed successfully."
