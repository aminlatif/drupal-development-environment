#!/bin/bash

git submodule update --init --recursive

if [ ! -f .env ]; then
    echo "Creating .env file"
    cp .env.sample .env
fi