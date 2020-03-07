#!/bin/ash
FRONT_URL=$1

echo Initializing API
java -jar -Dspring.config.location=/opt/application-docker.properties /opt/algamoney-api-0.0.1-SNAPSHOT.jar --algamoney.origin-permitida=$FRONT_URL