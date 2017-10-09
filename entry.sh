#!/bin/bash
set -e

# wait-for-mysql

until nc -z db 3306; do
  >&2 echo "Waiting for mysql ..."
  sleep 1
done

>&2 echo "> mysql connection is available \n"

rake db:migrate

rake db:create RAILS_ENV=test
rake db:migrate RAILS_ENV=test

exec "$@"
