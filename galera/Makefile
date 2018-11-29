.PHONY: all add build down ps clean stop ha

all:
	docker-compose up node0

add:
	docker-compose up node1 node2 node3

ha:
	docker-compose up haproxy

build:
	docker-compose build

ps:
	docker-compose ps

down:
	docker-compose down

stop:
	docker-compose stop node0

clean:
	@find . -type d -name "db" -execdir sh -c 'rm -rf {}/*' \;
