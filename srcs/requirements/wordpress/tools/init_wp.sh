#!/bin/bash

echo 'mysqld is not ready yet..'
sleep 20

if [ ! -f "index.php" ]
then
	echo CONFIGURING PHP-FPM
	echo "listen = 9000" >> /etc/php8/php-fpm.d/www.conf
	sed -i "s/;error_log/error_log/" /etc/php8/php-fpm.conf
	ln -sf /dev/stderr /var/log/php8/error.log
	echo DOWNLOADING WORDPRESS
	wp core download --path="/var/www/html"
	echo CREATING WORDPRESS CONFIG
	wp config create --dbname="$WP_DB_NAME" \
		--dbhost="$WP_DB_HOST" --dbuser="$WP_DB_USER" --dbpass="$WP_DB_PASSWORD"
	echo INSTALLING WORDPRESS
	wp core install --url="alemarch.42.fr" --title="$WP_TITLE" \
		--admin_name="$WP_ADMIN" --admin_email="alemarch@student.42.fr" \
		--skip-email --admin_password="$WP_ADMIN_PASSWORD" --allow-root
	echo "CREATING alemarch_user"
	wp user create $WP_USER antoine.lemarchand05@gmail.com \
		--user_pass=$WP_USER_PASSWORD
	echo "UPGRADING TO HTTPS"
	wp search-replace 'http://alemarch.42.fr' 'https://alemarch.42.fr' \
		> /dev/null
fi
echo "RUNNING PHP-FPM" && php-fpm8 -FR
