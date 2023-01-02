#!/bin/zsh
rm -rf "temp"
mkdir "temp"
mkdir "temp/assets"
cp -r "../assets/" "temp/assets/"
find "temp/assets" -type f -name '*.png' -print0 | while IFS= read -r -d '' line; do
    echo $line
    magick mogrify -interpolate nearest -filter point -resize 800% $line
done