FROM ubuntu:16.04

RUN apt-get update && apt-get install -y --no-install-recommends -q curl build-essential ca-certificates git
RUN curl -s https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz | tar -C /usr/local -xz

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:/go/bin:/usr/local/bin:$PATH
ENV IMMORTAL_DIR /go/src/github.com/immortal

RUN mkdir -p $IMMORTAL_DIR && \
    git clone https://github.com/immortal/immortal.git $IMMORTAL_DIR/immortal && \
    cd $IMMORTAL_DIR/immortal && \
    make install && \
    mkdir /etc/immortal

ADD start.sh /srv/start.sh
ADD sleep.yml /etc/immortal/

RUN chmod +x /srv/start.sh

ENTRYPOINT "/srv/start.sh" && /bin/bash
