#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
fi

temp="$(mktemp)";

if [ ! -f "$temp" ]; then
	return 1
fi

cat << EOF > $temp
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD";
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
EOF
echo "CREATE DATABASE 'wordpress_db';" >> $temp
echo "GRANT ALL ON 'wordpress_db'.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $temp

mysqld -u root < $temp
rm -f $temp

exec mysqld -u root -p
