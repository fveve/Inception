# Variables
COMPOSE_FILE=srcs/docker-compose.yml

# Targets
.PHONY: all build up down

all: build up

build:
	sudo mkdir -p /home/arafa/data/wordpress
	sudo mkdir -p /home/arafa/data/mariadb
	sudo chmod +x /home/arafa/data/wordpress
	sudo chmod +x /home/arafa/data/mariadb
	docker-compose -f $(COMPOSE_FILE) build

up:
	docker-compose -f $(COMPOSE_FILE) up

down:
	docker-compose -f $(COMPOSE_FILE) down

clean : down
	rm -rf /home/arafa/data/wordpress
	rm -rf /home/arafa/data/mariadb
	docker system prune -a
	docker volume rm srcs_mariadb
	docker volume rm srcs_wordpress