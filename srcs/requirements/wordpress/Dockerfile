FROM debian:buster

# Arguments to complete the following commands
ARG PHP_VERSION=7.3 \
    DB_NAME \
    DB_USER \
    DB_PASS

# Packages to install
RUN apt update && apt upgrade
RUN apt install unzip
RUN apt install php7.3
RUN apt install php-fpm
RUN apt install php-mysql
RUN apt install wget
RUN apt install sendmail

# Config configuration
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php82/php-fpm.d/www.conf
RUN sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php82/php-fpm.d/www.conf
RUN sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php82/php-fpm.d/www.conf

# Clear de cache
RUN rm -f /var/cache/apk/*

# Change Directory
WORKDIR /var/www

# Downloads Wordpress, unzip it, copy it to the present dir and deletes the source
RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN cp -rf wordpress/* .
RUN rm -rf wordpress latest.zip

# Copies, run and delete a wp config script
COPY .conf/wp-config-create.sh .
RUN sh wp-config-create.sh && rm wp-config-create.sh

# Gives permision to all users
RUN chmod -R 0777 wp-content/

# Builds PHP version 8.2
CMD ["/usr/sbin/php-fpm82", "-F"]
