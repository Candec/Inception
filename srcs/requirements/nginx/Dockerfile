FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        nginx \
        openssl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/jibanez-.pem \
        -keyout /etc/nginx/ssl/jibanez-.key \
        -subj "/C=EN/ST=Lisbon/L=Lisbon/O=42Lisboa/OU=jibanez-/CN=jibanez-/"

# nginx config
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod +x /var/www/html


# Start nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
