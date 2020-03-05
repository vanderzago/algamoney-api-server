#!/bin/ash

USERNAME=$1
PASSWORD=$2
BASIC_AUTHORIZATION_CREDENTIALS=$3
URL=$4

curl --fail --location --request POST "${URL}/oauth/token" \
--header 'Content-Type: application/x-www-form-urlencoded' \
--header "Authorization: Basic $BASIC_AUTHORIZATION_CREDENTIALS" \
--data-urlencode 'client=angular' \
--data-urlencode "username=$USERNAME" \
--data-urlencode "password=$PASSWORD" \
--data-urlencode 'grant_type=password'