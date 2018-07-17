#!/bin/bash
mkdir /opt/docker
cd /opt/docker
git clone https://github.com/glebvmx/sentry.git
cd /opt/docker/sentry
mkdir -p data/{sentry,postgres}
docker-compose run --rm web config generate-secret-key
SENTRY_SECRET_KEY=`docker-compose run --rm web config generate-secret-key`
sed "s/#SENTRY_SECRET_KEY:/SENTRY_SECRET_KEY: $SENTRY_SECRET_KEY/g" docker-compose.yml > docker-compose-s.yml
docker-compose run  -e SENTRY_SECRET_KEY=$SENTRY_SECRET_KEY --rm web upgrade --noinput
docker-compose run  -e SENTRY_SECRET_KEY=$SENTRY_SECRET_KEY --rm web createuser --email glebvmx@gmail.com --password secret --superuser
/usr/local/bin/docker-compose -f docker-compose-s.yml up -d

