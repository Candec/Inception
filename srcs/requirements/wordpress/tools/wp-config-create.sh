#!bin/sh

set -x

cd /var/www/html/wordpress

if ! wp core is-installed --allow-root; then
	create admin
	wp core install --allow-root \
	--url=https://$DOMAIN_NAME \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL \
	create user
	wp user create --allow-root \
		$WP_USER_LOGIN \
		$WP_USER_EMAIL \
		--role=author \
		--user_pass=$WP_USER_PASS
fi
