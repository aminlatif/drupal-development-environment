#!/bin/bash

scriptDir="`dirname "$0"`"
cd $scriptDir

source ../../extra/load-env-file/load-env-file.sh

loadEnvFile "../../.env"

docker exec -it ${PROJECT_NAME}-mysql-development /bin/bash
