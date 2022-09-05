#!/bin/bash

sleep 15
wp core download --path="/var/www/html/"
wp config create --path="/var/www/html" --dbname="$WP_DB_NAME"\
	--dbhost="$WP_DB_HOST" --dbuser="$WP_DB_USER" --dbpass="$WP_DB_PASSWORD"
wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" \
	--admin_name="$WP_ADMIN" --admin_email="alemarch@student.42.fr" --skip-email \
	--path="/var/www/html/" --admin_password="$WP_ADMIN_PASSWORD" --allow-root
echo "runnning php-fpm" && php-fpm8 -FR
