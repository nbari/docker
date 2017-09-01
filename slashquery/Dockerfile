FROM golang:1.9

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:/go/bin:/usr/local/bin:$PATH
ENV SQ_DIR /go/src/github.com/slashquery

RUN mkdir -p $SQ_DIR && \
    git clone https://github.com/slashquery/slashquery.git $SQ_DIR/slashquery && \
    cd $SQ_DIR/slashquery && \
    make

ENTRYPOINT /bin/bash
