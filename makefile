run: build
	docker-compose -f ./srcs/docker-compose.yml up -d

build:
	mkdir -p ~/WordPress
	mkdir -p ~/Mariadb
	docker-compose -f ./srcs/docker-compose.yml build
down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker system prune --all --force

fclean:
	docker system prune --all --volumes --force

re: down fclean run
