#!/bin/bash

source backup.env

docker run --rm --env-file /srv/cfg/rocker-chat/backup.env --network slack_net --name slack_backup vasyakrg/backup:v2
echo "Backup create and save to ${STORAGE_HOST}/${STORAGE_PATH}"
