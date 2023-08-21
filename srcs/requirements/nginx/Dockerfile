FROM alpine:3.18
RUN apk update
RUN apk upgrade
RUN apk add --no-cache nginx
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
