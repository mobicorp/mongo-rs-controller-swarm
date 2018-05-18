#!/bin/sh
set -o allexport
if [ -f ./.env ];then
    export $(cat ./.env | grep -v ^# | xargs)
    #. ./.env
else
    export $(cat ./.env.example | grep -v ^# | xargs)
fi


docker build . -t ${CONTROLLER_IMAGE}
