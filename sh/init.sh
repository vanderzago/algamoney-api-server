#!/bin/ash

USER=$1
PASS=$2
URL=$3
FRONT_URL=$4

APP=Graylog

LOOP=0
RETRIES=10
RETRY=0
while [[ ${LOOP} -eq 0 ]]
do
    if [[ ${RETRY} -lt ${RETRIES} ]]
    then
        LOOP=1
    fi

    curl --fail $URL; Res=$?
    if [[ $Res -eq 0 ]]
    then
        echo $APP is up
        echo Initializing API
        java -jar -Dspring.config.location=/opt/application-docker.properties /opt/algamoney-api-0.0.1-SNAPSHOT.jar --algamoney.origin-permitida=$FRONT_URL
        LOOP=1
    else
        echo $APP is not running
        sleep 30
        RETRY=$((RETRY+1))
    fi
done