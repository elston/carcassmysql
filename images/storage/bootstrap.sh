#!/bin/bash
set -e

# ...
MYSQL_CONTAINER_NAME="carcassmysql_storage_1"
# ...
MYSQL_DATABASE="mediatry"
MYSQL_USER="mark"
MYSQL_PASSWORD="zuckerberg"

# Do not edit these values:
MYSQL_ROOT_PASSWORD=$(cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 32 | sed 1q)

# ...
echo "Start the Oracle MySQL container:"
# ..
docker run \
--detach \
--env MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
--env MYSQL_USER=${MYSQL_USER} \
--env MYSQL_PASSWORD=${MYSQL_PASSWORD} \
--env MYSQL_DATABASE=${MYSQL_DATABASE} \
--volume carcassmysql_var_lib_mysql:/var/lib/mysql \
--volume carcassmysql_etc_mysql:/etc/mysql \
--volume carcassmysql_var_log_mysql:/var/log/mysql \
--name ${MYSQL_CONTAINER_NAME} \
--publish 3306:3306 \
mysql:5.7;

# ...
echo "Sleeping for 10 seconds to allow time for the DB to be provisioned:"
for i in `seq 1 10`;
do
  echo "."
  sleep 1
done

# ...
echo "Database '${MYSQL_DATABASE}' created."
echo "  Username: ${MYSQL_USER}"
echo "  Password: ${MYSQL_PASSWORD}"
# ...
# docker stop ${MYSQL_CONTAINER_NAME}
# docker rm ${MYSQL_CONTAINER_NAME}