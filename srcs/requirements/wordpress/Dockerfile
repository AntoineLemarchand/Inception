FROM	alpine:latest

# Setting up system
RUN		apk update && \
		apk add --upgrade apk-tools && \
		apk upgrade --available

# additionnal packages
RUN		apk add php7-common php7-session php7-iconv php7-json php7-gd \
		php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo \
		php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt \
		php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml

# getting source
RUN		apk add wget tar
RUN		mkdir -p /usr/share/webapps/ && \
		wget http://wordpress.org/latest.tar.gz && \
		tar -xzvf ltest.tar.gz && rm latest.tar.gz && \
		ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
# ?? thanks to dpaccagn this is untestable for now
RUN		wordpress

# exposing port
EXPOSE 9000
