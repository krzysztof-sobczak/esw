#!/bin/bash

# Wait until the service is ready before continuing.
# This is to ensure that the service is initialized
# before the API tries to connect.
service_is_ready() {
  NAME=$1
  HOST=$2
  PORT=$3
  echo "Waiting for service $NAME: $HOST:$PORT"
  i=1
  while ! nc -z $HOST $PORT; do
    sleep 1
    i=$((i+1));
    if [ $i -eq 60 ]; then
        echo "Service $NAME '$HOST:$PORT' not responding. Exiting..."
        exit 1
    fi;
    printf "."
  done
  echo ""
}

if [ ! -z "$ELASTICSEARCH_URL" ]; then
  ES_HOST=$(echo $ELASTICSEARCH_URL | cut -d/ -f3 | cut -d: -f1)
  ES_PORT=$(echo $ELASTICSEARCH_URL | cut -d/ -f3 | cut -d: -f2)
  service_is_ready "ELASTICSEARCH" $ES_HOST $ES_PORT
fi

if [ "$1" = 'api' ]; then
  gunicorn -b 0.0.0.0:80 --reload app:app
else
    exec "$@"
fi