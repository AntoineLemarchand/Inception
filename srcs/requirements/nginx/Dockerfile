FROM	alpine:3.16

# Setting up system
RUN	apk update && \
	apk add --upgrade apk-tools && \
	apk upgrade --available

# getting nginx source
RUN	apk add nginx && \
	adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

# adding config
COPY	conf 			/etc/nginx/nginx.conf
ARG	DOMAIN_NAME

# exposing needed port
EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
