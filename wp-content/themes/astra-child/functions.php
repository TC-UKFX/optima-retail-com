<?php
// Enqueue parent theme styles
function astra_child_enqueue_styles() {
    wp_enqueue_style('astra-style', get_template_directory_uri() . '/style.css');
    wp_enqueue_style('astra-child-style', get_stylesheet_directory_uri() . '/style.css', array('astra-style'));
}
add_action('wp_enqueue_scripts', 'astra_child_enqueue_styles');

// Add hero section to homepage
function optima_add_hero_section() {
    if (is_front_page() || is_home()) {
        include get_stylesheet_directory() . '/hero-section.php';
    }
}
add_action('astra_header_after', 'optima_add_hero_section');
?>
