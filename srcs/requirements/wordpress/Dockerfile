FROM	alpine:3.16

# exposing port
EXPOSE 9000

# Setting up system
RUN		apk update && \
		apk add --upgrade apk-tools && \
		apk upgrade --available

# adding php
RUN		apk add curl bash mysql-client php8 \
    php8-dom php8-ftp php8-gd php8-openssl \
    php8-phar php8-iconv php8-mbstring \
    php8-mongodb php8-mysqli php8-zlib php8-fpm

# getting source
COPY	tools/init_wp.sh	init_wp.sh
COPY	conf/wp-config.php	wp-config.php
RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
		chmod +x init_wp.sh

CMD		["./init_wp.sh"]
