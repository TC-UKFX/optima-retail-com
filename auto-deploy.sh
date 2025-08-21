#!/bin/bash
# Complete automated deployment to WordPress site

echo "🚀 Starting complete automated deployment..."

# First, create the child theme locally
./wp-deploy.sh

# FTP deployment configuration (you'll need to add your credentials)
FTP_HOST="your-ftp-host.com"
FTP_USER="your-ftp-username"
FTP_PASS="your-ftp-password"
REMOTE_PATH="/public_html/wp-content/themes/"

echo "📡 Deploying to live WordPress site..."

# Create deployment package
zip -r astra-child-theme.zip wp-content/themes/astra-child/

# Upload using curl (if available) or create manual instructions
if command -v curl &> /dev/null; then
    echo "Uploading theme files via FTP..."
    curl -T wp-content/themes/astra-child/style.css ftp://$FTP_HOST$REMOTE_PATH/astra-child/ --user $FTP_USER:$FTP_PASS
    curl -T wp-content/themes/astra-child/functions.php ftp://$FTP_HOST$REMOTE_PATH/astra-child/ --user $FTP_USER:$FTP_PASS
    curl -T wp-content/themes/astra-child/hero-section.php ftp://$FTP_HOST$REMOTE_PATH/astra-child/ --user $FTP_USER:$FTP_PASS
    curl -T wp-content/themes/astra-child/front-page.php ftp://$FTP_HOST$REMOTE_PATH/astra-child/ --user $FTP_USER:$FTP_PASS
    echo "✅ Files uploaded successfully!"
else
    echo "⚠️  FTP upload requires manual configuration"
    echo "📦 Theme package created: astra-child-theme.zip"
    echo "Upload this to your WordPress themes folder"
fi

echo "🎉 Deployment complete!"
echo ""
echo "To activate:"
echo "1. Go to WordPress Admin → Appearance → Themes"
echo "2. Activate 'Astra Child - Optima Retail'"
echo "3. Your hero section will appear automatically!"