FROM	alpine:3.16

# exposing port
EXPOSE 3306

# Setting up system
RUN		apk update && \
		apk add --upgrade apk-tools && \
		apk upgrade --available

# getting source
RUN		apk add mariadb mariadb-client mariadb-server-utils linux-pam linux-pam-dev bash

# setting up mariadb
COPY	tools/init.sh	init.sh
RUN		chmod +x init.sh && \
		mkdir -p /var/lib/mysql/data && chown -R mysql:mysql /var/lib/mysql/data
COPY	conf/my.cnf			/etc/mysql/my.cnf
COPY	conf/my.cnf			/etc/my.cnf

CMD		["./init.sh"]
