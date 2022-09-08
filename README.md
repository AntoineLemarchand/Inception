# Inception
An introduction to docker images

# Description
This project will generate 3 docker containers linked with docker compose:
- a custom mariadb container with a wordress database, a root user and a wp_sql user
- a custom wordpress container with an admin account (alemarch) and a user account (alemarch_user)
- a custom nginx container listening to port 443 with local https
All of these are made on alpine 3.16 and the database and wordpress files
are respectively stored in /home/alemarch/data/DB and /home/alemarch/data/WP

# Usage
```
make all# same as make all, will create all the server if not already \
	installed and run the containers
```
```
make clean # will remove all the volumes and networks
```
```
make fclean # will call clean and erase the database and wordpress files
```
```
make re # will call fclean and all
```
