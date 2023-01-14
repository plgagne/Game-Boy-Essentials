#!/bin/zsh
# Copy Backup
if [ -r "temp" ]; then
		echo "Temporary timeline data is present."
else 
		echo "Copying temporary timeline data now."
		mkdir "temp"
		cp -R "/Users/plgagne/Documents/Game Boy Essentials Others/timeline project backup" "temp"
		echo "Done copying."
fi

# List number of titles in Backup
gameboy_number=$(find "temp/timeline project backup/gamefaqs.gamespot.com/gameboy" -mindepth 1 -maxdepth 1 -type d | wc -l)
gbc_number=$(find "temp/timeline project backup/gamefaqs.gamespot.com/gbc" -mindepth 1 -maxdepth 1 -type d | wc -l)

echo "Number of Game Boy titles in backup:" $gameboy_number
echo "Number of Game Boy Color titles in backup:" $gbc_number
total_number=$((gameboy_number+gbc_number))
echo "Total number of titles in backup:" $total_number

# Prune data.html files
echo "Pruning data files"
find "temp" -type f -name 'data.html' -print0 | while IFS= read -r -d '' line; do
sed "/<!doctype\ html>/,/<div\ class=\"span8\">/d" "$line" > "$line.tmp"
sed -i "" "/<div\ class=\"pod\ contrib\"><div\ class=\"head\"><h2 class=\"title\">Know\ Something\ We\ Don\'t?/,/<\/html>/d" "$line.tmp"
sed -i "" "/<script/,/<\/script>/d" "$line.tmp"
done

# Move data.html files to base
echo "Moving pruned data files"
find "temp" -type f -name '*.tmp' -print0 | while IFS= read -r -d '' line; do
dir="$(dirname $line)"   # Returns "/from/here/to"
dir="$(basename $dir)"  # Returns just "to"
mv "$line" "$line".tmp4
done

# Concatenate all files together
echo "Concatenating pruned data files"
find "temp" -iname "*.tmp4" -type f -exec cat "{}" >> "temp/timeline-temp.yaml" \;
# Remove concatenated files
find "temp" -iname "*.tmp" -type f -exec rm "{}" \;
# Run Ruby timeline builder
echo "Running Ruby script"
ruby timeline-builder.rb
# Remove blank lines in YAML file
echo "Removing blank lines in final file"
grep '\S' 'results/timeline-complete-data.yaml' > 'tmp.txt'
mv 'tmp.txt' 'results/timeline-complete-data.yaml'
#yamllint -d "{extends: default, rules: {quoted-strings: enable}}" "results/timeline-complete-data.yaml"
# Make timeline with only the releases
#ruby "timeline-releases-only.rb"