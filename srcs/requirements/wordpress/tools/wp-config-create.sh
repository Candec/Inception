#!bin/sh

set -x

cd /var/www/html/wordpress

echo NOW I SHOULD INSTALL WP
if ! wp core is-installed --allow-root; then
	# create admin
	echo NOW I COINFIGURE WP
	wp core install --allow-root \
	--url=https://$DOMAIN_NAME \
	--title=$WP_TITLE \
	--admin_user=$ADMIN_USER \
	--admin_password=$ADMIN_PASSWORD \
	--admin_email=$ADMIN_EMAIL \
	#create user
	wp user create --allow-root \
		$WP_USER_LOGIN \
		$WP_USER_EMAIL \
		--role=author \
		--user_pass=$WP_USER_PASS
fi