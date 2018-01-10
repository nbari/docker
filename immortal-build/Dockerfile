FROM golang:latest
RUN apt-get update && apt-get install -y --no-install-recommends -q curl build-essential ca-certificates git
RUN groupadd -r toor && useradd --create-home --no-log-init -r -g toor toor
RUN go get -u github.com/golang/dep/cmd/dep
RUN go get -u github.com/laher/goxc
ENV IMMORTAL_DIR /go/src/github.com/immortal
RUN mkdir -p $IMMORTAL_DIR && \
    git clone https://github.com/immortal/immortal.git $IMMORTAL_DIR/immortal
WORKDIR /go/src/github.com/immortal/immortal
RUN dep ensure --vendor-only
RUN chown -R toor:toor /go
USER toor
ADD src/Makefile .
ENTRYPOINT ["make", "compile"]
