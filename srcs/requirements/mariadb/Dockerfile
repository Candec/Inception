FROM debian:10.11

# Arguments to complete the following commands
ARG DB_NAME \
    DB_USER \
    DB_PASS \
    DB_UROOT \
    DB_ROOT

# update the packages and installs maria db and its client
RUN apt-get update && \
    apt-get -y install \
        gettext-base \
        mariadb-server \
        mariadb-client \
        procps \
        nano

# write into a file located at /var/run/mysqld the echo commands
# which are going to be used to configured maria db
# 1. Name
# 2. & 3. skip caching for optimization and skip name checking (we only have one DB)
# 4. Config for accepting remote connections
RUN mkdir -p /var/run/mysqld \
  && chown -R mysql:mysql /var/run/mysqld

COPY requirements/mariadb/conf/my.cnf /my.cnf.tmpl

RUN chmod 744 /my.cnf.tmpl

RUN mv /my.cnf.tmpl /etc/mysql/my.cnf


# Expose the port
EXPOSE 3306

# Table creation using bash scripts and then removing the scrips
COPY requirements/mariadb/conf/tmpl.sql /tmpl.sql
COPY requirements/mariadb/tools/create_db.sh .
RUN sh create_db.sh && rm create_db.sh

USER mysql

# start DB, quietly please
CMD ["/usr/bin/mysqld"]
