FROM debian:10

RUN apt update && apt -y install --no-cache mysql-server mysql-client

EXPOSE 3306

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN mysql < /var/www/tmpl.sql
RUN rm -f /var/www/tmpl.sql;

USER mysql

CMD ["mysqld"]
