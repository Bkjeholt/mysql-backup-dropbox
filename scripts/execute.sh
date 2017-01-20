#!/bin/bash -f

echo "------------------------------------------------------------------------"
echo "-- Start execution of mysql-backup-deamon "
echo "-- Mysql server: ${MYSQL_IP_ADDR}:${MYSQL_PORT_NO} "
echo "------------------------------------------------------------------------"
ls -lR /usr/local/bin

echo "OAUTH_ACCESS_TOKEN="${DROPBOX_API_KEY} > /etc/dropbox


while [ : ]
do
    /usr/local/bin/execute-backup.sh  
    
    sleep ${MYSQL_BACKUP_INTERVALL}h
done