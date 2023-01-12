#!/bin/zsh

# Reset Project
rm -r "/Users/plgagne/sitesuck"
cp -R "/Users/plgagne/sitesuck-backup" "/Users/plgagne/sitesuck"

# Prune data.html files
find "/Users/plgagne/sitesuck" -type f -name 'data.html' -print0 | while IFS= read -r -d '' line; do
sed -i "" "/<!doctype\ html>/,/<div\ class=\"span8\">/d" "$line"
sed -i "" "/<div\ class=\"pod\ contrib\"><div\ class=\"head\"><h2 class=\"title\">Know\ Something\ We\ Don\'t?/,/<\/html>/d" "$line"
sed -i "" "/<script/,/<\/script>/d" "$line"
done

# Move data.html files to base
find "/Users/plgagne/sitesuck" -type f -name 'data.html' -print0 | while IFS= read -r -d '' line; do
dir="$(dirname $line)"   # Returns "/from/here/to"
dir="$(basename $dir)"  # Returns just "to"
mv "$line" "/Users/plgagne/sitesuck/$dir".txt
done

# Concatenate all file together
find "/Users/plgagne/sitesuck" -iname "*.txt" -type f -exec cat "{}" >> "/Users/plgagne/sitesuck/gbe-timeline.yaml" \;
find "/Users/plgagne/sitesuck" -iname "*.txt" -type f -exec rm "{}" \;
# Clean-up
find "/Users/plgagne/sitesuck" -name "gamefaqs.gamespot.com" -type d -prune -exec rm -r "{}" \;