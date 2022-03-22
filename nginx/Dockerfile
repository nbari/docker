FROM alpine:latest

RUN apk add --no-cache nginx-mod-http-lua lua-cjson

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Add our nginx conf
COPY ./default.conf /etc/nginx/http.d/default.conf

CMD ["nginx"];
