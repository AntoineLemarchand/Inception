FROM	alpine:latest

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

RUN echo "<html><h1>hello world, this is " $DOMAIN_NAME "</h1></html>" > /www/index.html

# exposing needed port
EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
