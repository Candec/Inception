FROM alpine:3.18

# update the packages and installs maria db and its client
RUN apk update && apk add --no-cache mariadb mariadb-client procps nano gettext

# write into a file located at /var/run/mysqld the echo commands
# which are going to be used to configured maria db
# 1. Name
# 2. & 3. skip caching for optimization and skip name checking (we only have one DB)
# 4. Config for accepting remote connections
RUN mkdir -p /var/run/mysqld \
    && chmod 777 /var/run/mysqld;

COPY requirements/mariadb/conf/my.cnf /my.cnf
RUn ls -la /var/lib
RUN chmod 775 /my.cnf
RUN mv my.cnf /var/lib/mysql/my.cnf

# RUN mv /my.cnf.tmpl /etc/mysql/my.cnf

COPY requirements/mariadb/conf/tmpl.sql /tmpl.sql

# Expose the port
EXPOSE 3306

# Table creation using bash scripts and then removing the scrips
COPY requirements/mariadb/tools/create_db.sh .
RUN sh create_db.sh && rm create_db.sh
USER mysql

# start DB, quietly please
CMD ["/usr/bin/mysqld", "--skip-log-error"]
