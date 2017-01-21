#!/bin/sh -f
DOCKER_IMAGE_NAME=bkjeholt/mysql-backup-dropbox
DOCKER_CONTAINER_NAME=mysql-backup-dropbox

DOCKER_IMAGE_BASE_TAG=${1}

ARCHITECTURE=rpi

echo "------------------------------------------------------------------------"
echo "-- Run image:       $DOCKER_IMAGE_NAME:latest "

DOCKER_IMAGE=${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_BASE_TAG}-${ARCHITECTURE}

echo "------------------------------------------------------------------------"
echo "-- Remove docker container if it exists"
echo "-- Container:   $DOCKER_CONTAINER_NAME "
echo "------------------------------------------------------------------------"

docker rm -f $DOCKER_CONTAINER_NAME

echo "------------------------------------------------------------------------"
echo "-- Start container "
echo "-- Based on image: $DOCKER_IMAGE "
echo "------------------------------------------------------------------------"

docker run -d \
           --restart=always \
           --name $DOCKER_CONTAINER_NAME \
           --link mysql-db-hic:mysql \
           --env DROPBOX_API_KEY="QkanZHtSteMAAAAAAAAAGptkhlvELB4qXt5qHD_Xe8yEdz2ViFSGRGo0799MbBh4" \
           --env DROPBOX_PATH="Backups/mysql/backup1" \
           --env MYSQL_BACKUP_INTERVALL="12" \
           --env DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME} \
           $DOCKER_IMAGE
