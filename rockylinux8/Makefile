.PHONY: all build

all: build

run:
	docker run --platform linux/amd64  -t -i -v ${PWD}/data:/data -t rocky8

build:
	docker buildx build --platform linux/amd64 -t rocky8 .
