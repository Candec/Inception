#!bin/sh
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
# define( 'WP_REDIS_HOST', 'redis' );
# define( 'WP_REDIS_PORT', 6379 );
# define( 'WP_REDIS_TIMEOUT', 1 );
# define( 'WP_REDIS_READ_TIMEOUT', 1 );
# define( 'WP_REDIS_DATABASE', 0 );
require_once ABSPATH . 'wp-settings.php';
EOF
fi

cd /var/www/html/wordpress

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
