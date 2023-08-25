FROM debian:buster
RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 443

COPY ./conf/default.conf.tmpl /default.conf.tmp
RUN mv default.conf.tmp /etc/nginx/conf.d/default.conf

COPY ./tools/start_nginx.sh /var/www/html
RUN chmod +r /var/www/html
# RUN chmod +r etc/nginx/ssl/jibanez-*

RUN sh /var/www/html/start_nginx.sh
RUN chmod +x /var/www/html

CMD ["nginx", "-g", "daemon off;"]
