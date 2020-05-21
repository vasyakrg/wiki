#!/bin/bash

source backup.env

docker run --rm --env-file .env --network wiki --name wiki_backup vasyakrg/backup:v2
echo "Backup create and save to ${STORAGE_HOST}/${STORAGE_PATH}"
