#!/bin/bash

source .env

FILE=$1

[[ -z $FILE ]] && {
    echo "Usage: ./restore_backup.sh <dumpp file>"
    exit 1
}

cat $FILE | docker exec -i ${CONTAINER_NAME_DB} psql -Upostgres
