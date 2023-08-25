#!/bin/bash

echo "ENTERING THE CERTS SCRIPT!!!!!!";

if [ ! -f /etc/ssl/certs/nginx.crt ]; then

echo "Here I would create them";
touch test;

	# openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=EN/ST=London/L=London/O=wordpress/CN=jibanez-.42.fr";
fi

exec "$@"
