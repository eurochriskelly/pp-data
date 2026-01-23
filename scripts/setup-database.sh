#!/bin/bash

env=$1

if [ -z "$env" ];then
  echo "Please provide an envirnoment (e.g. dev,tst,prd)"
  exit 1
fi

set -a
source .env
source .kamal/secrets.${env}
set +a

mysql \
  -h "${DB_HOST:-localhost}" \
  -P "${DB_PORT:-3306}" \
  -u "$DB_USER" \
  -p"$MYSQL_ROOT_PASSWORD" \
  "$DB_NAME" < ./db/schema.sql
