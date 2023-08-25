FROM debian:10
RUN apt-get update
RUN apt-get install -y nginx
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
