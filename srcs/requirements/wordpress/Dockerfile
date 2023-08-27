FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
		wget				\
        tar                 \
		mariadb-client
		# Wordpress core depencencies
RUN apk add php81-common
RUN apk add php81-pdo_sqlite
RUN apk add php81-pear
RUN apk add php81-ftp
RUN apk add php81-imap
RUN apk add php81-mysqli
RUN apk add php81-json
RUN apk add php81-mbstring
RUN apk add php81-soap
RUN apk add php81-litespeed
RUN apk add php81-sockets
RUN apk add php81-bcmath
RUN apk add php81-opcache
RUN apk add php81-dom
RUN apk add php81-zlib
RUN apk add php81-gettext
RUN apk add php81-fpm
RUN apk add php81-intl
RUN apk add php81-openssl
RUN apk add php81-session
RUN apk add php81-pdo_mysql
RUN apk add php81-embed
RUN apk add php81-xmlrpc
RUN apk add php81-wddx
RUN apk add php81-dba
RUN apk add php81-ldap
RUN apk add php81-xsl
RUN apk add php81-exif
RUN apk add php81-pdo_dblib
RUN apk add php81-bz2
RUN apk add php81-pdo
RUN apk add php81-pspell
RUN apk add php81-sysvmsg
RUN apk add php81-gmp
RUN apk add php81-apache2
RUN apk add php81-pdo_odbc
RUN apk add php81-shmop
RUN apk add php81-ctype
RUN apk add php81-phpdbg
RUN apk add php81-enchant
RUN apk add php81-sysvsem
RUN apk add php81-sqlite3
RUN apk add php81-odbc
RUN apk add php81-pcntl
RUN apk add php81-calendar
RUN apk add php81-xmlreader
RUN apk add php81-snmp
RUN apk add php81-zip
RUN apk add php81-posix
RUN apk add php81-iconv
RUN apk add php81-curl
RUN apk add php81-doc
RUN apk add php81-gd
RUN apk add php81-xml
RUN apk add php81-dev
RUN apk add php81-cgi
RUN apk add php81-sysvshm
RUN apk add php81-pgsql
RUN apk add php81-tidy
RUN apk add php81-pdo_pgsql
RUN apk add php81-phar
RUN apk add php81-mysqlnd

# php config
RUN	adduser -S nginx &&	addgroup -S nginx
COPY conf/php-fpm.conf /etc/php81/php-fpm.conf
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

# static website
# COPY conf/index.html /var/www/html/index.html

# install wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN rm latest.tar.gz
RUN cp wordpress/index.php .
WORKDIR /var/www/html/wordpress
RUN chmod +x /var/www/html/wordpress/index.php


COPY tools/configure.sh /tmp/configure.sh
ENTRYPOINT [ "sh", "/tmp/configure.sh" ]
