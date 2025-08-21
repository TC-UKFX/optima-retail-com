<?php
/**
 * WordPress Configuration File - Sample
 * Copy this file to wp-config.php and update the settings
 */

// ** MySQL settings ** //
define( 'DB_NAME', 'your_database_name' );
define( 'DB_USER', 'your_database_user' );
define( 'DB_PASSWORD', 'your_database_password' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );

// ** Authentication Unique Keys and Salts ** //
// Generate these at: https://api.wordpress.org/secret-key/1.1/salt/
define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );

// ** WordPress Database Table prefix ** //
$table_prefix = 'wp_';

// ** WordPress debugging ** //
define( 'WP_DEBUG', false );
define( 'WP_DEBUG_LOG', false );
define( 'WP_DEBUG_DISPLAY', false );

// ** SSL Settings ** //
define( 'FORCE_SSL_ADMIN', true );

// ** Memory Limits ** //
define( 'WP_MEMORY_LIMIT', '256M' );

// ** File Permissions ** //
define( 'FS_METHOD', 'direct' );

// ** That's all, stop editing! ** //
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';