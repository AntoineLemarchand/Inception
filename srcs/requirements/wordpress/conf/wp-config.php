<?php

define( 'DB_NAME', getenv("WP_DB_NAME") );
define( 'DB_USER', getenv("WP_DB_USER") );
define( 'DB_PASSWORD', getenv("WP_DB_PASSWORD") );
define( 'DB_HOST', getenv("WP_DB_HOST") );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

/*
define( 'AUTH_KEY',         'this is salty' );
define( 'SECURE_AUTH_KEY',  'like really salty' );
define( 'LOGGED_IN_KEY',    'too salty even' );
define( 'NONCE_KEY',        'so much salt...' );
define( 'AUTH_SALT',        '1234salt' );
define( 'SECURE_AUTH_SALT', 'oh that wasn\'t salt\!' );
define( 'LOGGED_IN_SALT',   'this is salt' );
define( 'NONCE_SALT',       'nonce salt ???' );
*/

$table_prefix='wp_';

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
