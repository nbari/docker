FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends -q curl build-essential ca-certificates git python3-pip python3-dev net-tools python-yaml python-jinja2 python-pycurl vim
RUN curl -s https://storage.googleapis.com/golang/go1.10.3.linux-amd64.tar.gz | tar -C /usr/local -xz
RUN pip3 install setuptools
RUN pip3 install ansible

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
RUN chmod +x /srv/start.sh

ADD inventory /etc/ansible/hosts
ADD playbooks/ /etc/ansible/
ADD recipie.yml /etc/ansible/

WORKDIR /etc/ansible

RUN ansible-playbook /etc/ansible/immortal.yml -c local

ENTRYPOINT "/srv/start.sh" && /bin/bash
