.PHONY: all build

all: build
	docker run -it --rm -v ${PWD}/build:/go/src/github.com/immortal/immortal/build immortal-build

build:
	docker build -t immortal-build .
