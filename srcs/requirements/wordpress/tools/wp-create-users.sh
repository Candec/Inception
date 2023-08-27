set -x

# cd /var/www/html/wordpress

wp core download --allow-root

if [ ! -f "/var/www/wp-config.php" ]; then
cat << EOF > /var/www/wp-config.php
<?php
define( 'DB_NAME', '${DB_NAME}' );
define( 'DB_USER', '${DB_USER}' );
define( 'DB_PASSWORD', '${DB_PASS}' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('FS_METHOD','direct');
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
require_once ABSPATH . 'wp-settings.php';
EOF
fi

# wp config create --dbname=$DB_NAME --dbuser=$DB_USER --prompt=$DB_PASS --dbhost="mariadb" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
wp core install --url=$DOMAIN_NAME/wordpress --title="Inception" --admin_user="master" --admin_password="chief" --admin_email="master@chief.com" --skip-email --allow-root
wp user create candec candec@gmail.com --role=author --user_pass="abc123" --allow-root

# if ! wp core is-installed --allow-root; then
# 	# create admin
# 	wp core install --allow-root \
# 	--url=https://$DOMAIN_NAME \
# 	--title=Inception \
# 	--admin_user=jesus \
# 	--admin_password=AbcHOLA_2 \
# 	--admin_email=jesus@gmail.com \
# 	#create user
# 	wp user create --allow-root \
# 		candec \
# 		candec@gmail.com \
# 		--role=author \
# 		--user_pass=AbcHOLA_2
# fi
