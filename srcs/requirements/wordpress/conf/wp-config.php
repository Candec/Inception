<!-- <?php -->
/**
 * @link https://developer.wordpress.org/apis/wp-config-php/
 * @package WordPress
 */

// The name of the database for WordPress
// define( 'DB_NAME', getenv('MYSQL_DATABASE') );

// Database username
// define( 'DB_USER', getenv('MYSQL_USER') );

// Database password
// define( 'DB_PASSWORD', getenv('MYSQL_PASSWORD') );

// Database hostname
// define( 'DB_HOST', ${MARIADB_HOST} );

// Database charset to use in creating database tables.
// define( 'DB_CHARSET', 'utf8' );

// The database collate type. Don't change this if in doubt.
// define( 'DB_COLLATE', '' );


/**
 * @link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 **/

// define('AUTH_KEY',         '44[IGM %PZ-+wPl+-xy6m/.E=j:0Uk$tE}MOr]au`-+TXV<H#-b|.el=*v=4/|eg');
// define('SECURE_AUTH_KEY',  '&g1]2:[bvJ>#bc8Kl8K*pw}Ay{/KoCLJn+77>h%/Lqw5_L3WYc-BE|5M<V+i5vLZ');
// define('LOGGED_IN_KEY',    '0H4]>v@{:]!,!hN-rD(i_[;cN>!Yx15t^3E*8_<y7VGown{E5h-;]zaI?I1*jSr.');
// define('NONCE_KEY',        'bpC]awvu;BCN9y|0pN[vNF:aN`@6:+zKUM~f|NOJYWS;Jm.vb<Qgo[]Qe&_P?S=I');
// define('AUTH_SALT',        '*mNf{[|`)&M+34,@{q4M_mwWa#R7. B D:]X Xl6-ZGfuCn1gJjC-H3G D@9=+NS');
// define('SECURE_AUTH_SALT', 'H-JpT@Y[T[|}nTXvb8Xxo^@Al`D3n@A-xPV5ZlLls`V| oFf&k,zvtDG-lt8`1qD');
// define('LOGGED_IN_SALT',   'wU-68+frKr$u)kZQ0Vt}h1_C@;Q8irZCy`HDE2.CQFEe#,5T`*w(Y5aW1{ZC-2?R');
// define('NONCE_SALT',       '14$9.Q^]GUcbi[4{4Pmn]J-|g!<MPZ+UEY~ a/!-54{y|S~VEc5qWn%L![n-l^_Z');

// $table_prefix = 'wp_';

// define( 'WP_DEBUG', false );

// if ( ! defined( 'ABSPATH' ) ) {
	// define( 'ABSPATH', '/var/www/html/wordpress' );
// }

// require_once ABSPATH . 'wp-settings.php';

<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('MYSQL_DATABASE') );

/** Database username */
define( 'DB_USER', getenv('MYSQL_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('MYSQL_PASSWORD') );

/** Database hostname */
define( 'DB_HOST', getenv('MYSQL_DB_HOST') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+                                                                                                                                        [38/1870]
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '44[IGM %PZ-+wPl+-xy6m/.E=j:0Uk$tE}MOr]au`-+TXV<H#-b|.el=*v=4/|eg');
define('SECURE_AUTH_KEY',  '&g1]2:[bvJ>#bc8Kl8K*pw}Ay{/KoCLJn+77>h%/Lqw5_L3WYc-BE|5M<V+i5vLZ');
define('LOGGED_IN_KEY',    '0H4]>v@{:]!,!hN-rD(i_[;cN>!Yx15t^3E*8_<y7VGown{E5h-;]zaI?I1*jSr.');
define('NONCE_KEY',        'bpC]awvu;BCN9y|0pN[vNF:aN`@6:+zKUM~f|NOJYWS;Jm.vb<Qgo[]Qe&_P?S=I');
define('AUTH_SALT',        '*mNf{[|`)&M+34,@{q4M_mwWa#R7. B D:]X Xl6-ZGfuCn1gJjC-H3G D@9=+NS');
define('SECURE_AUTH_SALT', 'H-JpT@Y[T[|}nTXvb8Xxo^@Al`D3n@A-xPV5ZlLls`V| oFf&k,zvtDG-lt8`1qD');
define('LOGGED_IN_SALT',   'wU-68+frKr$u)kZQ0Vt}h1_C@;Q8irZCy`HDE2.CQFEe#,5T`*w(Y5aW1{ZC-2?R');
define('NONCE_SALT',       '14$9.Q^]GUcbi[4{4Pmn]J-|g!<MPZ+UEY~ a/!-54{y|S~VEc5qWn%L![n-l^_Z');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
