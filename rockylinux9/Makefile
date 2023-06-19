.PHONY: all build

all: build

run:
	docker run -t -i -v ${PWD}/data:/data -t rocky9 .

build:
	docker build -t rocky9 .
