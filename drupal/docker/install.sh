#!/bin/bash

scriptDir="`dirname "$0"`"
cd $scriptDir

source ../../extra/load-env-file/load-env-file.sh

loadEnvFile "../../.env"

docker exec -it ${PROJECT_NAME}-drupal-development bash -c "chmod u+x /install-drupal.sh"
docker exec -it ${PROJECT_NAME}-drupal-development bash -c "/install-drupal.sh"
