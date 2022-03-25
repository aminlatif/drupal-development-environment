#!/bin/bash

source ./extra/load-env-file/load-env-file.sh

loadEnvFile ".env"

printenv | grep "COMPOSE_PROFILES"
printenv | grep "PROJECT_*" | sort

export BUILDKIT_PROGRESS=plain

docker-compose config
docker-compose up -d --build