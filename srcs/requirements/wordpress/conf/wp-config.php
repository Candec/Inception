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
echo getenv('$DB_NAME');
define( 'DB_NAME', getenv('$DB_NAME') );

/** Database username */
define( 'DB_USER', getenv('$DB_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('$DB_PASS') );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

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
define('AUTH_KEY',         '#Q>6v[ZI90gBZT<8FLd(>s1iyp9=j!h>>gR(B/@)uV<neGcO,2[kU6=zkC+`!K*1');
define('SECURE_AUTH_KEY',  'm>.pghCE18:Q8R>Dl_5 6,_EwvMo%/+-j!I8WWgUboN<5.,r~-;>L/N1h*kpK5OG');
define('LOGGED_IN_KEY',    'p[2-|+!yb7CP1RKKcn0B E+N~*XjMcwy(HC^WxWhiqI+xo2T`t,&#CN|q2y8Kh9(');
define('NONCE_KEY',        '$tJDjn#jMJ-5V+U.lOBqM>3-.|J9ggYQ^IXFwU*kdUN|D]3/#LWt<i+.w%!M(`-+');
define('AUTH_SALT',        'XnZ)lJW*}0yR0BT7pI+*5?FQsds[&fIHQD~jrzjX:RdJ^BfG7-3#ucdaVT3.|$x,');
define('SECURE_AUTH_SALT', '(yr:tJ^(zj_WX)TYpN&#{-xXmIag`c_SMz4Cu%6dB:;J+JEj.frr!_G?n^i(+ Os');
define('LOGGED_IN_SALT',   'z6hocX+J](fo^$e-7W*5Ba+us:L|sX$_6uV:F_Qkp%}3;I~L&6<fbkj)]=0itoD+');
define('NONCE_SALT',       'U7%U;%1Wtf)A9K-H-1wuZ`wcpb9HgzYq?PE--{@FD):GyR1Ko(-6)<tZuOp{DRR4');


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
