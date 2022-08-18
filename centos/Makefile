.PHONY: all build

all: build

run:
	docker run -t -i -v ${PWD}/data:/data -t centos .

build:
	docker build -t centos .
