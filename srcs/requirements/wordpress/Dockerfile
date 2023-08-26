FROM alpine:3.18

# Arguments to complete the following commands
ARG PHP_VERSION=82 \
    DB_NAME \
    DB_USER \
    DB_PASS

# Packages to install
RUN apk update && apk upgrade && apk add --no-cache \
    wget \
    unzip \
    curl \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip

# Config configuration
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php82/php-fpm.d/www.conf
RUN sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php82/php-fpm.d/www.conf
RUN sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php82/php-fpm.d/www.conf

# Clear de cache
RUN rm -f /var/cache/apk/*

# Installs wp command for the setup
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Change Directory
WORKDIR /var/www/html/

# Downloads Wordpress, unzip it, copy it to the present dir and deletes the source
RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN rm -rf latest.zip

WORKDIR /var/www/html/wordpress
COPY ./requirements/wordpress/conf .
RUN chown -R www-data:www-data /var/www/html/wordpress

COPY /conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf


# Copies, run and delete a wp config script
COPY ./requirements/wordpress/tools/wp-config-create.sh .
RUN sh wp-config-create.sh && rm wp-config-create.sh

# Gives permision to all users
RUN chmod -R 0777 wp-content/

# Builds PHP version 8.2
CMD ["/usr/sbin/php-fpm82", "-F"]
