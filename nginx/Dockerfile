FROM alpine:latest as builder
ENV LUA_VERSION 5.1
RUN apk update
#RUN apk add --no-cache nginx-mod-http-lua
RUN apk add lua${LUA_VERSION}
RUN apk add lua${LUA_VERSION}-dev
RUN apk add build-base curl git openssl unzip
RUN cd /tmp && \
    git clone https://github.com/luarocks/luarocks.git && \
    cd luarocks && \
    sh ./configure && \
    make build install && \
    cd && \
    rm -rf /tmp/luarocks
RUN luarocks install lua-cjson

From alpine:latest
RUN apk add --no-cache nginx-mod-http-lua
RUN mkdir -p /usr/local/lib/lua/5.1/
COPY --from=builder /usr/local/lib/lua/5.1/cjson.so /usr/local/lib/lua/5.1/cjson.so
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/http.d/default.conf
CMD ["nginx"];
