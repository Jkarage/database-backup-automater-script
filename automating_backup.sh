#!/bin/bash 

# Creating a variable displaying instant time the bash was run
now=$(printf "%(%F_%H%M%S)T")
# source credentials

# Create a directory where backups are stored
mkdir -p ${BACKUP_PATH}

# Displaying the begining of the backup procedure
echo "Starting Backup for database - ${DATABASE_NAME}"

# Using the mysqldump tool to dump the database into a file
mysqldump  -u ${MYSQL_USERNAME} -p${MYSQL_PASSWD} ${DATABASE_NAME} > ${BACKUP_PATH}/${DATABASE_NAME}-${now}.sql

# Check if the procedure had an error or not
if [ $? -eq 0 ]; then
  echo "${DATABASE_NAME} backup successfully completed"
else
  echo "Errors found during backup"
  exit 1
fi
