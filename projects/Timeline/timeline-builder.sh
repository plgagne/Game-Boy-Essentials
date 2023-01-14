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
gameboy_number='find "temp/timeline project backup/gamefaqs.gamespot.com/gameboy" -mindepth 1 -maxdepth 1 -type d | wc -l'
gbc_number='find "temp/timeline project backup/gamefaqs.gamespot.com/gbc" -mindepth 1 -maxdepth 1 -type d | wc -l'

echo "Number of Game Boy titles in backup:" $gameboy_number
echo "Number of Game Boy Color titles in backup:" $gbc_number

# Prune data.html files
find "temp" -type f -name 'data.html' -print0 | while IFS= read -r -d '' line; do
sed -i "" "/<!doctype\ html>/,/<div\ class=\"span8\">/d" "$line"
sed -i "" "/<div\ class=\"pod\ contrib\"><div\ class=\"head\"><h2 class=\"title\">Know\ Something\ We\ Don\'t?/,/<\/html>/d" "$line"
sed -i "" "/<script/,/<\/script>/d" "$line"
done

# Move data.html files to base
find "temp" -type f -name 'data.html' -print0 | while IFS= read -r -d '' line; do
dir="$(dirname $line)"   # Returns "/from/here/to"
dir="$(basename $dir)"  # Returns just "to"
mv "$line" "temp/$dir".txt
done

# Concatenate all files together
find "temp" -iname "*.txt" -type f -exec cat "{}" >> "temp/timeline-temp.yaml" \;
# Remove concatenated files
find "temp" -iname "*.txt" -type f -exec rm "{}" \;
# Run Ruby code
ruby timeline-builder.rb
# Remove blank lines
grep '\S' 'results/timeline-complete-data.yaml' > 'tmp.txt'
mv 'tmp.txt' 'results/timeline-complete-data.yaml'
cat 'results/timeline-complete-data.yaml'