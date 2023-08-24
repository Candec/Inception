FROM debian:10
RUN apt update
RUN apt upgrade
RUN apt install nginx
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
