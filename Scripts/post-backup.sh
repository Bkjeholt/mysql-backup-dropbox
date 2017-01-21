#!/bin/bash -f

echo "------------------------------------------------------------------------"
echo "-- Upload the backup to dropbox "
echo "------------------------------------------------------------------------"

/usr/local/bin/Dropbox-Uploader/dropbox_uploader.sh upload /backup/mysql-backup.tar ${DROPBOX_PATH}.tar 

