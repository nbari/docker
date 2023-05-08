.PHONY: all build

all: build

run:
	docker run -t -i -v ${PWD}/data:/data -t ubi8 .

build:
	docker build -t ubi8 .
