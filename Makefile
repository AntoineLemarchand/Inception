all:
	@ if [ ! -d /home/alemarch/data/WP ]; then \
		mkdir -p /home/alemarch/data/WP; \
	fi
	@ if [ ! -d /home/alemarch/data/DB ]; then \
		mkdir -p /home/alemarch/data/DB; \
	fi
	@ if [ $(cat /etc/hosts | grep alemarch.42.fr) ]; then \
		echo "127.0.0.1	alemarch.42.fr" >> /etc/hosts; \
	fi
	cd srcs && docker-compose up --build
	cd -

clean:
	cd srcs
	docker system prune -f
	docker-compose -f srcs/docker-compose.yml down
	cd -

fclean: clean
	rm -rf /home/alemarch/data/WP/*
	rm -rf /home/alemarch/data/DB/*

re: fclean all
