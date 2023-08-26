FROM debian:10.11

# Arguments to complete the following commands
ARG DB_NAME \
    DB_USER \
    DB_PASS

# Packages to install
RUN apt-get update -yq

RUN apt-get install curl -yq
RUN apt-get install wget -yq
RUN apt-get install php7.3-cli \
                    php7.3-fpm \
                    php7.3-mysql \
                    php7.3-json \
                    php7.3-opcache \
                    php7.3-mbstring \
                    php7.3-xml \
                    php7.3-cgi \
                    php7.3-zip \
                    php7.3-common \
                    php7.3-gd \
                    php7.3-curl \
                    php7.3-gettext \
                    php7.3-bcmath \
                    php-net-socket \
                    php-xml-util \
                    php-pear -yq

# RUN ls -la /etc/php/7.3/fpm/conf.d
# Config configuration
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf
RUN sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php/7.3/fpm/pool.d/www.conf
RUN sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php/7.3/fpm/pool.d/www.conf

# Clear de cache
RUN rm -f /var/cache/apk/*

# Installs wp command for the setup
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Change Directory
WORKDIR /var/www/html/

# Downloads Wordpress, unzip it, copy it to the present dir and deletes the source
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN rm -rf latest.tar.gz

WORKDIR /var/www/html/wordpress
COPY ./requirements/wordpress/conf .
COPY ./requirements/wordpress/conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# RUN chown -R www-data:www-data /var/www/html/wordpress

# Copies, run and delete a wp config script
COPY ./requirements/wordpress/tools/wp-config-create.sh .
RUN sh wp-config-create.sh && rm wp-config-create.sh

# Gives permision to all users
RUN chmod -R 0777 wp-content/

# Builds PHP version 7.3
CMD ["/usr/sbin/php-fpm7.3", "-F"]
