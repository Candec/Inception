set -x

# cd /var/www/html/wordpress

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
