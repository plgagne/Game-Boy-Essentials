#!/bin/zsh
# Set red for echo output
RED='\033[0;31m'

# Make resized social media card images
find "assets" -type f -name '*-start.png' -print0 | while IFS= read -r -d '' line; do
  filename="${line%.*}"
  finalname="${filename}-social-share-card.png"
  if [ ! -f "${finalname}" ]; then
    echo "${RED}Card image for "${line}" does not exist."
    cp "${line}" "${finalname}"
    magick mogrify -interpolate nearest -filter point -resize 437.5% "$finalname"
    magick mogrify -bordercolor black -border 250x0 "$finalname"
    echo "${RED}Card image "${finalname}" done."
  fi
done
echo "${RED}Card images checked."

# Batir le site
JEKYLL_ENV=production bundle exec jekyll build

# Trouver et enlever les fichiers de macOS
find "_site" -type f -name '.DS_store' -delete
echo "${RED}.DS_store in _site removed."