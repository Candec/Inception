FROM debian:10.11

RUN apt-get update -yq

RUN apt-get install vim -yq
RUN apt-get install curl -yq
RUN apt-get install wget -yq
RUN apt-get install php7.3-cli php7.3-fpm php7.3-mysql php7.3-json php7.3-opcache \
                    php7.3-mbstring php7.3-xml php7.3-cgi php-pear php7.3-zip \
                    php-net-socket php7.3-common php7.3-gd php7.3-curl \
                    php-xml-util php7.3-gettext php7.3-bcmath -yq

# php config
RUN	adduser -S nginx &&	addgroup -S nginx
COPY conf/php-fpm.conf /etc/php73/php-fpm.conf
COPY conf/www.conf /etc/php73/php-fpm.d/www.conf

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
