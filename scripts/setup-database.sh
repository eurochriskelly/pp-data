#!/bin/bash

env=$1
tmpSchema=/tmp/schema-PPClubEvents.sql

if [ -z "$env" ]; then
	echo "Please provide an environment (e.g. dev,tst,prd)"
	exit 1
fi

set -a
source .env
source .kamal/secrets.${env}
set +a

cat ./schemas/PPClubEvents/*.sql > $tmpSchema

env_upper=$(echo "$env" | tr '[:lower:]' '[:upper:]')
var_host="PP_HOSTNAME_SSH_${env_upper}"
DB_HOST="${!var_host}"
var_user="PP_USR_${env_upper}"
DB_USER="${!var_user}"

mysql \
	-h "${DB_HOST:-localhost}" \
	-P "${DB_PORT:-3306}" \
	-u "$DB_USER" \
	-p"$MYSQL_ROOT_PASSWORD" \
	< $tmpSchema
