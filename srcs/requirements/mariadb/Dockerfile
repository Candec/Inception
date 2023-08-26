FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client

COPY tools/create_db.sh /tmp/create_db.sh

RUN chmod +x /var/www/html


ENTRYPOINT ["sh", "/tmp/create_db.sh"]
