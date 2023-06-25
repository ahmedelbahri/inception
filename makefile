run: build
	docker-compose -f ./srcs/docker-compose.yml up -d

build:
	mkdir -p /home/ahel-bah/data/WordPress
	mkdir -p /home/ahel-bah/data/Mariadb
	docker-compose -f ./srcs/docker-compose.yml build
down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker system prune --all --force

fclean: down
	docker system prune --all --volumes --force

re: fclean run
