FROM alpine:3.18

RUN apk update && apk add --no-cache mariadb mariadb-client

EXPOSE 3306

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN service mysql start
RUN mysql < /var/www/tmpl.sql
RUN rm -f /var/www/tmpl.sql;

CMD ["mysqld"]
