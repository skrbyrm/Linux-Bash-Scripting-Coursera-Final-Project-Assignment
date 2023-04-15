# Linux Commands and Shell Scripting - Final Project-Assignment

Estimated time needed: 90 minutes

This lab may use some bash concepts we haven’t yet covered in this course. Whenever this happens, we will provide sufficient hints and/or the code for you.

## Scenario
You are a lead linux developer at the top-tech company “ABC International INC.” ABC currently suffers from a huge bottleneck - each day, interns must painstakingly access encrypted password files on core servers, and backup those that were updated within the last 24-hours. This introduces human error, lowers security, and takes an unreasonable amount of work.

As ABC INC’s most trusted linux developer, you have been tasked with creating a script `backup.sh` which automatically backs up any of these files that have been updated within the past 24 hours.

## Objectives
The objective of this lab is to incorporate much of the shell scripting you’ve learned over this course into a single script.
You will schedule your shell script to run every 24 hours using `crontab`.

## Solution

### Create the backup directory
This step creates the backup directory if it does not already exist. You can set the backup directory to any location you like.
```
#!/bin/bash

backup_dir="/path/to/backup/directory"

# Create the backup directory if it does not already exist
```
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
fi
```

### Find the password files modified within the last 24 hours
This step uses the `find` command to locate the password files modified within the last 24 hours. You can modify the path to the password files to match your environment.

```
password_files=$(find /path/to/password/files -type f -mtime -1)
```

### Create the backup file
In this step we were used the `tar` command to create a compressed backup file of the password files modified within the last 24 hours. The backup file is named based on the current date and time. You can modify the compression format, file name, and backup directory to match your preferences.

```
# Set the name of the backup file
backup_file="backup_$(date +%Y%m%d%H%M%S).tar.gz"

# Create the backup file
tar -czf "$backup_dir/$backup_file" $password_files
```

### Make the script executable

```
chmod +x backup.sh

```
### Run the script

```
./backup.sh

```
### Schedule the script to run automatically

```crontab -e```
```
0 0 * * * /path/to/backup.sh
```
