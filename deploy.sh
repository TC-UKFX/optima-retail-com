#!/bin/bash
# Deploy script to push to both GitHub and Hostinger

echo "Pushing to GitHub..."
git push origin main

echo "Pushing to Hostinger..."
git push hostinger main

echo "Deployment complete!"