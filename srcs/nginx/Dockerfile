# setting up system
FROM	alpine:latest

RUN		apk update && \
		apk add --upgrade apt-tools && \
		apk upgrade --available

# getting nginx source
RUN		apk add nginx && \
		adduser -D -g 'www' www && \
		mkdir /www && \
		chown -R www:www /var/lib/nginx && \
		chown -R www:www /www

#adding config
COPY	cond /etc/nginx/nginx.conf

# exposing needed port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
