FROM debian:10
RUN apt-get update
RUN apt-get install -y nginx

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf
COPY ./tools/start_nginx.sh /var/www

CMD ["nginx", "-g", "daemon off;"]
