set -x

# cd /var/www/html/wordpress

wp core download --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --prompt=$DB_PASS --dbhost="mariadb" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
wp core install --url=$DOMAIN_NAME/wordpress --title="Inception" --admin_user="master" --admin_password="Chief" --admin_email="master@chief.com" --skip-email --allow-root
wp user create candec candec@gmail.com --role=author --user_pass="abc123" --allow-root

if ! wp core is-installed --allow-root; then
	# create admin
	wp core install --allow-root \
	--url=https://$DOMAIN_NAME \
	--title=Inception \
	--admin_user=jesus \
	--admin_password=AbcHOLA_2 \
	--admin_email=jesus@gmail.com \
	#create user
	wp user create --allow-root \
		candec \
		candec@gmail.com \
		--role=author \
		--user_pass=AbcHOLA_2
fi
