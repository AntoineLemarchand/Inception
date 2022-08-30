FROM	alpine:latest

# Setting up system
RUN		apk update && \
		apk add --upgrade apk-tools && \
		apk upgrade --available

# getting source
RUN		apk add mysql mysql-client

# settind up mariadb
COPY	 tools/create_db create_db
RUN		 mariadb

# exposing port
EXPOSE 3306
