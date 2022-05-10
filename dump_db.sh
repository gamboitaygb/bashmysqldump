#!/bin/bash
USER=userdb
PASSWORD='password_here'
DATABASE=db_name
BACKUP_FILEPATH=./ #path to store the dump.sql file
BACKUP_FILENAME=file_name
HOST=localhost #ip host
PORT=3306



#GETTING ALL TABLE FROM DB BAT ONLY TABLE_TYPE = BASE TABLE TO AVOID VIEWS TABLE, IF YOU WANNA EXCLUDE SOME OTHER TABLE PUT ON NOT IN CONDITION
TABLES="SELECT table_name FROM information_schema.tables WHERE TABLE_SCHEMA = '${DATABASE}' AND table_type = 'BASE TABLE' AND table_name IN ('')"

RESULT=$(mysql -u ${USER} --host=${HOST} --port=${PORT} -p${PASSWORD} ${DATABASE}<<<${TABLES})

# REPLACING table_name FROM EMPTY STRING, CUZ table_name IS THE COLUMN NAME NOT A TABLE
empty_string=""
INCLUDED_TABLES_STRING=${RESULT/table_name/$empty_string}  


DATE=$(date '+%d%m%Y_%H%M%S')
BACKUP_FILE="${BACKUP_FILENAME}-${DATE}.sql"

echo "-u ${USER} ${PASSWORD} ${DATABASE} ${INCLUDED_TABLES_STRING} --routines --single-transaction"

echo "Start Backup ..."
mysqldump -u ${USER} --host=${HOST} --port=${PORT} -p${PASSWORD} ${DATABASE} ${INCLUDED_TABLES_STRING} --routines --single-transaction > ${BACKUP_FILEPATH}${BACKUP_FILE}
zip ${BACKUP_FILEPATH}${BACKUP_FILE}.zip ${BACKUP_FILEPATH}${BACKUP_FILE}
echo "File compressed"
rm ${BACKUP_FILEPATH}${BACKUP_FILE}
echo "File deleted"
echo "Backup Completed!"
