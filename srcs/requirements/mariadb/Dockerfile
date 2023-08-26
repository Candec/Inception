FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client

COPY tools/create_db.sh /tmp/configure.sh

ENTRYPOINT ["sh", "/tmp/configure.sh"]
