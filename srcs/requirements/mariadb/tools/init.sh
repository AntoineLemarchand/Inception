#!/bin/sh

mysql_install_db
temp=`mktemp`
cat << EOF > $temp
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $WP_DBNAME;
CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $WP_DBNAME.* TO '$MYSQL_USER'@'localhost';
FLUSH PRIVILEGES;
EOF
mysqld --bootstrap < $temp && rm $temp
mysqld --console
