FROM debian:10
RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 443

COPY ./conf/nginx /etc/nginx/sites-enabled/nginx
COPY ./tools/start_nginx.sh /var/www

CMD ["nginx", "-g", "daemon off;"]
