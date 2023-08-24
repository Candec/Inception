FROM alpine:3.18

RUN apk update && apk add --no-cache mariadb mariadb-client

EXPOSE 3306

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN service mysql start && mysql < /var/www/create_db.sql && rm -f /var/www/create_db.sql;

CMD ["mysqld"]
