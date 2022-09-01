#!/bin/bash

cd /var/www/html
wp core download --allow-root
wp config create --dbhost="$MYSQL_HOST" --dbname="$WP_DBNAME" \
	--dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root
wp core install --url="$DOMAIN_NAME" --title"$WP_TITLE" \
	--admin_name="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" \
	--skip-email --allow-root
wp shell
