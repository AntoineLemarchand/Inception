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
COPY	conf			/etc/mysql/my.cnf
COPY	tools/init.sh	init.sh
CMD		["bash", "./init.sh"]
