#!/bin/bash

# Function to display usage instructions
display_usage() {
    echo "Usage: ./backup.sh <path to your source> <path to backup folder>"
}

# Assign the first argument as the source directory
source_dir=$1
# Assign the second argument as the backup directory
backup_dir=$2
# Generate a timestamp in the format 'YYYY-MM-DD-HH-MM-SS' for the backup filename
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')

# Function to create a backup
create_backup() { 
    # Create a zip archive of the source directory and save it to the backup directory with the timestamp
    zip -r "$backup_dir/backup_$timestamp.zip" "$source_dir" > /dev/null

    # Check if the zip command succeeded
    if [ $? -eq 0 ]; then
        echo "Backup generated successfully for $timestamp"
    else
        echo "Backup failed for $timestamp"
        exit 1
    fi
}

# Function to perform backup rotation (keep only the latest 5 backups)
perform_rotation() {
    # List backup files sorted by modification time (newest first) and store them in an array
    backups=($(ls -t "$backup_dir/backup_"*.zip 2>/dev/null))

    # Check if the number of backups exceeds 5
    if [[ ${#backups[@]} -gt 5 ]]; then
        echo "Performing rotation: Keeping the latest 5 backups"

        # Create an array of backups to remove (everything beyond the first 5)
        backup_to_remove=("${backups[@]:5}")

        # Loop through the backups to be removed and delete them
        for backup in "${backup_to_remove[@]}"; do
            rm -f "$backup"
            echo "Deleted old backup: $backup"
        done
    fi
}

# Check if the script received the required number of arguments
if [ $# -ne 2 ]; then
    display_usage
    exit 1
fi

# Execute the backup creation function
create_backup

# Execute the backup rotation function
perform_rotation
