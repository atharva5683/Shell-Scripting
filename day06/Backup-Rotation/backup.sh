#!/bin/bash

<< readme

This is a script for backup with 5 day rotation

Useage:
./backup.sh <path to your source> <path to backup folder>

readme

display_usage() {
	
	echo "Useage: ./backup.sh <path to your source> <path to backup folder>"
}

source_dir=$1
backup_dir=$2
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')

create_backup(){	
	
	zip -r "$backup_dir/backup_$timestamp.zip"  "$source_dir" > /dev/null
	if [ $? -eq 0 ]; then 
		echo Backup generated successfully for $timestamp
	fi
}

perform_rotation() {
	backups=($(ls -t "$backup_dir/backup_"*.zip  2>/dev/null))
     	echo $backup[@]	
}

if [ $# -eq 0 ]; then
	display_usage

fi

create_backup
perform_rotation
