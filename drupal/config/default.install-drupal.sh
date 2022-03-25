#!/bin/bash

# Profiles: standard, minimal, demo_umami, lightning
DRUPAL_PROFILE='standard'

echo "Installing Drupal (version: ${DRUPAL_VERSION} - profile: ${DRUPAL_PROFILE})"

bash -c "/uninstall-drupal.sh"

cd /var/www/html

if [ "$DRUPAL_VERSION" == "latest" ]; then
    composer create-project drupal/recommended-project . --no-interaction
else
    composer create-project drupal/recommended-project:${DRUPAL_VERSION} . --no-interaction
fi

cd /var/www/html/web/sites/default && ln -s ../../../../files/public files && ls -lh
cd /var/www/html/web/modules && ln -s ../../../files/modules/custom custom && ls -lh
cd /var/www/html/web/profiles && ln -s ../../../files/profiles/custom custom && ls -lh
cd /var/www/html/web/themes && ln -s ../../../files/themes/custom custom && ls -lh

cd /var/www/html

composer require drush/drush --no-interaction
composer require --dev drupal/core-dev --with-all-dependencies --no-interaction

./vendor/bin/drush si $DRUPAL_PROFILE --db-url="$DATABASE_DRIVER://$DATABASE_USERNAME:$DATABASE_PASSWORD@$DATABASE_HOST/$DATABASE_NAME" --db-prefix="$PROJECT_DRUPAL_DATABASE_PREFIX" --account-name="admin" --account-pass="admin" --site-name="$PROJECT_TITLE"

composer require --dev drupal/devel --no-interaction
./vendor/bin/drush en devel