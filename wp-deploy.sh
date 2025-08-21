#!/bin/bash
# Automated WordPress deployment script for hero section

echo "🚀 Starting automated WordPress deployment..."

# Create themes directory structure
mkdir -p wp-content/themes/astra-child

# Generate child theme files automatically
echo "📁 Creating child theme files..."

# Create style.css with theme header and hero section styles
cat > wp-content/themes/astra-child/style.css << 'EOF'
/*
Theme Name: Astra Child - Optima Retail
Description: Child theme for Astra with custom hero section
Template: astra
Version: 1.0.0
*/

/* Import parent theme styles */
@import url("../astra/style.css");

EOF

# Append hero section styles
cat hero-section-styles.css >> wp-content/themes/astra-child/style.css

# Create functions.php
cat > wp-content/themes/astra-child/functions.php << 'EOF'
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
EOF

# Create hero-section.php
cat > wp-content/themes/astra-child/hero-section.php << 'EOF'
<?php
// Hero Section Template
?>
EOF

# Add the HTML content to hero-section.php
cat hero-section-html.html >> wp-content/themes/astra-child/hero-section.php

# Create front-page.php for custom homepage
cat > wp-content/themes/astra-child/front-page.php << 'EOF'
<?php get_header(); ?>

<!-- Custom Hero Section -->
<?php include 'hero-section.php'; ?>

<!-- Rest of homepage content -->
<div id="primary" class="content-area">
    <main id="main" class="site-main">
        <?php
        while (have_posts()) :
            the_post();
            the_content();
        endwhile;
        ?>
    </main>
</div>

<?php get_footer(); ?>
EOF

echo "✅ Child theme created successfully!"

# Deploy to repository
echo "📤 Pushing to repository..."
git add .
git commit -m "Add automated WordPress child theme with hero section

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"

git push origin main
git push hostinger main

echo "🎉 Deployment complete! Your hero section is now integrated into WordPress."
echo ""
echo "Next steps:"
echo "1. Upload wp-content/themes/astra-child/ folder to your WordPress site"
echo "2. Activate 'Astra Child - Optima Retail' theme in WordPress admin"
echo "3. Your hero section will automatically appear on your homepage!"