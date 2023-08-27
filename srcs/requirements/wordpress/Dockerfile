FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
		wget				\
        tar                 \
		mariadb-client
		# Wordpress core depencencies
RUN apk add php81-fpm php81-json php81-zlib php81-xml php81-xmlwriter php81-simplexml php81-pdo php81-phar php81-openssl \
    php81-pdo_mysql php81-mysqli php81-session \
    php81-gd php81-iconv php81-gmp php81-zip \
    php81-curl php81-opcache php81-ctype php81-apcu \
    php81-intl php81-bcmath php81-dom php81-mbstring php81-xmlreader

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
