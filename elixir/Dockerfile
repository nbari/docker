FROM ubuntu:16.04

RUN apt-get update && apt-get install -y --no-install-recommends -q curl build-essential ca-certificates git wget locales
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update && apt-get install -y esl-erlang elixir
RUN curl -s https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz | tar -C /usr/local -xz

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:/go/bin:/usr/local/bin:$PATH
ENV IMMORTAL_DIR=/go/src/github.com/immortal

RUN mkdir -p $IMMORTAL_DIR && \
    git clone https://github.com/immortal/immortal.git $IMMORTAL_DIR/immortal && \
    cd $IMMORTAL_DIR/immortal && \
    make install && \
    mkdir /etc/immortal

ADD start.sh /srv/start.sh
ADD elixir.yml /etc/immortal/
ADD src /src

RUN chmod +x /srv/start.sh
RUN cd /src/example && \
    mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix compile

ENTRYPOINT "/srv/start.sh" && /bin/bash
