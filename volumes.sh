!#/bin/bash
docker volume create --name=sentry-data
docker volume create --name=sentry-postgres
docker volume create --name=sentry-redis
docker volume create --name=sentry-zookeeper
docker volume create --name=sentry-kafka
docker volume create --name=sentry-clickhouse
docker volume create --name=sentry-symbolicator
