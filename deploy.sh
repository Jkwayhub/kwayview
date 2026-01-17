#!/bin/bash

# Quick deploy script for Kwayview
# Usage: ./deploy.sh "your commit message"

cd /Users/jkway/Kwayview

if [ -z "$1" ]; then
    echo "❌ Please provide a commit message"
    echo "Usage: ./deploy.sh \"your commit message\""
    exit 1
fi

echo "📦 Adding files..."
git add .

echo "💾 Committing changes..."
git commit -m "$1"

echo "🚀 Pushing to GitHub..."
git push

echo "✅ Done! Your changes will auto-deploy to Vercel in a few moments."
