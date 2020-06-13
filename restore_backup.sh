#!/bin/bash

source .env

FILE=$1

[[ -z $FILE ]] && {
    echo "Usage: ./restore_backup.sh <dumpp file>"
    exit 1
}

docker-compose down
docker volume rm ${SERVICE_NAME}_${SERVICE_NAME}_${CONTAINER_NAME_DB}

docker-compose -f docker-compose-db.yml up -d

docker exec -i "${SERVICE_NAME}_${CONTAINER_NAME_DB}" pg_restore -C --clean --no-acl --no-owner -U "${DBUSER}" -d "${DBTABLE}" < ${FILE}

docker-compose up -d
