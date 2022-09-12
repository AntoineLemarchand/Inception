all:
	@ if [ ! -d /home/alemarch/data/WP ]; then \
		mkdir -p /home/alemarch/data/WP; \
	fi
	@ if [ ! -d /home/alemarch/data/DB ]; then \
		mkdir -p /home/alemarch/data/DB; \
	fi
	@ if ! grep -q "alemarch.42.fr" /etc/hosts; then  \
		echo "127.0.0.1	alemarch.42.fr" >> /etc/hosts; \
	fi
	cd srcs && docker-compose up --build && cd -

clean:
	cd srcs && docker-compose -f docker-compose.yml down && cd -

fclean: clean
	rm -rf /home/alemarch/data/WP/*
	rm -rf /home/alemarch/data/DB/*

re: fclean all
