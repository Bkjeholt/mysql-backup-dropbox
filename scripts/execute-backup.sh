#!/bin/bash -f

rm -r /backup/*.t* /backup/files/*

mydumper     --verbose 3 \
             --host ${MYSQL_PORT_3306_TCP_ADDR} \
             --port ${MYSQL_PORT_3306_TCP_PORT} \
             --user root \
             --password ${MYSQL_ENV_MYSQL_ROOT_PASSWORD} \
             --database ${MYSQL_ENV_MYSQL_DATABASE} \
             --rows 100000 \
             --build-empty-files \
             --triggers \
             --events \
             --routines \
             --compress \
             --outputdir /backup/files

tar -cf /backup/mysql-backup.tar /backup/files
    
# echo "----- "
# ls -l /usr/local/bin/Dropbox-Uploader/dropbox-uploader.sh
# echo "----- "
# ls -l /usr/local/bin/Dropbox-Uploader/
# echo "----- "
# ls -l /usr/local/bin/
# echo "----- "
# echo "/usr/local/bin/Dropbox-Uploader/dropbox_uploader.sh upload /backup/mysql-backup.tgz ${DROPBOX_PATH}.tgz"
# echo "----- "
# ls -lR /backup
# echo "----- "

/usr/local/bin/Dropbox-Uploader/dropbox_uploader.sh upload /backup/mysql-backup.tar ${DROPBOX_PATH}.tar 
