<?php
/**
 * @link https://developer.wordpress.org/apis/wp-config-php/
 * @package WordPress
 */

// The name of the database for WordPress
define( 'DB_NAME', 'wordpress' );

// Database username
define( 'DB_USER', 'jibanez-' );

// Database password
define( 'DB_PASSWORD', '12345' );

// Database hostname
define( 'DB_HOST', 'mariadb' );

// Database charset to use in creating database tables.
define( 'DB_CHARSET', 'utf8' );

// The database collate type. Don't change this if in doubt.
define( 'DB_COLLATE', '' );


/**
 * @link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 **/

define('AUTH_KEY',         '44[IGM %PZ-+wPl+-xy6m/.E=j:0Uk$tE}MOr]au`-+TXV<H#-b|.el=*v=4/|eg');
define('SECURE_AUTH_KEY',  '&g1]2:[bvJ>#bc8Kl8K*pw}Ay{/KoCLJn+77>h%/Lqw5_L3WYc-BE|5M<V+i5vLZ');
define('LOGGED_IN_KEY',    '0H4]>v@{:]!,!hN-rD(i_[;cN>!Yx15t^3E*8_<y7VGown{E5h-;]zaI?I1*jSr.');
define('NONCE_KEY',        'bpC]awvu;BCN9y|0pN[vNF:aN`@6:+zKUM~f|NOJYWS;Jm.vb<Qgo[]Qe&_P?S=I');
define('AUTH_SALT',        '*mNf{[|`)&M+34,@{q4M_mwWa#R7. B D:]X Xl6-ZGfuCn1gJjC-H3G D@9=+NS');
define('SECURE_AUTH_SALT', 'H-JpT@Y[T[|}nTXvb8Xxo^@Al`D3n@A-xPV5ZlLls`V| oFf&k,zvtDG-lt8`1qD');
define('LOGGED_IN_SALT',   'wU-68+frKr$u)kZQ0Vt}h1_C@;Q8irZCy`HDE2.CQFEe#,5T`*w(Y5aW1{ZC-2?R');
define('NONCE_SALT',       '14$9.Q^]GUcbi[4{4Pmn]J-|g!<MPZ+UEY~ a/!-54{y|S~VEc5qWn%L![n-l^_Z');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', '/var/www/html/wordpress' );
}

require_once ABSPATH . 'wp-settings.php';
