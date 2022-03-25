#!/bin/bash

echo "Uninstalling Drupal"

chmod -R a+w /var/www/html/web/sites

cd /var/www/html
rm -rf * && rm -rf .* > /dev/null 2>&1

cd /var/www/files/private
rm -rf * && rm -rf .* > /dev/null 2>&1

cd /var/www/files/public
rm -rf * && rm -rf .* > /dev/null 2>&1

cd /var/www/files/tmp
rm -rf * && rm -rf .* > /dev/null 2>&1