.PHONY: all build

all: build

run:
	docker run -t -i -v ${PWD}/data:/data -t rocky8 .

build:
	docker build -t rocky8 .
