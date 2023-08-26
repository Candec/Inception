#!bin/sh

set -x

cd /var/www/html/wordpress

echo getenv('MYSQL_DATABASE')
echo $'MYSQL_DATABASE'

if ! wp core is-installed --allow-root; then
	# create admin
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
