FROM	alpine:3.16

# exposing port
EXPOSE 3306

# Setting up system
RUN		apk update && \
		apk add --upgrade apk-tools && \
		apk upgrade --available

# getting source
RUN		apk add mysql mysql-client bash

# setting up mariadb
RUN		rm -rf /var/lib/mysqld/ib*
COPY	conf			/etc/my.cnf
COPY	tools/init.sh	init.sh
RUN		chmod +x init.sh
CMD		["./init.sh"]
