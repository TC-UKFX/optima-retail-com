<?php
/**
 * One-click theme activation script
 * Upload this file to your WordPress root directory and visit it in browser
 */

// WordPress bootstrap
require_once('wp-config.php');
require_once('wp-load.php');

if (!current_user_can('manage_options')) {
    die('Access denied. Please log in as administrator.');
}

echo "<h1>🚀 Optima Retail Theme Activation</h1>";

// Check if child theme exists
$theme_path = get_theme_root() . '/astra-child';
if (!file_exists($theme_path)) {
    echo "<p style='color: red;'>❌ Child theme not found. Please upload the astra-child folder to /wp-content/themes/</p>";
    exit;
}

// Activate the child theme
$theme = 'astra-child';
if (switch_theme($theme)) {
    echo "<p style='color: green;'>✅ Theme activated successfully!</p>";
    echo "<p>Your hero section is now live on your website.</p>";
    
    // Set homepage to display posts (to show hero section)
    update_option('show_on_front', 'posts');
    
    echo "<p style='color: blue;'>📱 Visit your website to see the hero section!</p>";
    echo "<p><a href='" . home_url() . "' target='_blank'>View Your Website</a></p>";
} else {
    echo "<p style='color: red;'>❌ Failed to activate theme. Please check file permissions.</p>";
}

// Clean up - delete this file for security
unlink(__FILE__);
echo "<p><em>This activation file has been automatically deleted for security.</em></p>";
?>