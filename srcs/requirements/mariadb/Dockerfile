FROM alpine:3.18

RUN apk update && apk add --no-cache mariadb mariadb-client

EXPOSE 3306

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN mysql < /var/www/tmpl.sql
RUN rm -f /var/www/tmpl.sql;

CMD ["mysqld"]
