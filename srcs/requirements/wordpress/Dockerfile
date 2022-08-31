FROM	alpine:3.9

# exposing port
EXPOSE 9000

# Setting up system
RUN		apk update && \
		apk add --upgrade apk-tools && \
		apk upgrade --available

# adding php
RUN		apk add curl php7 \
    php7-dom php7-ftp php7-gd php7-openssl \
    php7-phar php7-iconv php7-mbstring \
    php7-mongodb php7-mysqli php7-zlib

# getting source
RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
		wp core download
#		wp core config --dbhost="localhost:3306" --dbname="wordpress_db" \
#		--dbuser="$MYSQL_USER" --dbpassword="$MYSQL_PASSWORD"

CMD		["wp", "shell"]
