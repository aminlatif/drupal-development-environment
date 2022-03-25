#!/bin/bash

git submodule update --init --recursive

source ./extra/load-env-file/load-env-file.sh

if [ ! -f .env ]; then
    echo "Creating .env file"
    cp default.env .env
fi

loadEnvFile ".env"

mkdir -p ./mysql/data
mkdir -p ./mysql/files/export
mkdir -p ./mysql/files/import

if [ ! -f drupal/config/nginx/nginx.conf ]; then
    echo "Creating nginx.conf file"
    cp drupal/config/nginx/default.nginx.conf drupal/config/nginx/nginx.conf
fi

if [ ! -f drupal/config/nginx/sites-available/default.conf ]; then
    echo "Creating default.conf file"
    cp drupal/config/nginx/sites-available/default.default.conf drupal/config/nginx/sites-available/default.conf
fi

if [ ! -f drupal/config/nginx/snippets/php.conf ]; then
    echo "Creating php.conf file"
    cp drupal/config/nginx/snippets/default.php.conf drupal/config/nginx/snippets/php.conf
fi

if [ ! -f drupal/config/php/conf.d/zz-custom.ini ]; then
    echo "Creating zz-custom.ini file"
    cp drupal/config/php/conf.d/default.zz-custom.ini drupal/config/php/conf.d/zz-custom.ini
fi

if [ ! -f drupal/config/install-drupal.sh ]; then
    echo "Creating install-drupal.sh file"
    cp drupal/config/default.install-drupal.sh drupal/config/install-drupal.sh
fi
if [ ! -f drupal/config/uninstall-drupal.sh ]; then
    echo "Creating uninstall-drupal.sh file"
    cp drupal/config/default.uninstall-drupal.sh drupal/config/uninstall-drupal.sh
fi

mkdir -p ./drupal/extra
mkdir -p ./drupal/log
mkdir -p ./drupal/html

mkdir -p ./drupal/files/private
mkdir -p ./drupal/files/public
mkdir -p ./drupal/files/tmp
mkdir -p ./drupal/files/modules/custom
mkdir -p ./drupal/files/profiles/custom
mkdir -p ./drupal/files/themes/custom

./compose-up.sh