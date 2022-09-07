#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo "INSTALLING DATABASE"
	mysql_install_db > /dev/null
	echo "CONFIGURING DATABASE"
	temp=`mktemp`
	cat << EOF > $temp
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $WP_DBNAME;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $WP_DBNAME.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF
	echo "INITIALIZING DATABASE"
	mysqld --bootstrap < $temp && rm $temp
else
	echo "DATABASE ALREADY INSTALLED"
fi

mysqld --console
