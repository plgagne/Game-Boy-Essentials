#!/bin/zsh

# Jekyll location
website_location=../website

# Scraped file backup location
backup_location="/Users/plgagne/Documents/Game Boy Essentials Others/timeline project backup"

# Set red for echo output
RED='\033[0;31m'

# Navigate to correct folder
cd timeline

# Copy Backup
if [ -r "temp" ]; then
  echo "${RED}Temporary timeline folder is present at timeline/temp. Delete to recreate."
else 
  echo "${RED}Copying temporary timeline data ..."
  mkdir "temp"
  cp -R  "$backup_location"/* "temp"
  echo "${RED}Done copying."
fi

# Make resized images 
if [ -r "${website_location}/assets/timeline/a" ]; then
    echo "${RED}Resized images exist."
else 
    echo "${RED}Resized images do not exist. Making them now:"
    find "temp" -type f -name '*.jpg' -print0 | while IFS= read -r -d '' line; do
        echo $line
        magick mogrify $line -resize 160 $line
    done
    echo "${RED}Moving resized images to assets folder ..."
    mv "temp/a" "${website_location}/assets/timeline/"
fi

# Prune data.html files
echo "${RED}Pruning data files ..."
find "temp" -type f -name 'data.html' -print0 | while IFS= read -r -d '' line; do
  sed "/<!doctype\ html>/,/<div\ class=\"span8\">/d" "$line" > "$line.tmp"
  sed -i "" "/<div\ class=\"pod\ contrib\"><div\ class=\"head\"><h2 class=\"title\">Know\ Something\ We\ Don\'t?/,/<\/html>/d" "$line.tmp"
  sed -i "" "/<script/,/<\/script>/d" "$line.tmp"
done

# Move data.html files to base
echo "${RED}Moving pruned data files ..."
find "temp" -type f -name '*.tmp' -print0 | while IFS= read -r -d '' line; do
  dir="$(dirname $line)"   # Returns "/from/here/to"
  dir="$(basename $dir)"  # Returns just "to"
  mv "$line" "$line".tmp
done

# Concatenate all files together
echo "${RED}Concatenating pruned data files ..."
find "temp" -iname "*.tmp" -type f -exec cat "{}" >> "temp/timeline-temp.yml" \;

# Run Ruby timeline builder
echo "${RED}Running Ruby script ..."
ruby timeline-builder.rb

# Remove temporary files
echo "${RED}Removing temporary files ..."
find "temp" -iname "*.yml" -type f -exec rm "{}" \;
find "temp" -iname "*.tmp" -type f -exec rm "{}" \;

# Remove blank lines in YAML file
echo "${RED}Removing blank lines in final file ..."
grep '\S' 'results/timeline-complete-data.yml' > 'tmp.txt'
mv 'tmp.txt' 'results/timeline-complete-data.yml'

# Prepending YAML start of file symbols
echo "${RED}Adding start of file symbols ..."
echo "---" | cat - 'results/timeline-complete-data.yml' > 'temp/out'
mv 'temp/out' 'results/timeline-complete-data.yml'

# Make timeline with only the releases
echo "${RED}Running Ruby script for hard releases only ..."
ruby "timeline-releases-only.rb"

# Validation check
yamllint -d "{extends: default, rules: {quoted-strings: enable,line-length: {max: 500}}}" "results/timeline-complete-data.yml"
yamllint -d "{extends: default, rules: {quoted-strings: enable,line-length: {max: 500}}}" "results/timeline-releases-only.yml"

# Compare number of titles
total_number=$(find "temp/games" -mindepth 1 -maxdepth 1 -type d | wc -l)
timeline_number=$(grep -o "game:" "results/timeline-complete-data.yml" | wc -l)
releases_number=$(grep -o "release:" "results/timeline-releases-only.yml" | wc -l)
echo "Total number of titles in backup:" $total_number
echo "Total number of titles in YAML file:" $timeline_number
echo "Total number of releases in hard releases YAML file:" $releases_number

# Convert to JSON
echo "${RED}Converting to JSON ..."
cat "results/timeline-releases-only.yml" | yj | jsonlint -s | cat > "results/timeline-releases-only.json"

# Move releases-only to _data folder
echo "${RED}Moving releases only file to _data folder ..."
cp "results/timeline-releases-only.json" "${website_location}/_data/timeline-releases-only.json"
