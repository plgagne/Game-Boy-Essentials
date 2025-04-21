#!/bin/zsh
RED='\033[0;31m'

# Jekyll location
website_location=../website

# Scraped file backup location
backup_location="/Users/plgagne/Documents/Game Boy Essentials Others/timeline project backup"

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
if [ -r "${website_location}/assets/timelines/a" ]; then
  echo "${RED}Resized images exist."
else
  echo "${RED}Resized images do not exist. Making them now:"
  find "temp" -type f -name '*.jpg' -print0 | while IFS= read -r -d '' line; do
    echo $line
    magick mogrify $line -resize 160 $line
  done
  echo "${RED}Moving resized images to assets folder ..."
  cp "temp/a" "${website_location}/assets/timelines/a"
fi

if [ -r "temp/timeline-temp.tmp" ]; then
  echo "${RED}Temp data has already been collated."
else
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
  find "temp" -iname "*.tmp" -type f -exec cat "{}" >> "temp/timeline-temp.tmp" \;
fi

# Run Ruby timeline builder
echo "${RED}Running YAML assembler ..."
ruby timeline-yaml-assembler.rb
# Validation check
echo "${RED}Validating YAML."
yamllint -d "{extends: default, rules: {quoted-strings: enable,line-length: {max: 500}}}" "temp/timeline.yml"

# Convert to JSON
echo "${RED}Converting YAML to JSON ..."
cat "temp/timeline.yml" | yj | jsonlint -s | cat > "temp/timeline.json"

# Finalize
echo "${RED}Creating final JSON files ..."
ruby timeline-finalizer.rb

# Compare number of titles
backup_number=$(find "temp/games" -mindepth 1 -maxdepth 1 -type d | wc -l)
yaml_number=$(grep -o "representative_name:" "temp/timeline.yml" | wc -l)
json_complete=$(grep -o  "representative_name" "results/timeline-complete.json" | wc -l)
json_releases=$(grep -o  "title" "results/timeline-releases.json" | wc -l)

echo "Total number of titles in backup:" $backup_number
echo "Total number of titles in YAML file:" $yaml_number
echo "Total number of titles in JSON file:" $json_complete
echo "Total number of releases in JSON releases file:" $json_releases

# Copy JSON files to _data folder
echo "${RED}Moving results files to _data folder ..."
cp "results/timeline-releases.json" "${website_location}/_data/"
cp "results/timeline-complete.json" "${website_location}/_data/"