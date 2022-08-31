FROM	alpine:3.16

# Setting up system
RUN		apk update && \
		apk add --upgrade apk-tools && \
		apk upgrade --available

# getting source
COPY	tools/create_db create_db
RUN		apk add wget tar && \
		mkdir -p /usr/share/webapps/ && \
		wget http://wordpress.org/latest.tar.gz && \
		tar -xzvf latest.tar.gz && rm latest.tar.gz && \
		ln -s /usr/share/webapps/wordpress/ /www

# exposing port
EXPOSE 9000
