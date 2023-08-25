FROM debian:buster
RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/start_nginx.sh /var/www/html
RUN sh /var/www/html/start_nginx.sh

RUN chmod +x /var/www/html/*

CMD ["nginx", "-g", "daemon off;"]
