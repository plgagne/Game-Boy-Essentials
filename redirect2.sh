#!/bin/zsh

# Set red for echo output
RED='\033[0;31m'

echo "${RED}Test ..."

find "_site/articles" -type f ! -name '*.*' -print0 | while IFS= read -r -d '' line; do
  echo line $line
  redirect1="${line}.html"
  redirect2="${line}/index.html"
  echo redirect1 $redirect1
  echo redirect2 $redirect2
  if [ ! -f "${redirect1}" ]; then
    echo $redirect1 missing
    touch $redirect1
  fi
done

# Make resized social media card images
# find "assets" -type f -name '*-start.png' -print0 | while IFS= read -r -d '' line; do
#   filename="${line%.*}"
#   finalname="${filename}-social-share-card.png"
#   if [ ! -f "${finalname}" ]; then
# 	echo "${RED}Card image for "${line}" does not exist."
# 	cp "${line}" "${finalname}"
# 	magick mogrify -interpolate nearest -filter point -resize 437.5% "$finalname"
# 	magick mogrify -bordercolor black -border 250x0 "$finalname"
# 	echo "${RED}Card image "${finalname}" done."
#   fi
# done

#find "_site/articles" ! -type f -name "html" -print0 | while IFS= read -r -d '' line; do
#  echo $line"/index.html"
#  aws s3api put-bucket-website --bucket "$aws_bucket" --website-configuration file://$file
#  echo $line".html"
#  aws s3api put-bucket-website --bucket "$aws_bucket" --website-configuration file://$file
#done