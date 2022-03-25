#!/bin/bash

git submodule update --init --recursive

source ./extra/load-env-file/load-env-file.sh

if [ ! -f .env ]; then
    echo "Creating .env file"
    cp .env.sample .env
fi

loadEnvFile ".env"