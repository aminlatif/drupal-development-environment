#!/bin/bash

source ./extra/load-env-file/load-env-file.sh

loadEnvFile ".env"

./compose-down.sh

sudo rm -rf ./mysql/data