#!/bin/sh

chown -R mysql:mysql /usr/
chown -R mysql:mysql /var/lib/mysql

mysql_install_db --user=root --basedir="/usr/" \
	--datadir="/var/lib/mysql/"
mysqld --user=root --datadir="/var/lib/mysql/"

mysql -e "
	CREATE DATABASE IF NOT EXIST '$WP_DBNAME';
	
	CREATE USER IF NOT EXIST 'root' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
	GRANT ALL on '*'@'*' TO 'root' IDENTIFIER BY '$MYSQL_ROOT_PASSWORD';
	
	CREATE USER IF NOT EXIST '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD';
	GRANT ALL on '$WP_DBNAME'@'*' TO 'root' IDENTIFIED BY '$MYSQL_PASSWORD';
	
	FLUSH PRIVILEGES;"

pkill mysqld
mysqld_safe --user=root --datadir="/var/lib/mysql/"
