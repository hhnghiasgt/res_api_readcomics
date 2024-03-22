#!/bin/bash
echo "AfterInstall"
if [ "$DEPLOYMENT_GROUP_NAME" == "stg-transport-web-dg" ]
then
  cp /var/www/html/srv/.env.staging /var/www/html/srv/.env
fi
if [ "$DEPLOYMENT_GROUP_NAME" == "prd-transport-web-dg" ]
then
  cp /var/www/html/srv/.env.production /var/www/html/srv/.env
fi
chown nginx:nginx /var/www/html/srv -R
chmod -R 755 /var/www/html/srv/storage
/usr/bin/php /var/www/html/srv/artisan optimize
echo "Execute Migrations"
/usr/bin/php /var/www/html/srv/artisan migrate --force
