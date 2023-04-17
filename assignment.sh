#!/bin/bash

# [TASK 1]
targetDirectory="/home/ubuntu/important-documents"
destinationDirectory="/home/ubuntu/important-documents-backup"

# [TASK 2]
echo $targetDirectory
echo $destinationDirectory

# [TASK 3]
currentTS=`date +%s`

# [TASK 4]
backupFileName="backup-$currentTS.tar.gz"

# [TASK 5]
origAbsPath="/home/ubuntu/important-documents"

# [TASK 6]
cd # <-
destDirAbsPath="/home/ubuntu/important-documents-backup"

# [TASK 7]
cd # <-
cd $targetDirectory # <-

# [TASK 8]
yesterdayTS=$(($currentTS - 24 * 60 * 60))

declare -a toBackup

for file in $(ls -1) # [TASK 9]
do
  # [TASK 10]
  if ((`date -r $file +%s` > $yesterdayTS))
  then
    # [TASK 11]
    toBackup+=($file)
  fi
done

# [TASK 12]
tar -czvf "$backupFileName" ${toBackup[@]}

# [TASK 13]
mv "$backupFileName" "$destinationDirectory"

# Congratulations! You completed the final ubuntu for this course!
