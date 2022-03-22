FROM alpine:latest

RUN apk add --no-cache nginx-mod-http-lua lua-cjson

# Add our nginx conf
COPY ./default.conf /etc/nginx/http.d/default.conf

CMD ["nginx"]
