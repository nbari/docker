.PHONY: all build down ps clean

all:
	docker-compose up

build:
	docker-compose build

ps:
	docker-compose ps

down:
	docker-compose down

clean:
	@find . -type d -name "db" -execdir sh -c 'rm -rf {}/*' \;
