#!/bin/zsh

# Jekyll location
website_location=../website

# This variable is the first volume to be bound
volume=1

# This variable is the last volume to be bound
last_volume=3

# Set red for echo output
RED='\033[0;31m'

# Navigate to correct folder
cd book-binding

# Make temp 
mkdir "temp"
if [ -r "temp/assets" ]; then
	echo "${RED}Book-sized images folder exists. Delete to recreate them."
else
	echo "${RED}Book-sized images do not exist. Making them now:"
	mkdir "temp/assets"
	cp -r "${website_location}/assets/" "temp/assets/"
	find "temp/assets" -type f -name '*.png' -print0 | while IFS= read -r -d '' line; do
		echo $line
		magick mogrify -interpolate nearest -filter point -resize 800% $line
	done
fi

# Copy _site-local into temp
echo "${RED}Copying all articles from tags structure ..."
cp -r "${website_location}_site-local/tag" "temp"

# Run binding on each volume
until [ $volume > $last_volume ]; do
	echo "${RED}Building book:" $volume
	echo "${RED}Making HTML version of introduction ..."
	kramdown volume-$volume-intro.md >temp/volume-$volume-intro.html
	echo "${RED}Merging introduction with articles ..."
	cat temp/volume-$volume-intro.html temp/tag/book$volume/index.html > temp/intermediate-current.html
	rm temp/volume-$volume-intro.html
	echo "${RED}Running Ruby file for book binding ..."
	ruby "bind.rb"
	cp temp/intermediate-current.tex temp/intermediate-$volume.tex
	rm temp/intermediate-current.html
	rm temp/intermediate-current.tex
	echo "${RED}Adding variables to bound book ..."
	cp volume-$volume-variables.tex temp/book-$volume.tex
	cat book.tex >> temp/book-$volume.tex
	cat temp/intermediate-$volume.tex >> temp/book-$volume.tex
	rm temp/intermediate-$volume.tex
	echo "\endgroup \end{document}" >> temp/book-$volume.tex
	echo "${RED}Running XeLaTeX:"
	xelatex temp/book-$volume.tex book-$volume.pdf
	mv book-$volume.aux temp/book-$volume.aux
	rm temp/book-$volume.aux
	mv book-$volume.log temp/book-$volume.log
	mv book-$volume.pdf temp/book-$volume.pdf
	volume=$(( $volume+1 ))
done