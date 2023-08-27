FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
		wget				\
        tar                 \
		mariadb-client		\
		# Wordpress core depencencies
        php81-common \
        php81-pdo_sqlite \
        php81-pear \
        php81-ftp \
        php81-imap \
        php81-mysqli \
        php81-json \
        php81-mbstring \
        php81-soap \
        php81-litespeed \
        php81-sockets \
        php81-bcmath \
        php81-opcache \
        php81-dom \
        php81-zlib \
        php81-gettext \
        php81-fpm \
        php81-intl \
        php81-openssl \
        php81-session \
        php81-pdo_mysql \
        php81-embed \
        php81-xmlrpc \
        php81-wddx \
        php81-dba \
        php81-ldap \
        php81-xsl \
        php81-exif \
        php81-pdo_dblib \
        php81-bz2 \
        php81-pdo \
        php81-pspell \
        php81-sysvmsg \
        php81-gmp \
        php81-apache2 \
        php81-pdo_odbc \
        php81-shmop \
        php81-ctype \
        php81-phpdbg \
        php81-enchant \
        php81-sysvsem \
        php81-sqlite3 \
        php81-odbc \
        php81-pcntl \
        php81-calendar \
        php81-xmlreader \
        php81-snmp \
        php81-zip \
        php81-posix \
        php81-iconv \
        php81-curl \
        php81-doc \
        php81-gd \
        php81-xml \
        php81-dev \
        php81-cgi \
        php81-sysvshm \
        php81-pgsql \
        php81-tidy \
        php81-pdo_pgsql \
        php81-phar \
        php81-mysqlnd


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
