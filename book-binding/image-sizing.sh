#!/bin/zsh
rm "/Users/plgagne/temp/assets/"
mkdir "/Users/plgagne/temp"
mkdir "/Users/plgagne/temp/assets"
cp -r "/Users/plgagne/Game Boy Essentials/assets/" "/Users/plgagne/temp/assets/"
cd "/Users/plgagne/temp/assets"

find "/Users/plgagne/temp/assets" -type f -name '*.png' -print0 | while IFS= read -r -d '' line; do
echo $line
magick mogrify -interpolate nearest -filter point -resize 800% $line
done