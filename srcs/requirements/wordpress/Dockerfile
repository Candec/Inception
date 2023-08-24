FROM debian:buster

# Packages to install
RUN apt-get update && apt-get upgrade && apt-get install -y unzip php7.3 php-fpm php-mysql wget sendmail

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

COPY .requirements/wordpress/tools /var/www/

RUN chmod +x /var/www/wordpress_start.sh

ENTRYPOINT [ "/var/www/wordpress_start.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
