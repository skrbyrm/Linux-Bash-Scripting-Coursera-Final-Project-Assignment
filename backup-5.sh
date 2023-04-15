#!/bin/bash

# Set the path of the backup directory
backup_dir="/home/ubuntu/coursera/backup/pass-backup"

# Find the password files modified within the last 5 minutes
pass_files=$(find /home/ubuntu/coursera/pass-folder -type f -mmin -5)

# Set the name of the backup file
backup_file="backup_$(date +%Y%m%d%H%M%S).tar.gz"

# Create the backup file
tar -czf "$backup_dir/$backup_file" $pass_files

# Print the completion message
echo "Backup file $backup_file has been created in $backup_dir"
