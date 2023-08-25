#!/bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=PO/ST=Lisbon/L=Lisbon/O=42Lisboa/OU=42Lisboa-/CN=jibanez-.42.fr/";
fi

exec "$@"
