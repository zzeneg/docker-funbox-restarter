#!/bin/sh

test -z "$CRON" && echo 'CRON not set!' && exit 1
test -z "$BASE_URL" && echo 'BASE_URL not set!' && exit 1
test -z "$USERNAME" && echo 'USERNAME not set!' && exit 1
test -z "$PASSWORD" && echo 'PASSWORD not set!' && exit 1

echo "$CRON    /reboot.sh" > /etc/crontabs/root

crond -f