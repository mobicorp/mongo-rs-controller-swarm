#!/bin/sh
set -o allexport
if [ -f ./.env ];then
    export $(cat ./.env | grep -v ^# | xargs)
    #. ./.env
else
    export $(cat ./.env.example | grep -v ^# | xargs)
fi

docker network create  --opt encrypted -d overlay ${BACKEND_NETWORK_NAME}
docker stack deploy -c docker-compose.yml ${STACK_NAME}
