FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
		wget				\
        tar                 \
		mariadb-client		\
		# Wordpress core depencencies
        php8 \
        php8-dev \
        php8-common \
        php8-gd \
        php8-xmlreader \
        php8-bcmath \
        php8-ctype \
        php8-curl \
        php8-exif \
        php8-iconv \
        php8-intl \
        php8-mbstring \
        php8-opcache \
        php8-openssl \
        php8-pcntl \
        php8-phar \
        php8-session \
        php8-xml \
        php8-xsl \
        php8-zip \
        php8-zlib \
        php8-dom \
        php8-fpm \
        php8-sodium \


# php config
RUN	adduser -S nginx &&	addgroup -S nginx
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

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
