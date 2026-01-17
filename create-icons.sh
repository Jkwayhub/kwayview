#!/bin/bash

echo "Creating Kwayview icons from SVG..."

# Check if we can use the logo.svg file directly
if command -v rsvg-convert &> /dev/null; then
    echo "Using rsvg-convert..."
    rsvg-convert -w 192 -h 192 logo.svg -o icon-192.png
    rsvg-convert -w 512 -h 512 logo.svg -o icon-512.png
    rsvg-convert -w 32 -h 32 logo.svg -o favicon.png
    echo "✓ Icons created successfully!"
elif command -v inkscape &> /dev/null; then
    echo "Using inkscape..."
    inkscape logo.svg --export-filename=icon-192.png -w 192 -h 192
    inkscape logo.svg --export-filename=icon-512.png -w 512 -h 512
    inkscape logo.svg --export-filename=favicon.png -w 32 -h 32
    echo "✓ Icons created successfully!"
elif command -v convert &> /dev/null; then
    echo "Using ImageMagick..."
    convert logo.svg -resize 192x192 icon-192.png
    convert logo.svg -resize 512x512 icon-512.png
    convert logo.svg -resize 32x32 favicon.png
    echo "✓ Icons created successfully!"
else
    echo "❌ No SVG converter found. Please use one of these options:"
    echo ""
    echo "Option 1: Use an online converter"
    echo "  1. Go to https://cloudconvert.com/svg-to-png"
    echo "  2. Upload logo.svg"
    echo "  3. Convert to sizes: 192x192, 512x512, 32x32"
    echo ""
    echo "Option 2: Install a converter"
    echo "  brew install librsvg  # Then run this script again"
    exit 1
fi

ls -lh icon-*.png favicon.png 2>/dev/null
