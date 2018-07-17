#!/bin/bash
SENTRY_SECRET_KEY=`cat /opt/docker/sentry/docker-compose-s.yml | grep SECRET_KEY: | awk '{print $2}'`
echo $SENTRY_SECRET_KEY
