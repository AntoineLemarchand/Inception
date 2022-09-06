FROM	alpine:3.16

# Setting up system
RUN	apk update && \
	apk add --upgrade apk-tools && \
	apk upgrade --available

# getting nginx source
RUN	apk add nginx openssl php8-fpm && \
	adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www && \
	openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-out /var/lib/nginx/nginx.pem -keyout /var/lib/nginx/nginx.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42school/OU=studend/CN=alemarch" && \
	ln -sf /dev/stdout /var/log/nginx/access.log && \
	ln -sf /dev/stderr /var/log/nginx/error.log

# adding config
COPY	conf/nginx.conf 			/etc/nginx/nginx.conf
ARG		DOMAIN_NAME

# exposing needed port
EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
